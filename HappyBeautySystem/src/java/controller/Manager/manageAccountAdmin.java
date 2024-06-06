package controller.Manager;

import dal.shipperDao;
import dal.staffDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import java.util.regex.Pattern;
import model.Shipper;
import model.Staff;

// Author     : phuan
@WebServlet(name = "manageAccountAdmin", urlPatterns = {"/manageAccountAdmin"})
public class manageAccountAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            staffDao DaoStaff = new staffDao();
            shipperDao DaoShiper = new shipperDao();
            HttpSession session = request.getSession();

            if (service == null) {
                response.sendRedirect("ViewAdmin/Widget.jsp");
                return;
            }
            //Manage Account Staff begin

            // view Account Staff
            if (service.equals("ListAllStaff")) {
                Vector<Staff> vector = DaoStaff.getAll("select* from Staff");
                request.setAttribute("dataStaff", vector);
                request.getRequestDispatcher("ViewAdmin/viewAccountStaff.jsp").forward(request, response);
            }

            //thuc hien insert
            if (service.equals("insertStaff")) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                String emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
                String mobilePattern = "^(?:\\+84|0)(3|5|7|8|9)[0-9]{8}$";
                String passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$";
                String namePattern = "^(?!\\s*$)[A-Za-z\\s]+$";
                String genderPattern = "^(?!\\s*$)[A-Za-z\\s]+$";

                boolean isValid = true;
                String errorName = null;
                String errorEmail = null;
                String errorPhone = null;
                String errorPassword = null;
                String errorGender = null;
                String errorEmailExit = null;
                String errorPasswordExit = null;

                if (!Pattern.matches(namePattern, name)) {
                    errorName = "Name cannot be empty or full of spaces or  have degit!";
                    isValid = false;
                } else if (!Pattern.matches(emailPattern, email)) {
                    errorEmail = "Email must be in the form example@example.com!";
                    isValid = false;
                } else if (!Pattern.matches(mobilePattern, phone)) {
                    errorPhone = "Invalid Vietnam mobile number!";
                    isValid = false;
                } else if (!Pattern.matches(passwordPattern, password)) {
                    errorPassword = "Password must be at least 8 characters long and include at least one letter, one number, and one special character.";
                    isValid = false;
                } else if (!Pattern.matches(genderPattern, gender)) {
                    errorGender = "Name cannot be empty or full of spaces or  have degit!";
                    isValid = false;
                }

                if (DaoStaff.checkExistEmail(email)) {
                    errorEmailExit = "Email already exits!";
                    isValid = false;
                }
                if (DaoStaff.checkExistPassword(password)) {
                    errorPasswordExit = "Password already exits!";
                    isValid = false;
                }

                if (isValid) {
                    Staff newStaff = new Staff(0, name, email, phone, gender, password, 1);
                    DaoStaff.insertStaff(newStaff);
                    response.sendRedirect("manageAccountAdmin?service=ListAllStaff");
                } else {
                    request.setAttribute("error", "erorr format");
                    request.setAttribute("errorName", errorName);
                    request.setAttribute("errorEmail", errorEmail);
                    request.setAttribute("errorPhone", errorPhone);
                    request.setAttribute("errorPassword", errorPassword);
                    request.setAttribute("errorGender", errorGender);
                    request.setAttribute("errorEmailExit", errorEmailExit);
                    request.setAttribute("errorPasswordExit", errorPasswordExit);
                    request.getRequestDispatcher("manageAccountAdmin?service=ListAllStaff").forward(request, response);
                }
            }
            // chuyen sang trang update
            if (service.equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Staff staff = DaoStaff.getStaffById(id);
                request.setAttribute("StaffidUpdate", staff);
                request.getRequestDispatcher("manageAccountAdmin?service=ListAllStaff").forward(request, response);
            }
            //update staff
            if (service.equals("edit")) {

                int staffId = Integer.parseInt(request.getParameter("staffId"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");

                String emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
                String mobilePattern = "^(?:\\+84|0)(3|5|7|8|9)[0-9]{8}$";
                String passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$";
                String namePattern = "^(?!\\s*$)[A-Za-z\\s]+$";
                String genderPattern = "^(?!\\s*$)[A-Za-z\\s]+$";

                boolean isValid = true;
                String errorName = null;
                String errorEmail = null;
                String errorPhone = null;
                String errorPassword = null;
                String errorGender = null;
                String errorEmailExit = null;
                String errorPasswordExit = null;

                if (!Pattern.matches(namePattern, name)) {
                    errorName = "Name cannot be empty or full of spaces or have digit!";
                    isValid = false;
                } else if (!Pattern.matches(emailPattern, email)) {
                    errorEmail = "Email must be in the form example@example.com!";
                    isValid = false;
                } else if (!Pattern.matches(mobilePattern, phone)) {
                    errorPhone = "Invalid Vietnam mobile number!";
                    isValid = false;
                } else if (!Pattern.matches(passwordPattern, password)) {
                    errorPassword = "Password must be at least 8 characters long and include at least one letter, one number, and one special character.";
                    isValid = false;
                } else if (!Pattern.matches(genderPattern, gender)) {
                    errorGender = "Name cannot be empty or full of spaces or  have degit!";
                    isValid = false;
                }
                if (DaoStaff.checkExistEmail(email)) {
                    errorEmailExit = "Email already exits!";
                    isValid = false;
                }
                if (DaoStaff.checkExistPassword(password)) {
                    errorPasswordExit = "Password already exits!";
                    isValid = false;
                }

                if (isValid) {
                    Staff newStaff = new Staff(staffId, name, email, phone, gender, password, 1);
                    DaoStaff.updateStaff(newStaff);
                    response.sendRedirect("manageAccountAdmin?service=ListAllStaff");
                } else {
                    Staff staff = DaoStaff.getStaffById(staffId);
                    request.setAttribute("StaffidUpdate", staff);
                    request.setAttribute("errorNameUpdateStaff", errorName);
                    request.setAttribute("errorEmailUpdateStaff", errorEmail);
                    request.setAttribute("errorPhoneUpdateStaff", errorPhone);
                    request.setAttribute("errorPasswordUpdateStaff", errorPassword);
                    request.setAttribute("errorGenderUpdateStaff", errorGender);
                    request.setAttribute("errorEmailExitUpdateStaff", errorEmailExit);
                    request.setAttribute("errorPasswordExitUpdateStaff", errorPasswordExit);
                    request.getRequestDispatcher("manageAccountAdmin?service=ListAllStaff").forward(request, response);
                }

            }
            // delete account staff
            if (service.equals("delete")) {
                String id_raw = request.getParameter("id");
                int id;
                try {
                    id = Integer.parseInt(id_raw);
                    DaoStaff.deleteStaff(id);
                    request.getRequestDispatcher("manageAccountAdmin?service=ListAllStaff").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }

            // search account staff theo ten
            if (service.equals("search")) {
                String search = request.getParameter("search");
                Vector<Staff> list = DaoStaff.serachStaffByName(search);
                request.setAttribute("dataStaff", list);
                request.setAttribute("valueSearch", search);
                request.getRequestDispatcher("ViewAdmin/viewAccountStaff.jsp").forward(request, response);
            }

            //Manage Account Staff end
            //----------------------------------------------------------------------------//
            // Manage Account Shipper Begin
            // in ra so tai khoản shipper
            if (service.equals("ListAllShipper")) {
                Vector<Shipper> vector = DaoShiper.getAll("select* from Shipper");
                request.setAttribute("dataShipper", vector);
                request.getRequestDispatcher("ViewAdmin/viewAccountShipper.jsp").forward(request, response);
            }

            // thuc hien insert account shipper moi
            if (service.equals("insertShipper")) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                String emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
                String mobilePattern = "^(?:\\+84|0)(3|5|7|8|9)[0-9]{8}$";
                String passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$";
                String namePattern = "^(?!\\s*$)[A-Za-z\\s]+$";
                String GenderPattern = "^(?!\\s*$)[A-Za-z\\s]+$";
                boolean isValid = true;
                String errorName = null;
                String errorEmail = null;
                String errorPhone = null;
                String errorPassword = null;
                String errorGender = null;
                String errorEmailExit = null;
                String errorPasswordExit = null;

                if (!Pattern.matches(namePattern, name)) {
                    errorName = "Name cannot be empty or full of spaces or havedegit!";
                    isValid = false;
                } else if (!Pattern.matches(emailPattern, email)) {
                    errorEmail = "Email must be in the form example@example.com!";
                    isValid = false;
                } else if (!Pattern.matches(mobilePattern, phone)) {
                    errorPhone = "Invalid Vietnam mobile number! phone begin 0(3,5,7,8,9) and have 8 digit";
                    isValid = false;
                } else if (!Pattern.matches(passwordPattern, password)) {
                    errorPassword = "Password must be at least 8 characters long and include at least one letter, one number, and one special character.";
                    isValid = false;
                } else if (!Pattern.matches(GenderPattern, gender)) {
                    errorGender = "Gender cannot be empty or full of spaces or have degit!";
                    isValid = false;
                }

                if (DaoShiper.checkExistEmailShipper(email)) {
                    errorEmailExit = "Email already exits!";
                    isValid = false;
                }
                if (DaoShiper.checkExistPasswordShipper(password)) {
                    errorPasswordExit = "Password already exits!";
                    isValid = false;
                }

                if (isValid) {
                    Shipper newShipper = new Shipper(0, name, email, phone, 1, gender, password);
                    DaoShiper.insertShipper(newShipper);
                    response.sendRedirect("manageAccountAdmin?service=ListAllShipper");
                } else {
                    request.setAttribute("error", "erorr format");
                    request.setAttribute("errorName", errorName);
                    request.setAttribute("errorEmail", errorEmail);
                    request.setAttribute("errorPhone", errorPhone);
                    request.setAttribute("errorPassword", errorPassword);
                    request.setAttribute("errorGender", errorGender);
                    request.setAttribute("errorEmailExit", errorEmailExit);
                    request.setAttribute("errorPasswordExit", errorPasswordExit);
                    request.getRequestDispatcher("manageAccountAdmin?service=ListAllShipper").forward(request, response);
                }
            }

            // chuyen sang tran update account shipper
            if (service.equals("updateShipper")) {

                int id = Integer.parseInt(request.getParameter("id"));
                Shipper shipper = DaoShiper.getShipperById(id);
                request.setAttribute("dataShipperUpdate", shipper);
                request.getRequestDispatcher("manageAccountAdmin?service=ListAllShipper").forward(request, response);
            }
            // thuc hien update account shipper
            if (service.equals("eiditShipper")) {
                int shipperId = Integer.parseInt(request.getParameter("shipperId"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");

                String emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
                String mobilePattern = "^(?:\\+84|0)(3|5|7|8|9)[0-9]{8}$";
                String passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$";
                String namePattern = "^(?!\\s*$)[A-Za-z\\s]+$";
                String GenderPattern = "^(?!\\s*$)[A-Za-z\\s]+$";

                boolean isValid = true;
                String errorNameShipper = null;
                String errorEmailShipper = null;
                String errorPhoneShipper = null;
                String errorPasswordShipper = null;
                String errorGender = null;
                String errorEmailExit = null;
                String errorPasswordExit = null;

                if (!Pattern.matches(namePattern, name)) {
                    errorNameShipper = "Name cannot be empty or full of spaces or have degit!";
                    isValid = false;
                } else if (!Pattern.matches(emailPattern, email)) {
                    errorEmailShipper = "Email must be in the form example@example.com!";
                    isValid = false;
                } else if (!Pattern.matches(mobilePattern, phone)) {
                    errorPhoneShipper = "Invalid Vietnam mobile number! phone begin 0(3,5,7,8,9) and have 8 digit";
                    isValid = false;
                } else if (!Pattern.matches(passwordPattern, password)) {
                    errorPasswordShipper = "Password must be at least 8 characters long and include at least one letter, one number, and one special character.";
                    isValid = false;
                } else if (!Pattern.matches(GenderPattern, gender)) {
                    errorGender = "Gender cannot be empty or full of spaces or have degit!";
                    isValid = false;
                }

                if (DaoShiper.checkExistEmailShipper(email)) {
                    errorEmailExit = "Email already exits!";
                    isValid = false;
                }
                if (DaoShiper.checkExistPasswordShipper(password)) {
                    errorPasswordExit = "Password already exits!";
                    isValid = false;
                }

                if (isValid) {
                    Shipper newShipper = new Shipper(shipperId, name, email, phone, 1, gender, password);
                    DaoShiper.updateShipper(newShipper);
                    response.sendRedirect("manageAccountAdmin?service=ListAllShipper");
                } else {
                    Shipper shipper = DaoShiper.getShipperById(shipperId);
                    request.setAttribute("dataShipperUpdate", shipper);
                    request.setAttribute("errorNameUpdateShipper", errorNameShipper);
                    request.setAttribute("errorEmailUpdateShipper", errorEmailShipper);
                    request.setAttribute("errorPhoneUpdateShipper", errorPhoneShipper);
                    request.setAttribute("errorPasswordUpdateShipper", errorPasswordShipper);
                    request.setAttribute("errorGenderUpdateShipper", errorGender);
                        request.setAttribute("errorEmailExitUpdateShipper", errorEmailExit);
                    request.setAttribute("errorPasswordExitUpdateShipper", errorPasswordExit);
                    request.getRequestDispatcher("manageAccountAdmin?service=ListAllShipper").forward(request, response);
                }

            }
            // xoa Account shipper
            if (service.equals("deleteShipper")) {
                String id_raw = request.getParameter("idShipper");
                int id;
                try {
                    id = Integer.parseInt(id_raw);
                    DaoShiper.deleteShipper(id);
                    request.getRequestDispatcher("manageAccountAdmin?service=ListAllShipper").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }
// search account shipper theo ten
            if (service.equals("searchShipper")) {
                String search = request.getParameter("search");
                Vector<Shipper> list = DaoShiper.serachShipperByName(search);
                request.setAttribute("dataShipper", list);
                request.setAttribute("valueSearchShipper", search);
                request.getRequestDispatcher("ViewAdmin/viewAccountShipper.jsp").forward(request, response);
            }

            //Manage Account Shipper End
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
