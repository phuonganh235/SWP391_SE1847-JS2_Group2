package controller.Manager;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import model.User;

// Author     : phuan
@WebServlet(name = "manageAccountAdmin", urlPatterns = {"/manageAccountAdmin"})
public class manageAccountAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            UserDAO userDao = new UserDAO();
            HttpSession session = request.getSession();
            String usename = (String) session.getAttribute("username");
            String passWord = (String) session.getAttribute("password");

            if (userDao.getRole(usename, passWord) == 1 || userDao.getRole(usename, passWord) == 4) {
                if (service == null) {
                    response.sendRedirect("ViewAdmin/Widget.jsp");
                    return;
                }
                //Manage Account Staff begin
                // view Account Staff
                if (service.equals("ListAllStaff")) {
                    ArrayList<User> getAllUser = userDao.getAllUser("SELECT * FROM Users where RoleId = 4");
                    request.setAttribute("dataStaff", getAllUser);
                    request.getRequestDispatcher("ViewAdmin/viewAccountStaff.jsp").forward(request, response);
                }
//
                //thuc hien insert
                if (service.equals("insertStaff")) {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("mobile");
                    String password = request.getParameter("password");
                    String userName = request.getParameter("username");
                    String address = request.getParameter("address");
                    String dateOfBirth = request.getParameter("birth");

               

                    String errorUserNameExit = null;
                    String errorEmaildExit = null;
                    boolean isValid = true;

                    if (userDao.userExists(userName, 4)) {
                        errorUserNameExit = "Username already exists!";
                        isValid = false;
                    }
                    if (userDao.checkExistEmail(email, 4)) {
                        errorEmaildExit = "Email already exists!";
                        isValid = false;
                    }

                    if (isValid) {
                        Date today = new Date();
                        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String currentDate = formatter.format(today);
                        User newUser = new User(0, name, userName, phone, email, address, "", "", 4, currentDate, password, 0, dateOfBirth);
                        userDao.insertUser(newUser);
                        response.sendRedirect("manageAccountAdmin?service=ListAllStaff");
                    } else {
                        request.setAttribute("errorUsrNameExit", errorUserNameExit);
                        request.setAttribute("errorEmailExit", errorEmaildExit);
                        request.getRequestDispatcher("manageAccountAdmin?service=ListAllStaff").forward(request, response);
                    }
                }
//            // chuyen sang trang update
                if (service.equals("update")) {

                    String id = request.getParameter("id");
                    User user = userDao.getUserById(id);
                    request.setAttribute("StaffidUpdate", user);
                    request.getRequestDispatcher("manageAccountAdmin?service=ListAllStaff").forward(request, response);
                }
                //update staff
                if (service.equals("edit")) {
                    int staffId = Integer.parseInt(request.getParameter("staffId"));
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String mobile = request.getParameter("mobile");
                    String password = request.getParameter("password");
                    String username = request.getParameter("username");
                    String address = request.getParameter("address");
                    String dateOfBirth = request.getParameter("birth");
                    Date today = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String currentDate = formatter.format(today);
                    User newUser = new User(staffId, name, username, mobile, email, address, "", "", 4, currentDate, password, 0, dateOfBirth);
                    userDao.updateUser(newUser);
                    response.sendRedirect("manageAccountAdmin?service=ListAllStaff");
                }
                // delete account staff
                if (service.equals("delete")) {
                    String id_raw = request.getParameter("id");
                    int id;
                    try {
                        id = Integer.parseInt(id_raw);
                        userDao.deleteStaff(id);
                        request.getRequestDispatcher("manageAccountAdmin?service=ListAllStaff").forward(request, response);
                    } catch (NumberFormatException e) {
                    }
                }

                // search account staff theo ten
                if (service.equals("search")) {
                    String search = request.getParameter("search");
                    ArrayList<User> list = userDao.SearchStaffByName(search);
                    request.setAttribute("dataStaff", list);
                    request.setAttribute("valueSearch", search);
                    request.getRequestDispatcher("ViewAdmin/viewAccountStaff.jsp").forward(request, response);
                }

                //Manage Account Staff end            //----------------------------------------------------------------------------//
                // Manage Account Shipper Begin
                // in ra so tai khoản shipper
                if (service.equals("ListAllShipper")) {
                    ArrayList<User> getAllUser = userDao.getAllUser("SELECT * FROM Users where RoleId = 3");
                    request.setAttribute("dataShipper", getAllUser);
                    request.getRequestDispatcher("ViewAdmin/viewAccountShipper.jsp").forward(request, response);
                }

                // thuc hien insert account shipper moi
                if (service.equals("insertShipper")) {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("mobile");
                    String password = request.getParameter("password");
                    String userName = request.getParameter("username");
                    String address = request.getParameter("address");
                    String dateOfBirth = request.getParameter("birth");

                    String errorUserNameExit = null;
                    String errorEmaildExit = null;
                    boolean isValid = true;

                    if (userDao.userExists(userName, 3)) {
                        errorUserNameExit = "Username already exists!";
                        isValid = false;
                    }
                    if (userDao.checkExistEmail(email, 3)) {
                        errorEmaildExit = "Email already exists!";
                        isValid = false;
                    }

                    if (isValid) {
                        Date today = new Date();
                        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String currentDate = formatter.format(today);
                        User newUser = new User(0, name, userName, phone, email, address, "", "", 3, currentDate, password, 0, dateOfBirth);
                        userDao.insertUser(newUser);
                        response.sendRedirect("manageAccountAdmin?service=ListAllShipper");
                    } else {
                        request.setAttribute("errorUsrNameExit", errorUserNameExit);
                        request.setAttribute("errorEmailExit", errorEmaildExit);
                        request.getRequestDispatcher("manageAccountAdmin?service=ListAllShipper").forward(request, response);
                    }

                }

                // chuyen sang tran update account shipper
                if (service.equals("updateShipper")) {
                    String id = request.getParameter("id");
                    User user = userDao.getUserById(id);
                    request.setAttribute("dataShipperUpdate", user);
                    request.getRequestDispatcher("manageAccountAdmin?service=ListAllShipper").forward(request, response);
                }
                // thuc hien update account shipper
                if (service.equals("eiditShipper")) {
                    int staffId = Integer.parseInt(request.getParameter("staffId"));
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String mobile = request.getParameter("mobile");
                    String password = request.getParameter("password");
                    String username = request.getParameter("username");
                    String address = request.getParameter("address");
                    String dateOfBirth = request.getParameter("birth");

                    Date today = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String currentDate = formatter.format(today);
                    User newUser = new User(staffId, name, username, mobile, email, address, "", "", 3, currentDate, password, 0, dateOfBirth);
                    userDao.updateUser(newUser);
                    response.sendRedirect("manageAccountAdmin?service=ListAllShipper");

                }
                // xoa Account shipper
                if (service.equals("deleteShipper")) {
                    String id_raw = request.getParameter("idShipper");
                    int id;
                    try {
                        id = Integer.parseInt(id_raw);
                        userDao.deleteStaff(id);
                        request.getRequestDispatcher("manageAccountAdmin?service=ListAllShipper").forward(request, response);
                    } catch (NumberFormatException e) {
                    }
                }
// search account shipper theo ten
                if (service.equals("searchShipper")) {
                    String search = request.getParameter("search");
                    ArrayList<User> list = userDao.SearchShipperByName(search);
                    request.setAttribute("dataShipper", list);
                    request.setAttribute("valueSearchShipper", search);
                    request.getRequestDispatcher("ViewAdmin/viewAccountShipper.jsp").forward(request, response);
                }

                //Manage Account Shipper End
            } else {
                response.sendRedirect("login");
            }
        } catch (Exception e) {
//            response.sendRedirect("404.jsp");
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
