package controller.Customer;

import common.CommonDAO;
import dal.CartDAO;
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
import java.util.ArrayList;
import java.util.List;

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
                    String name = request.getParameter("name");
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    String idpayment = request.getParameter("paymentMethod");
                    int idPaymentInt = Integer.parseInt(idpayment);
                    Order newOrder = new Order(inforUserLogin.getUserId(), idPaymentInt, dateNow, true, name, address, phone, idPaymentInt);

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
                    // delete cart
                    for (Cart cart1 : _list) {
                        cart.deleteCartByProductIdAndUserId(cart1.getProductId(), inforUserLogin.getUserId());
                    }
                    RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/order-successfull.jsp");
                    dispatcher.forward(request, response);
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
