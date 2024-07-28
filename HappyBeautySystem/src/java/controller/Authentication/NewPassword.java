package controller.Authentication;

import dal.UserDAO;
import model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name="NewPassword", urlPatterns={"/newpass"})
public class NewPassword extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        if (email == null) {
            response.sendRedirect("forgotpass");
            return;
        }
        UserDAO dao = new UserDAO();
        User user = dao.getUserByEmail(email);
        if (user == null) {
            request.setAttribute("mess", "Không tìm thấy email trong hệ thống của chúng tôi.");
            request.getRequestDispatcher("/ViewUser/forgotpass.jsp").forward(request, response);
            return;
        }
        request.setAttribute("username", user.getUsername());
        request.getRequestDispatcher("/ViewUser/resetpass.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        if (email == null) {
            response.sendRedirect("forgotpass");
            return;
        }

        UserDAO dao = new UserDAO();
        User user = dao.getUserByEmail(email);
        if (user == null) {
            request.setAttribute("mess", "Không tìm thấy email trong hệ thống của chúng tôi.");
            request.getRequestDispatcher("/ViewUser/forgotpass.jsp").forward(request, response);
            return;
        }

        String pass = request.getParameter("new-password");
        String confirm = request.getParameter("confirm-password");

        if (pass == null || confirm == null || pass.isEmpty() || confirm.isEmpty()) {
            request.setAttribute("mess", "Bạn phải điền đầy đủ thông tin");
        } else if (!pass.equals(confirm)) {
            request.setAttribute("mess", "Mật khẩu không hợp lệ!");
        } else {
            dao.updatePassword(pass, user.getUsername());
            request.setAttribute("mess", "Cập nhật thành công!");
            session.removeAttribute("email");
        }
        request.setAttribute("username", user.getUsername());
        request.getRequestDispatcher("/ViewUser/resetpass.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "New Password Servlet";
    }
}