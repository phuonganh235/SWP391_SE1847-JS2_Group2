package common;

import dal.AboutDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.About;

public class AboutUs extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AboutDAO dao = new AboutDAO();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listall";
        }
        if (service.equals("listall")) {
            ArrayList<About> about = dao.getAllAbouts();
            request.setAttribute("about", about);
            request.getRequestDispatcher("/ViewUser/about.jsp").forward(request, response);
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
