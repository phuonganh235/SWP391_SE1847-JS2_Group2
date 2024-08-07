/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Manager;

import dal.CouponsDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Random;
import model.Coupons;

/**
 *
 * @author phuan
 */
public class manageCoupons extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO uDao = new UserDAO();
        CouponsDAO couponDao = new CouponsDAO();
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            String password = (String) session.getAttribute("password");

            if (uDao.getRole(username) == 1 || uDao.getRole(username) == 4) {
                String service = request.getParameter("service");
                if (service == null) {
                    service = "listAllCoupon";
                    return;
                }
                if (service.equals("listAllCoupon")) {
                    ArrayList<Coupons> list = couponDao.getAllCoupons();
                    request.setAttribute("couponList", list);
                    request.getRequestDispatcher("ViewAdmin/manageCoupons.jsp").forward(request, response);
                }

                if (service.equals("insert")) {
                    String code = request.getParameter("couponCode");
                    String description = request.getParameter("description");
                    double discountAmount = Double.parseDouble(request.getParameter("discountAmount"));
                    String startDateStr = request.getParameter("startDate");
                    String endDateStr = request.getParameter("endDate");
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    int isActive = (quantity > 0) ? 1 : 0;

                    if (code == null || code.isEmpty()) {
                        code = generateRandomCouponCode();
                    }
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                    LocalDateTime startDate = LocalDateTime.parse(startDateStr, formatter);
                    LocalDateTime endDate = LocalDateTime.parse(endDateStr, formatter);
                    java.sql.Timestamp startTimestamp = java.sql.Timestamp.valueOf(startDate);
                    java.sql.Timestamp endTimestamp = java.sql.Timestamp.valueOf(endDate);
                    String startDateString = startTimestamp.toString();
                    String endDateString = endTimestamp.toString();
                    Coupons coupon = new Coupons(0, code, description, discountAmount, startDateString, endDateString, quantity, isActive);
                    couponDao.insertCoupons(coupon);
                    response.sendRedirect("manageCoupons?service=listAllCoupon");
                }

                if (service.equals("update")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Coupons coupon = couponDao.getCouponById(id);
                    request.setAttribute("CouponIdUpdate", coupon);
                    request.getRequestDispatcher("manageCoupons?service=listAllCoupon").forward(request, response);
                }
                if (service.equals("edit")) {
                    int idCoupon = Integer.parseInt(request.getParameter("couponid"));
                    String code = request.getParameter("couponCode");
                    String description = request.getParameter("description");
                    double discountAmount = Double.parseDouble(request.getParameter("discountAmount"));
                    String startDateStr = request.getParameter("startDate");
                    String endDateStr = request.getParameter("endDate");
                    int quantity = Integer.parseInt(request.getParameter("quantity"));

                    if (code == null || code.isEmpty()) {
                        code = generateRandomCouponCode();
                    }

                    int isActive = (quantity > 0) ? 1 : 0;
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                    LocalDateTime startDate = LocalDateTime.parse(startDateStr, formatter);
                    LocalDateTime endDate = LocalDateTime.parse(endDateStr, formatter);
                    java.sql.Timestamp startTimestamp = java.sql.Timestamp.valueOf(startDate);
                    java.sql.Timestamp endTimestamp = java.sql.Timestamp.valueOf(endDate);
                    String startDateString = startTimestamp.toString();
                    String endDateString = endTimestamp.toString();
                    Coupons coupon = new Coupons(idCoupon, code, description, discountAmount, startDateString, endDateString, quantity, isActive);
                    couponDao.updateCoupon(coupon);
                    response.sendRedirect("manageCoupons?service=listAllCoupon");
                }

                if (service.equals("delete")) {
                    String id_raw = request.getParameter("id");
                    int id;
                    try {
                        id = Integer.parseInt(id_raw);
                        couponDao.deleteCoupon(id);
                        request.getRequestDispatcher("manageCoupons?service=listAllCoupon").forward(request, response);
                    } catch (NumberFormatException e) {
                    }
                }
            } else {
                response.sendRedirect("login");
            }
        }
    }

    private String generateRandomCouponCode() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder couponCode = new StringBuilder();
        Random rnd = new Random();
        while (couponCode.length() < 6) {
            int index = (int) (rnd.nextFloat() * characters.length());
            couponCode.append(characters.charAt(index));
        }
        return couponCode.toString();
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
