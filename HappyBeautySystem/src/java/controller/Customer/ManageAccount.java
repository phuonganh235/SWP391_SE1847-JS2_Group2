/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Customer;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author phuan
 */
public class ManageAccount extends HttpServlet {
   
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       HttpSession session = request.getSession();
       String service = request.getParameter("service");
       
       if(service == null){
            request.getRequestDispatcher("ViewUser/home.jsp").forward(request, response);
       }
       
       if(service.equals("ViewProfile")){
           User obj =(User) session.getAttribute("inforUser");
           request.setAttribute("account", obj);
            request.getRequestDispatcher("ViewUser/viewprofile.jsp").forward(request, response);
       }
       
       if(service.equals("editProfile")){
           String submit = request.getParameter("submit");
                if (submit == null) {
                   User obj =(User) session.getAttribute("inforUser");
                    int userid = obj.getUserId();
                    request.setAttribute("customer", userid);
                    request.setAttribute("infor", obj);
                    request.getRequestDispatcher("ViewUser/edit-profile.jsp").forward(request, response);
                } else {
                    User obj =(User) session.getAttribute("inforUser");
                    int userid = obj.getUserId();
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    String postCode = request.getParameter("postCode");
                    String address = request.getParameter("address");
                     User newUser = new User(userid, name, "", phone, email, address, postCode, "", 2, "");
                    response.sendRedirect("ViewUser/edit-profile.jsp");
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
        return "Short description";
    }// </editor-fold>

}
