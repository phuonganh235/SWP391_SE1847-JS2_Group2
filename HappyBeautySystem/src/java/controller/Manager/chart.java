package controller.Manager;

import com.google.gson.Gson;
import dal.OrderDetailDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class chart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");

        OrderDetailDAO dao = new OrderDetailDAO();
        String service = request.getParameter("service");
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

        if (service.equals("listWeek")) {
            List<Double> revenueListByWeek = new ArrayList<>();
            List<String> weekList = new ArrayList<>();
            LocalDate currentDate = LocalDate.now();
            WeekFields weekFields = WeekFields.of(Locale.getDefault());

            for (int i = 6; i >= 0; i--) {
                LocalDate weekStartDate = currentDate.minusWeeks(i).with(weekFields.dayOfWeek(), 1);
                int year = weekStartDate.getYear();
                int week = weekStartDate.get(weekFields.weekOfWeekBasedYear());
                double totalMoney = dao.getTotalMoneyByWeek(year, week);
                revenueListByWeek.add(totalMoney);
                weekList.add("Week " + week + " of " + year); // Add week info to the list
            }

            request.setAttribute("revenueListByWeek", revenueListByWeek);
            request.setAttribute("weekList", weekList); // Set weekList as request attribute

            request.setAttribute("chartType", "week");
            request.getRequestDispatcher("ViewAdmin/chart.jsp").forward(request, response);
        }
        if (service.equals("listYear")) {
            List<Double> revenueListByYear = new ArrayList<>();
            List<Integer> yearList = new ArrayList<>();
            LocalDate currentDate = LocalDate.now();

            for (int year = currentDate.getYear(); year >= currentDate.getYear() - 6; year--) {
                double totalMoney = dao.getTotalMoneyByYear(year);
                revenueListByYear.add(totalMoney);
                yearList.add(year); // Add year to the list
            }

            request.setAttribute("revenueListByYear", revenueListByYear);
            request.setAttribute("yearList", yearList); // Set yearList as request attribute

            request.setAttribute("chartType", "year");
            request.getRequestDispatcher("ViewAdmin/chart.jsp").forward(request, response);
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
