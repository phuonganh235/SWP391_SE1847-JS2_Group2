package common;

import dal.AboutDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.About;

public class AboutUs extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AboutDAO dao = new AboutDAO();
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
                ArrayList<About> about = dao.getAllAbouts();
                About about2 = dao.getAboutById(1);
                request.setAttribute("about", about);
                request.setAttribute("about2", about2);
                request.getRequestDispatcher("/ViewUser/about.jsp").forward(request, response);
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
