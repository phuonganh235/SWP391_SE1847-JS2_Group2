package controller.Manager;

import common.CommonDAO;
import dal.InforOrderDetailDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.UserDAO;
import dal.UserShipOrderDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.InforOrderDetail;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.User;
//ToanLV 

@WebServlet(name = "managerOrder", urlPatterns = {"/managerOrder"})
public class managerOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String service = request.getParameter("service");
        OrderDAO daoOrder = new OrderDAO();
        OrderDetailDAO daoOrderDetail = new OrderDetailDAO();
        UserDAO daoUser = new UserDAO();
        UserShipOrderDAO daoUserShipOrder = new UserShipOrderDAO();
        InforOrderDetailDAO daoInforOrderDetail = new InforOrderDetailDAO();
        HttpSession session = request.getSession(true);
        User inforUser = (User) session.getAttribute("inforUserLogin");
        CommonDAO common = new CommonDAO();
        try (PrintWriter out = response.getWriter()) {
            String username = (String) session.getAttribute("username");
            String password = (String) session.getAttribute("password");

            if (daoUser.getRole(username, password) == 1 || daoUser.getRole(username, password) == 4) {
                if (service.equals("showAll")) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("ViewAdmin/managerOrder.jsp");
                    dispatcher.forward(request, response);
                }
                if (service.equals("listAllOrder")) {
                    int Statuss = Integer.parseInt(request.getParameter("status"));
                    if (Statuss == 1) {
                        List<Order> listOrder = daoOrder.getOrdersByStatus(Statuss);
                        request.setAttribute("listAllOrder", listOrder);
                        request.getRequestDispatcher("ViewAdmin/managerOrder.jsp").forward(request, response);
                    } else {
                        List<Order> listOrder = daoOrder.getOrdersByStatus(Statuss);
                        request.setAttribute("listAllOrder", listOrder);
                        request.getRequestDispatcher("ViewAdmin/managerConfirmOrder.jsp").forward(request, response);
                    }
                }
                if (service.equals("viewConfirmOrder")) {
                    String orderID = request.getParameter("orderID");
                    int orderDetailInt = Integer.parseInt(orderID);
                    String customerID = request.getParameter("CustomerID");
                    // list order detail
                    List<OrderDetail> listOrderDetail = daoOrderDetail.getOrderDetailsByOrderId(orderDetailInt);
                    // infor customer
                    User user = daoUser.getUserById(customerID);
                    //get order
                    Order newOrder = daoOrder.getOrderById(orderDetailInt);
                    //get infor order detail
                    InforOrderDetail ipOrderDetail = daoInforOrderDetail.getInforOrderDetailByOrderId(orderDetailInt);
                    //List Shiper
                    List<User> listShipper = daoUser.getUserByRoleIdAndStatus(3, 3);
                    request.setAttribute("listOrderDetail", listOrderDetail);
                    request.setAttribute("customerInfor", user);
                    request.setAttribute("listShipper", listShipper);
                    request.setAttribute("informationOrder", newOrder);
                    request.setAttribute("inforOrderDetail", ipOrderDetail);
                    request.getRequestDispatcher("ViewAdmin/confirmOrder.jsp").forward(request, response);
                }
                if (service.equals("viewDetailShipping")) {
                    String orderID = request.getParameter("orderID");
                    int orderIDInt = Integer.parseInt(orderID);
                    int orderDetailInt = Integer.parseInt(orderID);
                    String customerID = request.getParameter("CustomerID");
                    // list order detail
                    //get order
                    Order newOrder = daoOrder.getOrderById(orderDetailInt);
                    //get infor order detail
                    InforOrderDetail ipOrderDetail = daoInforOrderDetail.getInforOrderDetailByOrderId(orderDetailInt);
                    //List Shiper
                    List<OrderDetail> listOrderDetail = daoOrderDetail.getOrderDetailsByOrderId(orderDetailInt);
                    // infor customer
                    User user = daoUser.getUserById(customerID);
                    //List Shiper
                    int idShipper = daoUserShipOrder.getUserIDByOrderID(orderIDInt);

                    User newUser = daoUser.getUserById("" + idShipper);
                    request.setAttribute("informationOrder", newOrder);
                    request.setAttribute("inforOrderDetail", ipOrderDetail);
                    request.setAttribute("listOrderDetail", listOrderDetail);
                    request.setAttribute("customerInfor", user);
                    request.setAttribute("inforShipper", newUser);
                    request.getRequestDispatcher("ViewAdmin/viewDetailShipping.jsp").forward(request, response);
                }
                if (service.equals("confirm")) {
                    int orderID = Integer.parseInt(request.getParameter("OrderID"));
                    int shipeerID = Integer.parseInt(request.getParameter("ShipperID"));
                    String dateNow = common.getDateTimeNow();
                    //staff ID session
                    daoUserShipOrder.addUserShipOrder(orderID, shipeerID, dateNow, 4);
                    //
                    daoOrder.updateOrderStatus(orderID, 2);
                    //
                    List<Order> listOrder = daoOrder.getOrdersByStatus(1);
                    request.setAttribute("listAllOrder", listOrder);
                    request.getRequestDispatcher("ViewAdmin/managerOrder.jsp").forward(request, response);
                }
                if (service.equals("viewOrderToday")) {
                    // list order today
                    ArrayList<Order> orderToday = daoOrder.getBillByDay();
                    request.setAttribute("listAllOrder", orderToday);
                    request.getRequestDispatcher("ViewAdmin/viewOrderToday.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("login");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
