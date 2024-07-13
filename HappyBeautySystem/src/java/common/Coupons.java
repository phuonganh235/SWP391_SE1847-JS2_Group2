/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package common;

import dal.CouponsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author phuan
 */
public class Coupons extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            CouponsDAO couponDao = new CouponsDAO();
            String service = request.getParameter("service");

            if (service == null) {
                service = "listall";
            }
            if (service.equals("listall")) {
                ArrayList<model.Coupons> list = couponDao.getAllCoupons();
                int page = 0, numberPage = 8;
                int size = list.size();
                int num = (size % 8 == 0 ? (size / 8) : ((size / 8) + 1));
                String indexPage = request.getParameter("page");
                if (indexPage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(indexPage);
                }
                int start, end;
                start = (page - 1) * numberPage;
                end = Math.min(page * numberPage, size);
                ArrayList<model.Coupons> couponPage = couponDao.getListByPage(list, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("couponList", couponPage);
                request.getRequestDispatcher("/ViewUser/Coupons.jsp").forward(request, response);
            }
            if (service.equals("checkCoupon")) {
                String couponCode = request.getParameter("couponCode");
                model.Coupons coupon = couponDao.getCouponByCode(couponCode);
                JSONObject jsonResponse = new JSONObject();
                if (coupon != null) {
                    jsonResponse.put("valid", true);
                    jsonResponse.put("discountAmount", coupon.getDiscountAmount());
                } else {
                    jsonResponse.put("valid", false);
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                out.print(jsonResponse);
                out.flush();
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
