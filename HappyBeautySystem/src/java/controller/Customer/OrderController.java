package controller.Customer;

import Utils.ConfigVNpay;
import Utils.ConfigMomo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import common.CommonDAO;
import dal.CartDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.TreeMap;
import model.Cart;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.User;

// ToanLV
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        CommonDAO commmon = new CommonDAO();
        CartDAO cart = new CartDAO();
        OrderDAO daoOrder = new OrderDAO();
        ProductDAO daoProduct = new ProductDAO();
        OrderDetailDAO detailDAO = new OrderDetailDAO();
        User inforUserLogin = (User) session.getAttribute("inforUserLogin");
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (inforUserLogin == null) {
                response.sendRedirect("login");
            } else {
                // Show all cart
                if (service.equals("showAll")) {
                    //chek login
                    int userId = inforUserLogin.getUserId();  // Thay giá trị này khi có thông tin người dùng
                    List<Cart> listCart = cart.getAllCartsByUserId(userId);
                    request.setAttribute("listCart", listCart);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/checkout.jsp");
                    dispatcher.forward(request, response);
                    return;
                }
                // User confirm order
                if (service.equals("confirmOrder")) {

                    String dateNow = commmon.getDateTimeNow();
                    String name = request.getParameter("name");
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    String idpayment = request.getParameter("paymentMethod");
                    int idPaymentInt = Integer.parseInt(idpayment);
                    Order newOrder = new Order(inforUserLogin.getUserId(), idPaymentInt, dateNow, true, name, address, phone, idPaymentInt);
                    int orderId = daoOrder.insertOrderGetID(newOrder);

                    if (idPaymentInt == 3) {
                        //add order

                        List<Cart> listCart = cart.getAllCartsByUserId(inforUserLogin.getUserId());
                        for (Cart cart1 : listCart) {
                            //add order detail 
                            Product pro = daoProduct.getProductById(cart1.getProductId());
                            detailDAO.addOrderDetail(orderId, cart1.getProductId(), cart1.getQuantity(), pro.getPrice());
                            // update product
                            daoProduct.updateProductQuantityTru(cart1.getProductId(), cart1.getQuantity());

                        }
                        // delete  cart 
                        cart.deleteCartsByUserId(inforUserLogin.getUserId());
                        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/order-successfull.jsp");
                        dispatcher.forward(request, response);
                    }

                    if (idPaymentInt == 2) {

                        double total_cost = Double.parseDouble(request.getParameter("total_cost"));
                        String vnp_Version = "2.1.0";
                        String vnp_Command = "pay";
                        String vnp_OrderInfo = "" + String.valueOf(orderId);
                        String orderType = "billpayment";
                        String vnp_TxnRef = String.valueOf(orderId) + "";
                        String vnp_IpAddr = ConfigVNpay.getIpAddress(request);
                        String vnp_TmnCode = ConfigVNpay.vnp_TmnCode;

                        double amount = Math.round(total_cost) * 100;
                        Map<String, String> vnp_Params = new HashMap<>();
                        vnp_Params.put("vnp_Version", vnp_Version);
                        vnp_Params.put("vnp_Command", vnp_Command);
                        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
                        vnp_Params.put("vnp_Amount", String.valueOf(amount));
                        vnp_Params.put("vnp_CurrCode", "VND");
                        String bank_code = "";
                        if (bank_code != null && bank_code.isEmpty()) {
                            vnp_Params.put("vnp_BankCode", bank_code);
                        }
                        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
                        vnp_Params.put("vnp_OrderType", orderType);

                        String locate = "vi";
                        if (locate != null && !locate.isEmpty()) {
                            vnp_Params.put("vnp_Locale", locate);
                        } else {
                            vnp_Params.put("vnp_Locale", "vn");
                        }
                        vnp_Params.put("vnp_ReturnUrl", ConfigVNpay.vnp_ReturnUrl);
                        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

                        Date dt = new Date();
                        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                        String dateString = formatter.format(dt);
                        String vnp_CreateDate = dateString;
                        String vnp_TransDate = vnp_CreateDate;
                        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

                        //Build data to hash and querystring
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
                                hashData.append(fieldValue);
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
                        String queryUrl = query.toString();
                        String vnp_SecureHash = ConfigVNpay.hmacSHA512(ConfigVNpay.secretKey, hashData.toString());
                        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
                        String paymentUrl = ConfigVNpay.vnp_PayUrl + "?" + queryUrl;
                        request.setAttribute("code", "00");
                        request.setAttribute("message", "success");
                        request.setAttribute("data", paymentUrl);
//                OrderDao od = new OrderDao();
//                od.updateStatusOrder(id, 2);
                        response.sendRedirect(paymentUrl);

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
    }// </editor-fold>
}
