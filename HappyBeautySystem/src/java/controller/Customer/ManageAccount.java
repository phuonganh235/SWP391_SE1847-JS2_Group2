package controller.Customer;

import dal.UserDAO;
import java.io.IOException;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.regex.Pattern;
import model.User;

//author AnNp
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50)
public class ManageAccount extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        UserDAO userDao = new UserDAO();
        User editProfileUser = (User) session.getAttribute("inforUserLogin"); // get the logged-in user information
        int userid = editProfileUser.getUserId();
        String name = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("mobile");
        String birth = request.getParameter("birth");
        String address = request.getParameter("address");
        if (editProfileUser == null) {
            response.sendRedirect("login");
            return;
        }

        // Update user information
        editProfileUser.setName(name);
        editProfileUser.setEmail(email);
        editProfileUser.setMobile(phone);
        editProfileUser.setDateofbirth(birth);
        editProfileUser.setAddress(address);

        // Handle file upload
        Part filePart = request.getPart("avatar");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            String newFileName = "avatar_" + userid + fileExtension;
            String uploadPath = request.getServletContext().getRealPath("ViewUser/img/avatar");

            if (!Files.exists(Paths.get(uploadPath))) {
                Files.createDirectories(Paths.get(uploadPath));
            }
            String filePath = uploadPath + "/" + newFileName;
            filePart.write(filePath);
            String databaseImagePath = "ViewUser/img/avatar/" + newFileName;
            editProfileUser.setImage(databaseImagePath);
        }
        // Update user in database
        userDao.updateUserCustomer(editProfileUser);
        session.setAttribute("inforUserLogin", editProfileUser);
        response.sendRedirect("home");

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
