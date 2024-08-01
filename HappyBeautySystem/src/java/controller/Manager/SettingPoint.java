/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Manager;

import dal.PointConfigDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.PointConfig;

/**
 *
 * @author phuan
 */
public class SettingPoint extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            PointConfigDAO poinConfigDao = new PointConfigDAO();
            if (service == null) {
                service = "update";
            }

            if (service.equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                PointConfig pointConfig = poinConfigDao.getConfigById(id);
                request.setAttribute("PointConfigUpdate", pointConfig);
                request.getRequestDispatcher("ViewAdmin/PointOrderSetting.jsp").forward(request, response);
            }
            if (service.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean isEnabled = request.getParameter("isEnabled") != null;
                int pointsPerAmount = Integer.parseInt(request.getParameter("pointsPerAmount"));
                int pointsEarned = Integer.parseInt(request.getParameter("pointsEarned"));
                int pointsRedeemed = Integer.parseInt(request.getParameter("pointsRedeemed"));
                int redeemValue = Integer.parseInt(request.getParameter("redeemValue"));

                PointConfig updatedConfig = new PointConfig(id, isEnabled, pointsPerAmount, pointsEarned, pointsRedeemed, redeemValue);
                poinConfigDao.update(updatedConfig);
                response.sendRedirect("SettingPoint?service=update&id=1");
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
