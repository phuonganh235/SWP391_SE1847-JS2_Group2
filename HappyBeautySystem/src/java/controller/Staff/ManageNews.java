package controller.Staff;

import dal.NewsDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Category;
import model.News;

@WebServlet(name = "ManageNews", urlPatterns = {"/managenews"})
public class ManageNews extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        NewsDAO newsDAO = new NewsDAO();
        String service = request.getParameter("service");
        String submit = request.getParameter("submit");

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        UserDAO uDao = new UserDAO();

        if (username == null || password == null) {
            response.sendRedirect("login");
            return;
        }

        int userRole = uDao.getRole(username, password);

        if (service == null || service.isEmpty()) {
            service = "viewAllNews";
        }

        if ("viewAllNews".equals(service)) {
            ArrayList<News> newsList = newsDAO.viewAllNews();
            ArrayList<Category> categories = newsDAO.getAllCategories();
            request.setAttribute("newsList", newsList);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/ViewAdmin/manageNews.jsp").forward(request, response);
        } else if ("addnews".equals(service)) {
            if (submit == null) {
                ArrayList<Category> categories = newsDAO.getAllCategories();
                request.setAttribute("categories", categories);
                request.getRequestDispatcher("/ViewAdmin/manageNews.jsp").forward(request, response);
            } else {
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                String imgUrl = request.getParameter("ImageURL");
                int categoryID = Integer.parseInt(request.getParameter("CategoryID"));
                boolean isActive = request.getParameter("isActive") != null;

                Timestamp createTime = new Timestamp(System.currentTimeMillis());

                News news = new News(0, title, content, createTime, imgUrl, false, isActive, null, categoryID);
                news.setUserID(uDao.getUserIdByUsername(username));

                boolean result = newsDAO.addNews(news);
                if (result) {
                    request.setAttribute("message", "News added successfully!");
                } else {
                    request.setAttribute("message", "Failed to add news.");
                }

                ArrayList<News> newsList = newsDAO.viewAllNews();
                ArrayList<Category> categories = newsDAO.getAllCategories();
                request.setAttribute("newsList", newsList);
                request.setAttribute("categories", categories);
                request.getRequestDispatcher("/ViewAdmin/manageNews.jsp").forward(request, response);
            }
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