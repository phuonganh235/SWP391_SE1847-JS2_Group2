package controller.Manager;

import com.google.gson.Gson;
import dal.OrderDAO;
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
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import model.Product;

public class chart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        UserDAO userDao = new UserDAO();
        OrderDetailDAO dao = new OrderDetailDAO();
        OrderDAO daoO = new OrderDAO();
        String service = request.getParameter("service");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (userDao.getRole(username) == 1) {
            if (service == null) {
                service = "listAll";
            }

            List<Double> revenueListByDay = new ArrayList<>();
            List<String> dateList = new ArrayList<>();
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            for (int i = 6; i >= 0; i--) {
                String date = currentDate.minusDays(i).format(formatter);
                double totalMoney = dao.getTotalMoneyByDay(date);
                revenueListByDay.add(totalMoney);
                dateList.add(date);
            }

            request.setAttribute("revenueListByDay", revenueListByDay);
            request.setAttribute("dateList", dateList);

            List<Double> revenueListByWeek = new ArrayList<>();
            List<String> weekList = new ArrayList<>();
            WeekFields weekFields = WeekFields.of(Locale.getDefault());

            for (int i = 6; i >= 0; i--) {
                LocalDate weekStartDate = currentDate.minusWeeks(i).with(weekFields.dayOfWeek(), 1);
                int year = weekStartDate.getYear();
                int week = weekStartDate.get(weekFields.weekOfWeekBasedYear());
                double totalMoney = dao.getTotalMoneyByWeek(year, week);
                revenueListByWeek.add(totalMoney);
                weekList.add("Week " + week + " of " + year);
            }

            // Lists to store dates and order counts
            List<String> last7Days = new ArrayList<>();
            List<Integer> orderCountsByDay = new ArrayList<>();

            // Fetch data for the last 7 days
            for (int i = 6; i >= 0; i--) {
                String date = currentDate.minusDays(i).format(formatter);
                int orderCount = daoO.countOrdersByDay(date);
                last7Days.add(date);
                orderCountsByDay.add(orderCount);
            }

            // Set attributes to pass to JSP
            request.setAttribute("last7Days", last7Days);
            request.setAttribute("orderCountsByDay", orderCountsByDay);

            request.setAttribute("revenueListByWeek", revenueListByWeek);
            request.setAttribute("weekList", weekList);
            List<Integer> monthList = List.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
            List<Double> revenueListByMonth = new ArrayList<>();
            for (int month = 1; month <= 12; month++) {
                double totalMoney = dao.getTotalMoneyByMonth(month);
                revenueListByMonth.add(totalMoney);
            }
            request.setAttribute("monthList", monthList);
            request.setAttribute("revenueListByMonth", revenueListByMonth);

            List<Double> revenueListByYear = new ArrayList<>();
            List<Integer> yearList = new ArrayList<>();

            for (int year = currentDate.getYear(); year >= currentDate.getYear() - 6; year--) {
                double totalMoney = dao.getTotalMoneyByYear(year);
                revenueListByYear.add(totalMoney);
                yearList.add(year);
            }
            request.setAttribute("revenueListByYear", revenueListByYear);
            request.setAttribute("yearList", yearList);

            List<Integer> categoryIds = List.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
            List<Integer> productCounts = new ArrayList<>();
            List<String> categoryNames = dao.getCategoryNames(categoryIds);

            for (int categoryId : categoryIds) {
                int count = dao.getTotalProductByCategory(categoryId);
                productCounts.add(count);
            }

            request.setAttribute("productCounts", productCounts);
            request.setAttribute("categoryNames", categoryNames);

            List<Product> topSellingProducts = dao.getTopSellingProducts();
            List<String> productNames = new ArrayList<>();
            List<Integer> productQuantities = new ArrayList<>();

            for (Product product : topSellingProducts) {
                productNames.add(product.getProductName());
                productQuantities.add(product.getTotalQuantity());
            }

            request.setAttribute("productNames", productNames);
            request.setAttribute("productQuantities", productQuantities);

            request.getRequestDispatcher("ViewAdmin/chart.jsp").forward(request, response);
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
