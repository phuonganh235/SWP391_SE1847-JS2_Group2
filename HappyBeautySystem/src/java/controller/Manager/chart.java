package controller.Manager;

import dal.OrderDetailDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class chart extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");

        OrderDetailDAO dao = new OrderDetailDAO();
        //get data of Money by Month
        double m1 = dao.getTotalMoneyByMonth(1);
        double m2 = dao.getTotalMoneyByMonth(2);
        double m3 = dao.getTotalMoneyByMonth(3);
        double m4 = dao.getTotalMoneyByMonth(4);
        double m5 = dao.getTotalMoneyByMonth(5);
        double m6 = dao.getTotalMoneyByMonth(6);
        double m7 = dao.getTotalMoneyByMonth(7);
        double m8 = dao.getTotalMoneyByMonth(8);
        double m9 = dao.getTotalMoneyByMonth(9);
        double m10 = dao.getTotalMoneyByMonth(10);
        double m11 = dao.getTotalMoneyByMonth(11);
        double m12 = dao.getTotalMoneyByMonth(12);

        request.setAttribute("m1", m1);
        request.setAttribute("m2", m2);
        request.setAttribute("m3", m3);
        request.setAttribute("m4", m4);
        request.setAttribute("m5", m5);
        request.setAttribute("m6", m6);
        request.setAttribute("m7", m7);
        request.setAttribute("m8", m8);
        request.setAttribute("m9", m9);
        request.setAttribute("m10", m10);
        request.setAttribute("m11", m11);
        request.setAttribute("m12", m12);
        
        //get all of product on each category 
        int cat1 = dao.getTotalProductByCategory(1);
        int cat2 = dao.getTotalProductByCategory(2);
        int cat3 = dao.getTotalProductByCategory(3);
        int cat4 = dao.getTotalProductByCategory(4);
        int cat5 = dao.getTotalProductByCategory(5);
        int cat6 = dao.getTotalProductByCategory(6);
        int cat7 = dao.getTotalProductByCategory(7);
        int cat8 = dao.getTotalProductByCategory(8);
        int cat9 = dao.getTotalProductByCategory(9);
        int cat10 = dao.getTotalProductByCategory(10);
             
        request.setAttribute("cat1", cat1);
        request.setAttribute("cat2", cat2);
        request.setAttribute("cat3", cat3);
        request.setAttribute("cat4", cat4);
        request.setAttribute("cat5", cat5);
        request.setAttribute("cat6", cat6);
        request.setAttribute("cat7", cat7);
        request.setAttribute("cat8", cat8);
        request.setAttribute("cat9", cat9);
        request.setAttribute("cat10", cat10);
        request.getRequestDispatcher("ViewAdmin/chart.jsp").forward(request, response);
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
