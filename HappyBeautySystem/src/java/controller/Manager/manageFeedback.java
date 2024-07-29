package controller.Manager;

import dal.FeedbackDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Feedback;

public class manageFeedback extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        FeedbackDAO dao = new FeedbackDAO();
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
                ArrayList<Feedback> feedback = dao.getAllFeedbacks();
                request.setAttribute("feedback", feedback);
                request.getRequestDispatcher("/ViewAdmin/manageFeedback.jsp").forward(request, response);
            }

            if (service.equals("add")) {
                String aboutIdStr = request.getParameter("aboutId");
                Integer aboutId = null;
                if (aboutIdStr != null && !aboutIdStr.trim().isEmpty()) {
                    try {
                        aboutId = Integer.parseInt(aboutIdStr);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                }
                
            }

            if (service.equals("update")) {
                
            }
            //Editing a about
            if (service.equals("edit")) {
                
            }
            //Deleting a about
            if (service.equals("delete")) {
               
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
