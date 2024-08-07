package common;

import dal.NewsDAO;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.News;

@WebServlet(name = "NewsDetail", urlPatterns = {"/newsdetail"})
public class NewsDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        NewsDAO newsDAO = new NewsDAO();
        String service = request.getParameter("service");
        UserDAO uDao = new UserDAO();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (uDao.getRole(username) == 2 || uDao == null) {
            if (service != null && service.equals("viewNewsDetail")) {
                String newsID = request.getParameter("newsID");
                if (newsID != null) {
                    try {
                        int newsId = Integer.parseInt(newsID);
                        News news = newsDAO.getNewsById(newsId);
                        if (news != null) {
                            request.setAttribute("news", news);
                            request.getRequestDispatcher("/ViewUser/blog-details.jsp").forward(request, response);
                        } else {
                            response.getWriter().println("News not found");
                        }
                    } catch (NumberFormatException e) {
                        response.getWriter().println("Invalid news ID");
                    }
                } else {
                    response.getWriter().println("News ID is missing");
                }
            } else {
                response.getWriter().println("Invalid service request");
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
        return "Servlet to handle news detail view";
    }
}
