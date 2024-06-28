/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customer;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "TestApiMap", urlPatterns = {"/TestApiMap"})
public class TestApiMap extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String service = request.getParameter("service");
        try (PrintWriter out = response.getWriter()) {
            if (service.equals("test")) {
// Lấy giá trị từ các trường ẩn
                String selectedQuan = request.getParameter("selectedQuan");
                String selectedPhuong = request.getParameter("selectedPhuong");
                String time = request.getParameter("toTime");

                // Xử lý dữ liệu (ví dụ: ghi ra console hoặc lưu vào cơ sở dữ liệu)
                System.out.println("Quận/Huyện: " + selectedQuan);
                System.out.println("Phường/Xã: " + selectedPhuong);

                // Thiết lập phản hồi cho người dùng (ví dụ: chuyển hướng đến trang thành công hoặc gửi phản hồi JSON)
                response.setContentType("text/html");
                response.getWriter().println("<h1>Dữ liệu đã được gửi thành công</h1>");
                response.getWriter().println("<p>Quận/Huyện: " + selectedQuan + "</p>");
                response.getWriter().println("<p>Phường/Xã: " + selectedPhuong + "</p>");
                response.getWriter().println("<p>Thời gian: " + time + "</p>");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
