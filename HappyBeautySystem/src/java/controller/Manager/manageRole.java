package controller.Manager;

import dal.RoleDAO;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Role;
import model.User;

public class manageRole extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
            // Edit role
            if (service.equals("editRole")) {
                int roleId = Integer.parseInt(request.getParameter("id"));
                int userId = Integer.parseInt(request.getParameter("userId"));
                ArrayList<Role> about = roleDao.getAllRole();
                Role role = roleDao.getRoleById(roleId);
                User user = uDao.getUserByUserId(userId);
                
                request.setAttribute("role", role);
                request.setAttribute("userId", userId);
                request.setAttribute("about", about);
                request.setAttribute("user", user);
                request.getRequestDispatcher("ViewAdmin/manageRole.jsp").forward(request, response);
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
                Role role = new Role(roleId, content);
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
                Role role = new Role(roleId, content);
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