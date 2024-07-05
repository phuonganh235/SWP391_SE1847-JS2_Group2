package controller.Customer;

import Utils.ConfigVNpay;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import common.CommonDAO;
import dal.CartDAO;
import dal.CouponsDAO;
import dal.InforOrderDetailDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Order;
import model.Product;
import model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import model.InforOrderDetail;

@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

    private List<Cart> _list = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        CommonDAO common = new CommonDAO();
        CartDAO cart = new CartDAO();
        OrderDAO daoOrder = new OrderDAO();
        ProductDAO daoProduct = new ProductDAO();
        OrderDetailDAO detailDAO = new OrderDetailDAO();
        User inforUserLogin = (User) session.getAttribute("inforUserLogin");
        InforOrderDetailDAO daoInforOrderDetail = new InforOrderDetailDAO();

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (inforUserLogin == null) {
                response.sendRedirect("login");
            } else {
                // Show all cart
                if ("showAll".equals(service)) {
                    int userId = inforUserLogin.getUserId();
                    String[] listProductId = request.getParameterValues("id");
                    List<Cart> vector = new ArrayList<>();

                    // Lấy danh sách các sản phẩm từ giỏ hàng của userId
                    for (String id : listProductId) {
                        Cart cartItem = cart.getCartByUserIdAndProductId(userId, Integer.parseInt(id));
                        if (cartItem != null) {
                            vector.add(cartItem);
                        }
                    }
                    _list = vector;
                    // Đặt danh sách sản phẩm vào thuộc tính request để gửi tới checkout.jsp
                    request.setAttribute("listCart", vector);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/checkout.jsp");
                    dispatcher.forward(request, response);
                    return;
                }

                // User confirm order
                if ("confirmOrder".equals(service)) {
                    String dateNow = common.getDateTimeNow();
                    String name = inforUserLogin.getName();
                    String nameCustomer = inforUserLogin.getUsername();
                    //tinh
                    String tinh = request.getParameter("tinh");
                    //
                    String selectedQuan = request.getParameter("selectedQuan");
                    String selectedPhuong = request.getParameter("selectedPhuong");
                    //
                    //chi tiet
                    String chiTiet = request.getParameter("AddressDetail");
                    //day du
                    String addressFull = chiTiet + "-" + selectedPhuong + "-" + selectedQuan + "-" + "Thành Phố Hà Nội";
                    //
                    String ghiChu = request.getParameter("note");
                    //
                    String tu = request.getParameter("fromTime");
                    //
                    String den = request.getParameter("toTime");
                    //date 
                    String date = request.getParameter("deliveryDate");
                    String phone = request.getParameter("phone");
                    String idpayment = request.getParameter("paymentMethod");
                    int idPaymentInt = Integer.parseInt(idpayment);

                    if (idPaymentInt == 1) {
                        Order newOrder = new Order(inforUserLogin.getUserId(), idPaymentInt, dateNow, true, name, addressFull, phone, idPaymentInt);
                        //add order
                        int idADD = daoOrder.insertOrderGetID(newOrder);
                        List<Cart> listCart = _list;
                        for (Cart cart1 : listCart) {
                            //add order detail
                            Product pro = daoProduct.getProductById(cart1.getProductId());
                            detailDAO.addOrderDetail(idADD, cart1.getProductId(), cart1.getQuantity(), pro.getPrice());
                            // update product
                            daoProduct.updateProductQuantityTru(cart1.getProductId(), cart1.getQuantity());
                        }
                        // add order infor detail
                        InforOrderDetail newInforOrderDetail = new InforOrderDetail(idADD, "Thành Phố Hà Nội", selectedPhuong, selectedQuan, chiTiet, ghiChu, tu, den, date);
                        daoInforOrderDetail.insertInforOrderDetail(newInforOrderDetail);
                        // delete cart
                        for (Cart cart1 : _list) {
                            cart.deleteCartByProductIdAndUserId(cart1.getProductId(), inforUserLogin.getUserId());
                        }
                        String couponCode = request.getParameter("couponCode");
                        if (couponCode != null && !couponCode.isEmpty()) {
                            CouponsDAO couponDAO = new CouponsDAO();
                            couponDAO.updateCouponQuantity(couponCode);
                        }
                        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/order-successfull.jsp");
                        dispatcher.forward(request, response);
                    }
                    if (idPaymentInt == 2) {
                        String couponCode = request.getParameter("couponCode");
                        if (couponCode != null && !couponCode.isEmpty()) {
                            session.setAttribute("couponCode", couponCode);
                        }
                        String vnp_Version = "2.1.0";
                        String vnp_Command = "pay";
                        String orderType = "other";
                        long amount = 1000000 * 100;
                        String bankCode = "";
                        String vnp_TxnRef = ConfigVNpay.getRandomNumber(8);
                        String vnp_IpAddr = ConfigVNpay.getIpAddress(request);
                        String vnp_TmnCode = ConfigVNpay.vnp_TmnCode;
                        session.setAttribute("orderName", name);
                        session.setAttribute("orderAddress", addressFull);
                        session.setAttribute("orderPhone", phone);

                        Map<String, String> vnp_Params = new HashMap<>();
                        vnp_Params.put("vnp_Version", vnp_Version);
                        vnp_Params.put("vnp_Command", vnp_Command);
                        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
                        vnp_Params.put("vnp_Amount", String.valueOf(amount));
                        vnp_Params.put("vnp_CurrCode", "VND");

                        if (bankCode != null && !bankCode.isEmpty()) {
                            vnp_Params.put("vnp_BankCode", bankCode);
                        }
                        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
                        vnp_Params.put("vnp_OrderType", orderType);

                        String locate = request.getParameter("language");
                        if (locate != null && !locate.isEmpty()) {
                            vnp_Params.put("vnp_Locale", locate);
                        } else {
                            vnp_Params.put("vnp_Locale", "vn");
                        }
                        vnp_Params.put("vnp_ReturnUrl", ConfigVNpay.vnp_ReturnUrl);
                        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

                        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
                        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                        String vnp_CreateDate = formatter.format(cld.getTime());
                        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

                        cld.add(Calendar.MINUTE, 15);
                        String vnp_ExpireDate = formatter.format(cld.getTime());
                        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

                        List fieldNames = new ArrayList(vnp_Params.keySet());
                        Collections.sort(fieldNames);
                        StringBuilder hashData = new StringBuilder();
                        StringBuilder query = new StringBuilder();
                        Iterator itr = fieldNames.iterator();
                        while (itr.hasNext()) {
                            String fieldName = (String) itr.next();
                            String fieldValue = (String) vnp_Params.get(fieldName);
                            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                                //Build hash data
                                hashData.append(fieldName);
                                hashData.append('=');
                                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                                //Build query
                                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                                query.append('=');
                                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                                if (itr.hasNext()) {
                                    query.append('&');
                                    hashData.append('&');
                                }
                            }
                        }
                        ConfigVNpay.transaction.put(vnp_TxnRef, 0);
                        String queryUrl = query.toString();
                        String vnp_SecureHash = ConfigVNpay.hmacSHA512(ConfigVNpay.secretKey, hashData.toString());
                        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
                        String paymentUrl = ConfigVNpay.vnp_PayUrl + "?" + queryUrl;
                        response.sendRedirect(paymentUrl);

                        return;

                    }

                }
                // thanh toan thanh cong qua vnpay service tra ve thong tin thanh toan
                if (service.equals("vnpay_return")) {

                    String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
                    if (vnp_ResponseCode.equals("00") && ConfigVNpay.transaction.getOrDefault(request.getParameter("vnp_TxnRef"), 1) == 0) {
                        // Payment successful
                        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
                        String vnp_Amount = request.getParameter("vnp_Amount");
                        String name = (String) session.getAttribute("orderName");
                        String address = (String) session.getAttribute("orderAddress");
                        String phone = (String) session.getAttribute("orderPhone");
                        String dateNow = common.getDateTimeNow();

                        Order newOrder = new Order(inforUserLogin.getUserId(), 2, dateNow, true, name, address, phone, 1);
                        //add order
                        int idADD = daoOrder.insertOrderGetID(newOrder);
                        //add orrder detail
                        List<Cart> listCart = _list;
                        for (Cart cart1 : _list) {
                            Product pro = daoProduct.getProductById(cart1.getProductId());
                            detailDAO.addOrderDetail(idADD, cart1.getProductId(), cart1.getQuantity(), pro.getPrice());
                            daoProduct.updateProductQuantityTru(cart1.getProductId(), cart1.getQuantity());
                        }
                        //delete cart

                        for (Cart cart1 : _list) {
                            cart.deleteCartByProductIdAndUserId(cart1.getProductId(), inforUserLogin.getUserId());
                        }
                        session.removeAttribute("orderName");
                        session.removeAttribute("orderAddress");
                        session.removeAttribute("orderPhone");
                        ConfigVNpay.transaction.put(vnp_TxnRef, 1);
                        request.setAttribute("orderSuccess", true);
                        request.setAttribute("orderId", idADD);
                        String couponCode = (String) session.getAttribute("couponCode");
                        if (couponCode != null && !couponCode.isEmpty()) {
                            CouponsDAO couponDAO = new CouponsDAO();
                            couponDAO.updateCouponQuantity(couponCode);
                            session.removeAttribute("couponCode"); // Xóa mã giảm giá khỏi session sau khi sử dụng
                        }
                        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/order-successfull.jsp");
                        dispatcher.forward(request, response);

                    } else {
                        response.sendRedirect("home");
                    }
                }

            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
