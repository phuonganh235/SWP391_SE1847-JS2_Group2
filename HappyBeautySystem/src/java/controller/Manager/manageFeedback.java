package controller.Manager;

import dal.FeedbackDAO;
import dal.ProductDAO;
import dal.RepFeedbackDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Feedback;
import model.Product;
import model.RepFeedback;
import model.User;

public class manageFeedback extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        FeedbackDAO dao = new FeedbackDAO();
        ProductDAO daoP = new ProductDAO();
        RepFeedbackDAO repDao = new RepFeedbackDAO();
        UserDAO uDao = new UserDAO();
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (uDao.getRole(username, password) == 1 || uDao.getRole(username, password) == 4) {
            if (service == null) {
                service = "listall";
            }
            if (service.equals("listall")) {
                ArrayList<RepFeedback> repfeedback = repDao.getAllRepFeedback();
                request.setAttribute("repfb", repfeedback);
                ArrayList<Feedback> feedback = dao.getAllFeedbacks();
                request.setAttribute("feedback", feedback);
                int countReview = dao.countReview();
                request.setAttribute("countReview", countReview);
                double goodReview = dao.getGoodRatingRatio() * 100;
                request.setAttribute("goodReview", goodReview);
                int badReview = dao.countNegativeFeedbacks();
                request.setAttribute("badReview", badReview);

                
                request.getRequestDispatcher("/ViewAdmin/manageFeedback.jsp").forward(request, response);
            }
            if (service.equals("filterByStar")) {
                int star = Integer.parseInt(request.getParameter("star"));
                ArrayList<Feedback> feedback = dao.getFeedbackByStar(star);
                request.setAttribute("feedback", feedback);

                int countReview = dao.countReview();
                request.setAttribute("countReview", countReview);
                double goodReview = dao.getGoodRatingRatio() * 100;
                request.setAttribute("goodReview", goodReview);
                int badReview = dao.countNegativeFeedbacks();
                request.setAttribute("badReview", badReview);
                request.getRequestDispatcher("/ViewAdmin/manageFeedback.jsp").forward(request, response);
            }
            
            //Updating a category
            if (service.equals("add")) {
                int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
                Feedback fb = dao.getFeedbackById(feedbackId);               
                request.setAttribute("fb", fb);
                ArrayList<Feedback> feedback = dao.getAllFeedbacks();
                request.setAttribute("feedback", feedback);
                int countReview = dao.countReview();
                request.setAttribute("countReview", countReview);
                double goodReview = dao.getGoodRatingRatio() * 100;
                request.setAttribute("goodReview", goodReview);
                int badReview = dao.countNegativeFeedbacks();
                request.setAttribute("badReview", badReview);
                request.getRequestDispatcher("/ViewAdmin/manageFeedback.jsp").forward(request, response);
            }
            
            
            
            if (service.equals("addRep")) {
                String repIdStr = request.getParameter("repId");
                Integer repId = null;
                if (repIdStr != null && !repIdStr.trim().isEmpty()) {
                    try {
                        repId = Integer.parseInt(repIdStr);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                }
               
                int feedbackId =Integer.parseInt(request.getParameter("fbid"));
                int userId = Integer.parseInt(request.getParameter("userid"));
                String comment = request.getParameter("comment");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String createDate = sdf.format(new Date());
                RepFeedback repFeedback = new RepFeedback(repId, feedbackId, userId, comment, createDate);
                repDao.addRepFeedback(repFeedback);
                response.sendRedirect("managefeedback");
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
    }

}
