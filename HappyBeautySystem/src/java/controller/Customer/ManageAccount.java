package controller.Customer;

import dal.UserDAO;
import java.io.IOException;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.regex.Pattern;
import model.User;

//author AnNp
public class ManageAccount extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(ManageAccount.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String service = request.getParameter("service");
        UserDAO userDao = new UserDAO();

        // Check if there is any service request
        if (service == null) {
            response.sendRedirect("home");
            return;
        }
        if (service.equals("ViewProfile")) {
    User viewProfileUser = (User) session.getAttribute("inforUserLogin");
    if (viewProfileUser != null) { // if the user is logged in
        request.setAttribute("account", viewProfileUser);
        request.getRequestDispatcher("ViewUser/viewprofile.jsp").forward(request, response);
    } else { // if the user is not logged in
        response.sendRedirect("home");
    }
} else if (service.equals("editprofile")) {
    String submit = request.getParameter("submit"); // get the submit parameter from the editprofile page
    if (submit == null) { // if the user hasn't submitted the form
        User editProfileUser = (User) session.getAttribute("inforUserLogin"); // get the logged-in user information
        if (editProfileUser != null) { // if the user is logged in
            request.setAttribute("infor", editProfileUser);
            request.getRequestDispatcher("ViewUser/editprofile.jsp").forward(request, response);
        } else { // if the user is not logged in
            response.sendRedirect("login");
        }
    } else { // if the user has submitted the form
        User editProfileUser = (User) session.getAttribute("inforUserLogin"); // get the logged-in user information
        if (editProfileUser != null) { // if the user exists, update with the form data
            int userid = editProfileUser.getUserId();
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String postCode = request.getParameter("postCode");
            String address = request.getParameter("address");

            String emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
            String mobilePattern = "^(?:\\+84|0)(3|5|7|8|9)[0-9]{8}$";
            String namePattern = "^(?!\\s*$)[A-Za-z\\s]+$";
            String errorName = null;
            String errorEmail = null;
            String errorPhone = null;
            boolean isValid = true;

            if (!Pattern.matches(namePattern, name)) {
                errorName = "Name cannot be empty or full of spaces or have digits!";
                isValid = false;
            }
            if (!Pattern.matches(emailPattern, email)) {
                errorEmail = "Email must be in the form example@example.com!";
                isValid = false;
            }
            if (!Pattern.matches(mobilePattern, phone)) {
                errorPhone = "Invalid Vietnam mobile number! Phone must begin with 0(3,5,7,8,9) and have 8 digits.";
                isValid = false;
            }

            if (isValid) {
                User newUser = new User(userid, name, "", phone, email, address, postCode, "", 2, "");
                userDao.updateUser(newUser);
                session.setAttribute("inforUserLogin", newUser); // Update the session attribute
                request.setAttribute("account", newUser); // Set the updated user in the request scope
                request.getRequestDispatcher("ViewUser/viewprofile.jsp").forward(request, response); // Forward to viewprofile.jsp
            } else {
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("postCode", postCode);
                request.setAttribute("address", address);
                request.setAttribute("errorName", errorName);
                request.setAttribute("errorEmail", errorEmail);
                request.setAttribute("errorPhone", errorPhone);
                request.getRequestDispatcher("ViewUser/editprofile.jsp").forward(request, response); // Forward to the edit profile page
            }
        }
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
    }
}
