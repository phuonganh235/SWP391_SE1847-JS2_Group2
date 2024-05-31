package controller.Authentication;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="NewPassword", urlPatterns={"/newpass"})
public class NewPassword extends HttpServlet {
   
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("/ViewUser/resetpass.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String user = request.getParameter("username") == null ? "" : request.getParameter("username");
        String pass = request.getParameter("new-password") == null ? "" : request.getParameter("new-password");
        UserDAO dao = new UserDAO();
        String confirm = request.getParameter("confirm-password") == null ? "" : request.getParameter("confirm-password");
        if (user.isEmpty() || pass.isEmpty() || confirm.isEmpty()) {
            request.setAttribute("mess", "You must fill all input");
        } else if (!pass.equals(confirm)) {
            request.setAttribute("mess", "Password does not match!");
        } else if (dao.getUserByUsername(user) == null) {
            request.setAttribute("mess", "Username does not exists");
        } else {
            dao.updatePassword(pass, user);
            request.setAttribute("mess", "Update Success!");
        }
        request.getRequestDispatcher("/ViewUser/resetpass.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
