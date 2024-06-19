/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Manager;

import dal.CouponsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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

        CouponsDAO couponDao = new CouponsDAO();
        try (PrintWriter out = response.getWriter()) {
//           int count = couponDao.getTotalCoupon();
//           int endPage = count/3;
//           if(count % 3 != 0){
//           endPage++;
//           }
//           request.setAttribute("endP", endPage);

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
                String isActiveStr = request.getParameter("isActive");

                if (code == null || code.isEmpty()) {
                    code = generateRandomCouponCode();
                }

                int isActive = (isActiveStr != null && isActiveStr.equals("on")) ? 1 : 0;
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                LocalDateTime startDate = LocalDateTime.parse(startDateStr, formatter);
                LocalDateTime endDate = LocalDateTime.parse(endDateStr, formatter);
                java.sql.Timestamp startTimestamp = java.sql.Timestamp.valueOf(startDate);
                java.sql.Timestamp endTimestamp = java.sql.Timestamp.valueOf(endDate);
                String startDateString = startTimestamp.toString();
                String endDateString = endTimestamp.toString();
                Coupons coupon = new Coupons(0, code, description, discountAmount, startDateString, endDateString, isActive);
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
                String isActiveStr = request.getParameter("isActive");

                if (code == null || code.isEmpty()) {
                    code = generateRandomCouponCode();
                }

                int isActive = (isActiveStr != null && isActiveStr.equals("on")) ? 1 : 0;
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                LocalDateTime startDate = LocalDateTime.parse(startDateStr, formatter);
                LocalDateTime endDate = LocalDateTime.parse(endDateStr, formatter);
                java.sql.Timestamp startTimestamp = java.sql.Timestamp.valueOf(startDate);
                java.sql.Timestamp endTimestamp = java.sql.Timestamp.valueOf(endDate);
                String startDateString = startTimestamp.toString();
                String endDateString = endTimestamp.toString();
                Coupons coupon = new Coupons(idCoupon, code, description, discountAmount, startDateString, endDateString, isActive);
                couponDao.updateCoupon(coupon);
                response.sendRedirect("manageCoupons?service=listAllCoupon");
            }
            
            if(service.equals("delete")){
                 String id_raw = request.getParameter("id");
                int id;
                try {
                    id = Integer.parseInt(id_raw);
                   couponDao.deleteCoupon(id);
                    request.getRequestDispatcher("manageCoupons?service=listAllCoupon").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }
            
            if(service.equals("search")){
                String search = request.getParameter("search");
                int count = couponDao.count(search);
                int pageSize = 6;
                int endPage = 0;
                endPage = count / pageSize;
                if(count % pageSize != 0){
                endPage++;
                }
                request.setAttribute("end",  endPage);
                request.getRequestDispatcher("manageCoupons?service=listAllCoupon").forward(request, response);
            

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
