package controller.Staff;

import dal.NewsDAO;
import model.News;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "EditNews", urlPatterns = {"/editnews"})
public class EditNews extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        NewsDAO newsDAO = new NewsDAO();
        String service = request.getParameter("service");

        if (service == null || !service.equals("editNews")) {
            response.sendRedirect("home");
            return;
        }

        String submit = request.getParameter("submit");

        if (submit == null) { // Hiển thị form chỉnh sửa
            try {
                int newsId = Integer.parseInt(request.getParameter("newsId"));
                News news = newsDAO.getNewsById(newsId);

                if (news != null) {
                    ResultSet rsCate = newsDAO.getData("SELECT * FROM Category");
                    request.setAttribute("rsCate", rsCate);
                    request.setAttribute("news", news);

                    request.getRequestDispatcher("/ViewStaff/editNews.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "News not found.");
                    request.getRequestDispatcher("/error.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("message", "Error retrieving news details.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        } else if (submit.equals("Update")) { // Xử lý yêu cầu cập nhật
            try {
                int newsId = Integer.parseInt(request.getParameter("newsId"));
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                String imgUrl = request.getParameter("imgUrl");
                int categoryID = Integer.parseInt(request.getParameter("categoryID"));

                News existingNews = newsDAO.getNewsById(newsId);

                if (existingNews != null) {
                    existingNews.setTitle(title);
                    existingNews.setContent(content);
                    existingNews.setImgUrl(imgUrl);
                    existingNews.setCategoryID(categoryID);

                    boolean result = newsDAO.updateNews(existingNews);

                    if (result) {
                        response.sendRedirect("home");
                    } else {
                        request.setAttribute("message", "Failed to update news.");
                        request.getRequestDispatcher("/error.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("message", "News not found.");
                    request.getRequestDispatcher("/error.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("message", "Error updating news.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
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
        return "Servlet to handle editing news";
    }
}
