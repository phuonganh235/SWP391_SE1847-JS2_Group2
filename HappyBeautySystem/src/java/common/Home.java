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
        ArrayList<Product> productPopular = pDao.getPopularProduct();
        ArrayList<Product> productSeller = pDao.getSellerProduct();
//      Decentralize
        int role = uDao.getRole(username, password);

        if (role == 1) {
            request.getRequestDispatcher("dashboard").forward(request, response);
//        } 
//        else if (role == 3) {
//            request.getRequestDispatcher("product").forward(request, response);
        } else if (role == 4) {
            request.getRequestDispatcher("staff").forward(request, response);
        } else {
            request.setAttribute("top8New", product);
            request.setAttribute("topPopular", productPopular);
            request.setAttribute("topSeller", productSeller);
            request.getRequestDispatcher("/ViewUser/home.jsp").forward(request, response);
        }
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
