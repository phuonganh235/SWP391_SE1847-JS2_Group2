package controller.Manager;

import com.google.gson.Gson;
import dal.OrderDetailDAO;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class chart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        UserDAO userDao = new UserDAO();
        OrderDetailDAO dao = new OrderDetailDAO();
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        String usename = (String) session.getAttribute("username");
        String passWord = (String) session.getAttribute("password");

        if (userDao.getRole(usename, passWord) == 1) {
            if (service == null) {
                service = "listAll";
            }
            if (service.equals("listAll") || service.equals("listDay")) {
                List<Double> revenueListByDay = new ArrayList<>();
                List<String> dateList = new ArrayList<>();
                LocalDate currentDate = LocalDate.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

                for (int i = 6; i >= 0; i--) {
                    String date = currentDate.minusDays(i).format(formatter);
                    double totalMoney = dao.getTotalMoneyByDay(date);
                    revenueListByDay.add(totalMoney);
                    dateList.add(date); // Add date to the list
                }

                request.setAttribute("revenueListByDay", revenueListByDay);
                request.setAttribute("dateList", dateList); // Set dateList as request attribute

                request.setAttribute("chartType", "day");
                request.getRequestDispatcher("ViewAdmin/chart.jsp").forward(request, response);
            }
            if (service.equals("listMonth")) {
                List<Double> revenueList = new ArrayList<>();
                for (int month = 1; month <= 12; month++) {
                    double totalMoney = dao.getTotalMoneyByMonth(month);
                    revenueList.add(totalMoney);
                }
                request.setAttribute("revenueList", revenueList);

                request.setAttribute("chartType", "month");
                request.getRequestDispatcher("ViewAdmin/chart.jsp").forward(request, response);
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
