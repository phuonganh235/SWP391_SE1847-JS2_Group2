package common;

import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Product;
import model.User;

public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        UserDAO uDao = new UserDAO();
        ProductDAO pDao = new ProductDAO();
        HttpSession session = request.getSession();

        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        
        ArrayList<Product> product = pDao.getNewProduct();
        ArrayList<Product> productTrend = pDao.getTrendProduct();
        ArrayList<Product> productSeller = pDao.getSellerProduct();
        
        if(uDao.getRole(username, password) == 1){
            request.getRequestDispatcher("managerList").include(request, response);
            return;
        }
        request.setAttribute("top8New", product);
        request.setAttribute("topTrend", productTrend);
        request.setAttribute("topSeller", productSeller);
        request.getRequestDispatcher("/ViewUser/home.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
