package controller.Staff;

import dal.OrderDAO;
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
import model.Order;
import model.User;

@WebServlet(name = "managerShipper", urlPatterns = {"/managerShipper"})
public class managerShipper extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String service = request.getParameter("service");
        HttpSession session = request.getSession(true);
        User inforUser = (User) session.getAttribute("inforUserLogin");
        UserShipOrderDAO userShipOrderDAO = new UserShipOrderDAO();
        OrderDAO orderDAO = new OrderDAO();
        try (PrintWriter out = response.getWriter()) {
            if ("showTask".equals(service)) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/view-manager-shipper.jsp");
                dispatcher.forward(request, response);
            }
            if ("ListTask".equals(service)) {
                String option = request.getParameter("option");
                int optionInt = 0;
                try {
                    optionInt = Integer.parseInt(option);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    // Handle invalid option value, perhaps redirect to an error page or show an error message
                }

                int userId = inforUser.getUserId();
                List<Order> listOrder = new ArrayList<>();
                ArrayList<Integer> listOrderID = new ArrayList<>();
                switch (optionInt) {
                    case 1:
                        request.setAttribute("op", "0");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUser/manager-order.jsp");
                        dispatcher.forward(request, response);
                        break;
                    case 2:
                        listOrderID = userShipOrderDAO.getOrderIDsByUserID(userId);
                        for (int i = 0; i < listOrderID.size(); i++) {
                            Order newOrder = orderDAO.getOrderByOrderIdAndStatus(listOrderID.get(i), 2);
                            if (newOrder != null) {
                                listOrder.add(newOrder);
                            }
                        }
                        request.setAttribute("op", "1");
                        request.setAttribute("option", "2");
                        request.setAttribute("listOrder", listOrder);
                        RequestDispatcher dispatcher1 = request.getRequestDispatcher("ViewUser/view-manager-shipper.jsp");
                        dispatcher1.forward(request, response);
                        break;
                    case 3:
                        listOrder = orderDAO.getOrdersByUserIdAndStatus(userId, 2);
                        request.setAttribute("listOrder", listOrder);
                        request.setAttribute("op", "2");
                        RequestDispatcher dispatcher2 = request.getRequestDispatcher("ViewUser/manager-order.jsp");
                        dispatcher2.forward(request, response);
                        break;
                    case 4:
                        listOrder = orderDAO.getOrdersByUserIdAndStatus(userId, 3);
                        request.setAttribute("listOrder", listOrder);
                        request.setAttribute("op", "3");
                        RequestDispatcher dispatcher3 = request.getRequestDispatcher("ViewUser/manager-order.jsp");
                        dispatcher3.forward(request, response);
                        break;
                    case 5:
                        listOrder = orderDAO.getOrdersByUserIdAndStatus(userId, 4);
                        request.setAttribute("listOrder", listOrder);
                        request.setAttribute("op", "4");
                        RequestDispatcher dispatcher4 = request.getRequestDispatcher("ViewUser/manager-order.jsp");
                        dispatcher4.forward(request, response);
                        break;
                    default:
                        // Handle invalid option
                        break;
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
