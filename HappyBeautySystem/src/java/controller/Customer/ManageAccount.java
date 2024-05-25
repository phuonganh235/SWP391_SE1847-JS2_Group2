package controller.Customer;
import dal.UserDAO;
import java.io.IOException;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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

        //kiểm tra co yeu cau nao khong
        if (service == null) {
            response.sendRedirect("home");
            return;
        }

        switch (service) {
            // view user
            case "ViewProfile":
                //lay thong tin user khi da login
                User viewProfileUser = (User) session.getAttribute("inforUser");
                
                if (viewProfileUser != null) { // neu user da login
                    request.setAttribute("account", viewProfileUser);
                    request.getRequestDispatcher("ViewUser/viewprofile.jsp").forward(request, response);
                } else { // neu user chua login
                    response.sendRedirect("home");
                }
                break;
              //edit thong user
            case "editProfile":
                String submit = request.getParameter("submit"); //lay tham so submit tu trang editprofile
                if (submit == null) { // neu user chua gui form
                    User editProfileUser = (User) session.getAttribute("inforUser"); // lay thong tin user da login
                    if (editProfileUser != null) { // neu user da login  đặt thông tin user vào infor
                        request.setAttribute("infor", editProfileUser);
                        request.getRequestDispatcher("ViewUser/editprofile.jsp").forward(request, response);
                    } else { // neu user chua login
                        response.sendRedirect("login");
                    }
                } else { // neu user gui form 
                    User editProfileUser = (User) session.getAttribute("inforUser"); //lay thong tin user da login
                    if (editProfileUser != null) { // user da ton tai thuc hien lay thong tin tu form và update
                        int userid = editProfileUser.getUserId(); 
                        String name = request.getParameter("name");
                        String email = request.getParameter("email");
                        String phone = request.getParameter("phone");
                        String postCode = request.getParameter("postCode");
                        String address = request.getParameter("address");

                        User newUser = new User(userid, name, "", phone, email, address, postCode, "", 2, "");
                         userDao.updateUser(newUser);
                        session.setAttribute("inforUser", newUser);
                        response.sendRedirect("ViewUser/viewprofile.jsp");

                    } else { // khong ton tai user
                        response.sendRedirect("login");
                    }
                }
                break;

            default:
                request.getRequestDispatcher("/HappyBeautySystem/ViewUser/viewprofile.jsp").forward(request, response);
                break;
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
