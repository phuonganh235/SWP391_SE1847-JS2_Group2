/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Manager;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Order;

public class Dashboard extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter pr = response.getWriter();
            UserDAO uDao = new UserDAO();
            ProductDAO pDao = new ProductDAO();
            OrderDAO oDao = new OrderDAO();
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            String password = (String) session.getAttribute("password");

            if (uDao.getRole(username) == 1 || uDao.getRole(username) == 4) {
                int countproductReview = pDao.countReview(1);
                int countCustomer = uDao.CountUser();
                int countProduct = pDao.countProduct();
                int countOrder = oDao.CountOrder();
                int countLow = pDao.CountLowStock();
                ArrayList<Order> billbyday = oDao.getBillByDay();
                ArrayList<Order> top3Customer = oDao.getTop2Customer();
                request.setAttribute("review", countproductReview);
                request.setAttribute("user", countCustomer);
                request.setAttribute("product", countProduct);
                request.setAttribute("order", countOrder);
                request.setAttribute("low", countLow);
                request.setAttribute("billbyday", billbyday);
                request.setAttribute("top3Customer", top3Customer);

//                Chart
                OrderDetailDAO dao = new OrderDetailDAO();
                //get data of Money by Month
                double m1 = dao.getTotalMoneyByMonth(1);
                double m2 = dao.getTotalMoneyByMonth(2);
                double m3 = dao.getTotalMoneyByMonth(3);
                double m4 = dao.getTotalMoneyByMonth(4);
                double m5 = dao.getTotalMoneyByMonth(5);
                double m6 = dao.getTotalMoneyByMonth(6);
                double m7 = dao.getTotalMoneyByMonth(7);
                double m8 = dao.getTotalMoneyByMonth(8);
                double m9 = dao.getTotalMoneyByMonth(9);
                double m10 = dao.getTotalMoneyByMonth(10);
                double m11 = dao.getTotalMoneyByMonth(11);
                double m12 = dao.getTotalMoneyByMonth(12);

                request.setAttribute("m1", m1);
                request.setAttribute("m2", m2);
                request.setAttribute("m3", m3);
                request.setAttribute("m4", m4);
                request.setAttribute("m5", m5);
                request.setAttribute("m6", m6);
                request.setAttribute("m7", m7);
                request.setAttribute("m8", m8);
                request.setAttribute("m9", m9);
                request.setAttribute("m10", m10);
                request.setAttribute("m11", m11);
                request.setAttribute("m12", m12);

                //get all of product on each category 
                int cat1 = dao.getTotalProductByCategory(1);
                int cat2 = dao.getTotalProductByCategory(2);
                int cat3 = dao.getTotalProductByCategory(3);
                int cat4 = dao.getTotalProductByCategory(4);
                int cat5 = dao.getTotalProductByCategory(5);
                int cat6 = dao.getTotalProductByCategory(6);
                int cat7 = dao.getTotalProductByCategory(7);
                int cat8 = dao.getTotalProductByCategory(8);
                int cat9 = dao.getTotalProductByCategory(9);
                int cat10 = dao.getTotalProductByCategory(10);

                request.setAttribute("cat1", cat1);
                request.setAttribute("cat2", cat2);
                request.setAttribute("cat3", cat3);
                request.setAttribute("cat4", cat4);
                request.setAttribute("cat5", cat5);
                request.setAttribute("cat6", cat6);
                request.setAttribute("cat7", cat7);
                request.setAttribute("cat8", cat8);
                request.setAttribute("cat9", cat9);
                request.setAttribute("cat10", cat10);
                request.getRequestDispatcher("/ViewAdmin/dashboard.jsp").forward(request, response);
            } else {
                response.sendRedirect("login");
            }
        } catch (Exception e) {
//            response.sendRedirect("404.jsp");
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
