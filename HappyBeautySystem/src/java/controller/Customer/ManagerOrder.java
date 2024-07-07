package controller.Customer;

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
import java.util.List;
import model.Cart;
import model.Order;
import model.OrderDetail;
import model.User;

// ToanLV
@WebServlet(name = "ManagerOrder", urlPatterns = {"/ManagerOrder"})
public class ManagerOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        OrderDAO orderDAO = new OrderDAO();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ProductDAO productDAO = new ProductDAO();
        User inforUser = (User) session.getAttribute("inforUserLogin");
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (inforUser == null) {
                response.sendRedirect("login");
            } else {
                if (service == null) {
                    request.getRequestDispatcher("ViewUser/managerOrder.jsp").forward(request, response);
                }
                if (service.equals("managerOrder")) {
                    String option = request.getParameter("option");
                    int optionInt = Integer.parseInt(option);
                    int userId = inforUser.getUserId();

                    List<Order> listOrder = null;
                    switch (optionInt) {
                        case 0:
                            request.setAttribute("op", "0");
                            request.setAttribute("op", "0");
                            break;
                        case 1:
                            listOrder = orderDAO.getOrdersByUserIdAndStatus(userId, 1);
                            request.setAttribute("op", "1");
                            request.setAttribute("ch", "1");
                            break;
                        case 2:
                            listOrder = orderDAO.getOrdersByUserIdAndStatus(userId, 2);
                            request.setAttribute("op", "2");
                            request.setAttribute("ch", "2");
                            break;
                        case 3:
                            listOrder = orderDAO.getOrdersByUserIdAndStatus(userId, 3);
                            request.setAttribute("op", "3");
                            request.setAttribute("ch", "3");
                            break;
                        case 4:
                            listOrder = orderDAO.getOrdersByUserIdAndStatus(userId, 4);
                            request.setAttribute("op", "4");
                            request.setAttribute("ch", "4");
                            break;
                        default:
                            // Handle invalid option
                            response.sendRedirect("ViewUser/error.jsp");
                            return;
                    }

                    // Forward to JSP with list of orders if available
                    if (listOrder != null) {
                        request.setAttribute("listOrder", listOrder);
                    }

                    RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/manager-order.jsp");
                    dispatcher.forward(request, response);
                }
                if (service.equals("orderDetail")) {
                    String orderID = request.getParameter("orderid");
                    int odi = Integer.parseInt(orderID);
                    List<OrderDetail> list = orderDetailDAO.getOrderDetailsByOrderId(odi);
                    request.setAttribute("listDetail", list);
                    RequestDispatcher dispatcher4 = request.getRequestDispatcher("ViewUser/manager-order-detail.jsp");
                    dispatcher4.forward(request, response);
                }
                // delete
                if (service.equals("delete")) {
                    String orderID = request.getParameter("orderid");
                    int odi = Integer.parseInt(orderID);
                    //hoi
                    List<OrderDetail> listOrderDetail = orderDetailDAO.getOrderDetailsByOrderId(odi);
                    for (OrderDetail orderDetail : listOrderDetail) {
                        productDAO.updateProductQuantityPlus(orderDetail.getProductID(), orderDetail.getQuantity());
                    }
                    //
                    orderDAO.deleteOrderAndDetails(odi);
                    response.sendRedirect("/HappyBeautySystem/ManagerOrder?service=managerOrder&option=1");
                }
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
