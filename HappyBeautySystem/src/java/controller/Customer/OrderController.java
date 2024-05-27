package controller.Customer;

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
import java.util.AbstractList;
import java.util.List;
import model.Cart;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.User;

@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

    // ToanLV
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
            if (service.equals("showAll")) {
                int userId = inforUserLogin.getUserId();  // Thay giá trị này khi có thông tin người dùng
                List<Cart> listCart = cart.getAllCartsByUserId(userId);
                request.setAttribute("listCart", listCart);
                RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/checkout.jsp");
                dispatcher.forward(request, response);
                return;
            }
            if (service.equals("confirmOrder")) {
                String dateNow = commmon.getDateTimeNow();
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String idpayment = request.getParameter("paymentMethod");
                int idPaymentInt = Integer.parseInt(idpayment);
                Order newOrder = new Order(inforUserLogin.getUserId(), idPaymentInt, dateNow, true, name, address, phone, idPaymentInt);
                //add order
                int idADD = daoOrder.insertOrderGetID(newOrder);
                List<Cart> listCart = cart.getAllCartsByUserId(inforUserLogin.getUserId());
                for (Cart cart1 : listCart) {
                    //add order detail 
                    Product pro = daoProduct.getProductById(cart1.getProductId());
                    detailDAO.addOrderDetail(idADD, cart1.getProductId(), cart1.getQuantity(), pro.getPrice());
                    // update product
                    daoProduct.updateProductQuantityTru(cart1.getProductId(), cart1.getQuantity());

                }
                // delete cart 
                cart.deleteCartsByUserId(inforUserLogin.getUserId());
                RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/order-successfull.jsp");
                dispatcher.forward(request, response);
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
