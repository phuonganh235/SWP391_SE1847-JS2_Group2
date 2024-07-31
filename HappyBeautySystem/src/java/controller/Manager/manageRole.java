package controller.Manager;

import dal.AboutDAO;
import dal.RoleDAO;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.About;
import model.Role;

public class manageRole extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AboutDAO dao = new AboutDAO();
        UserDAO uDao = new UserDAO();
        RoleDAO roleDao = new RoleDAO();
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (uDao.getRole(username, password) == 1) {
            if (service == null) {
                service = "listall";
            }
            if (service.equals("listall")) {
                ArrayList<Role> about = roleDao.getAllRole();
                request.setAttribute("about", about);
                request.getRequestDispatcher("/ViewAdmin/manageRole.jsp").forward(request, response);
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
                int roleId = Integer.parseInt(request.getParameter("title"));
                String content = request.getParameter("content");
                String description = request.getParameter("description");
                Role role = new Role(roleId, content, description);
                roleDao.addRole(role);
                response.sendRedirect("manageRole");
            }
//
            if (service.equals("update")) {
                int aboutId = Integer.parseInt(request.getParameter("id"));
                Role role = roleDao.getRoleById(aboutId);
                request.setAttribute("aboutUpdate", role);
                request.getRequestDispatcher("manageRole?service=listall").forward(request, response);
            }
//            //Editing a about
            if (service.equals("edit")) {
                int roleId = Integer.parseInt(request.getParameter("title"));
                String content = request.getParameter("content");
                String description = request.getParameter("description");
                Role role = new Role(roleId, content, description);
                roleDao.updateRole(role);
                response.sendRedirect("manageRole");
            }
//            //Deleting a about
            if (service.equals("delete")) {
                int aboutId = Integer.parseInt(request.getParameter("id"));
                roleDao.deleteRole(aboutId);
                response.sendRedirect("manageRole");
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
