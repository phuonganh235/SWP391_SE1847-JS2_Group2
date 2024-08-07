/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customer;

import dal.RoleDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Role;
import model.User;

/**
 *
 * @author phthh
 */
public class ManageRole extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO uDao = new UserDAO();
        RoleDAO roleDao = new RoleDAO();
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        if (uDao.getRole(username) == 1) {
            // Default service to "listall" if no service parameter is provided
            if (service == null) {
                service = "listall";
            }
            // Listing all products
            if (service.equals("listall")) {
                ArrayList<User> promotion = uDao.getAllUser("SELECT * FROM Users");
                request.setAttribute("listP", promotion);
                request.getRequestDispatcher("ViewAdmin/viewAllAccount.jsp").forward(request, response);
            }
            // Update role
            if (service.equals("updateRole")) {
                int roleId = Integer.parseInt(request.getParameter("id"));
                int userId = Integer.parseInt(request.getParameter("userId"));
                int n = uDao.updateUserRole(roleId, userId);

                if (n > 0) {
                    response.getWriter().println("User role updated successfully.");
                } else {
                    response.getWriter().println("Failed to update user role.");
                }

                ArrayList<User> promotion = uDao.getAllUser("SELECT * FROM Users");
                request.setAttribute("listP", promotion);
                request.getRequestDispatcher("ViewAdmin/viewAllAccount.jsp").forward(request, response);
            }
            if (service.equals("saveRole")) {
                int roleId = Integer.parseInt(request.getParameter("roleId"));
                int userId = Integer.parseInt(request.getParameter("userId"));

                // Update role for the user or other logic
                int n = uDao.updateUserRole(roleId, userId);

                if (n > 0) {
                    response.getWriter().println("Role saved successfully.");
                } else {
                    response.getWriter().println("Failed to save role.");
                }
                ArrayList<User> promotion = uDao.getAllUser("SELECT * FROM Users");
                request.setAttribute("listP", promotion);
                // Redirect or forward to another page if needed
                response.sendRedirect("managerole");
            }

        } else {
            response.sendRedirect("login");
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
