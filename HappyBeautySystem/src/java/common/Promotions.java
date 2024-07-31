/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package common;

import dal.PromotionDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;

public class Promotions extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            PromotionDAO dao = new PromotionDAO();
            String service = request.getParameter("service");
            UserDAO uDao = new UserDAO();
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            String password = (String) session.getAttribute("password");

            if (uDao.getRole(username, password) == 2 || uDao == null) {
                if (service == null) {
                    service = "listall";
                }
                if (service.equals("listall")) {
                    ArrayList<model.Promotions> promotion = dao.getAllPromotions();
                    int page = 0, numberPage = 4;
                    int size = promotion.size();
                    int num = (size % 4 == 0 ? (size / 4) : ((size / 4) + 1));
                    String indexPage = request.getParameter("page");
                    if (indexPage == null) {
                        page = 1;
                    } else {
                        page = Integer.parseInt(indexPage);
                    }
                    int start, end;
                    start = (page - 1) * numberPage;
                    end = Math.min(page * numberPage, size);
                    ArrayList<model.Promotions> promotionPage = dao.getListByPage(promotion, start, end);
                    request.setAttribute("page", page);
                    request.setAttribute("num", num);
                    request.setAttribute("listP", promotionPage);
                    request.getRequestDispatcher("/ViewUser/promotion.jsp").forward(request, response);
                }
                if (service.equals("promotiondetail")) {
                    String proCode = request.getParameter("promotion_id");
                    model.Promotions promotion = dao.getPromotionById(proCode);
                    request.setAttribute("P", promotion);
                    request.getRequestDispatcher("/ViewUser/promotionDetail.jsp").forward(request, response);
                }
//                if (service.equals("checkCoupon")) {
//                    String couponCode = request.getParameter("couponCode");
//                    model.Coupons coupon = couponDao.getCouponByCode(couponCode);
//                    JSONObject jsonResponse = new JSONObject();
//                    if (coupon != null) {
//                        jsonResponse.put("valid", true);
//                        jsonResponse.put("discountAmount", coupon.getDiscountAmount());
//                    } else {
//                        jsonResponse.put("valid", false);
//                    }
//                    response.setContentType("application/json");
//                    response.setCharacterEncoding("UTF-8");
//                    out.print(jsonResponse);
//                    out.flush();
//                }
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
