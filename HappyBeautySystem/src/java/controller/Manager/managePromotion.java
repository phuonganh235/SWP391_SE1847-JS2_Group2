package controller.Manager;

import dal.PromotionDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import model.Promotions;

public class managePromotion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO uDao = new UserDAO();
        PromotionDAO dao = new PromotionDAO();
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        if (uDao.getRole(username) == 1 || uDao.getRole(username) == 4) {
            // Default service to "listall" if no service parameter is provided
            if (service == null) {
                service = "listall";
            }
            // Listing all products
            if (service.equals("listall")) {
                ArrayList<Promotions> promotion = dao.getAllPromotions();
                request.setAttribute("listP", promotion);
                request.getRequestDispatcher("ViewAdmin/managePromotion.jsp").forward(request, response);
            }
            // Adding a new promotion
            if (service.equals("add")) {
                String promoCode = request.getParameter("promoCode");
                String promoName = request.getParameter("promoName");
                String start = request.getParameter("start");
                String end = request.getParameter("end");
                int status = request.getParameter("isActive") != null ? 1 : 0;

                String description = request.getParameter("description");
                double discountAmount = Double.parseDouble(request.getParameter("discountAmount"));
                double condition = Float.parseFloat(request.getParameter("condition"));
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                LocalDateTime startDate = LocalDateTime.parse(start, formatter);
                LocalDateTime endDate = LocalDateTime.parse(end, formatter);
                java.sql.Timestamp startTimestamp = java.sql.Timestamp.valueOf(startDate);
                java.sql.Timestamp endTimestamp = java.sql.Timestamp.valueOf(endDate);
                String startDateString = startTimestamp.toString();
                String endDateString = endTimestamp.toString();
                Promotions promotion = new Promotions(0, promoCode, promoName, startDateString, endDateString, status, description, discountAmount, condition);
                dao.addPromotion(promotion);
                response.sendRedirect("managepromotion");
            }
//
//            //Updating a product
            if (service.equals("update")) {
                String id = request.getParameter("idUpdate");
                Promotions promotion = dao.getPromotionById(id);
                request.setAttribute("PromotionIdUpdate", promotion);
                request.getRequestDispatcher("managepromotion?service=listall").forward(request, response);
            }
//            //Editing a product
            if (service.equals("edit")) {
                int idCoupon = Integer.parseInt(request.getParameter("couponid"));
                String code = request.getParameter("couponcode");
                String name = request.getParameter("couponname");
                String description = request.getParameter("description");
                int status = request.getParameter("isActive") != null ? 1 : 0;
                double discountAmount = Double.parseDouble(request.getParameter("discountAmount"));
                double condition = Double.parseDouble(request.getParameter("condition"));
                String startDateStr = request.getParameter("startDate");
                String endDateStr = request.getParameter("endDate");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                LocalDateTime startDate = LocalDateTime.parse(startDateStr, formatter);
                LocalDateTime endDate = LocalDateTime.parse(endDateStr, formatter);
                java.sql.Timestamp startTimestamp = java.sql.Timestamp.valueOf(startDate);
                java.sql.Timestamp endTimestamp = java.sql.Timestamp.valueOf(endDate);
                String startDateString = startTimestamp.toString();
                String endDateString = endTimestamp.toString();
                Promotions promotion = new Promotions(idCoupon, code, name, startDateString, endDateString, status, description, discountAmount, condition);
                dao.updatePromotion(promotion);
                response.sendRedirect("managepromotion");
            }
            //Deleting a product
            if (service.equals("delete")) {
                String promotionId = request.getParameter("id");
                dao.deletePromotion(promotionId);
                response.sendRedirect("managepromotion");
            }

        } else {
            response.sendRedirect("login");
        }
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
