package controller.Authentication;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name="ValidateOtp", urlPatterns={"/validateotp"})
public class ValidateOtp extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("/ViewUser/verifycode.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession sess = request.getSession();
        int otpValue = Integer.parseInt(sess.getAttribute("otp").toString());
        int veriCode = Integer.parseInt(request.getParameter("verification-code").toString());
        if(otpValue == veriCode){
            response.sendRedirect("newpass");
        }else{
            request.setAttribute("mess", "Verify code is not correct!");
            request.getRequestDispatcher("/ViewUser/verifycode.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
