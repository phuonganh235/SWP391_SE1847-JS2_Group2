package controller.Authentication;

import Utils.UserGoogleDto;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.UserDAO;
import model.User;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import Utils.IConstant;

@WebServlet(name="LoginGoogle", urlPatterns={"/LoginGoogle"})
public class LoginGoogle extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            response.sendRedirect("login.jsp"); // Redirect to login if code is null
            return;
        }

        String accessToken = getToken(code);
        UserGoogleDto user = getUserInfo(accessToken);
        UserDAO dao = new UserDAO();
        User u = dao.getUserByUsername(user.getEmail());

        if (u == null) {
            SendMail sm = new SendMail();
            String verifyCode = sm.getRandom();
            User verifyAccount = new User();
            verifyAccount.setUsername(user.getEmail());
            verifyAccount.setCode(verifyCode);
            verifyAccount.setStatuss(1);
            verifyAccount.setRoleId(2);
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

            boolean test = sm.sendEmail(verifyAccount);
            if (test) {
                HttpSession session = request.getSession();
                session.setAttribute("account", verifyAccount);
            }
            request.setAttribute("user", user);
            request.getRequestDispatcher("verifyAccount.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            if (u.getStatuss() == 2) { // Account banned
                request.setAttribute("error", "This account has been banned!");
                request.getRequestDispatcher("/ViewUser/login.jsp").forward(request, response);
                return;
            }
            session.setAttribute("user", u);
            response.sendRedirect("home");
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(IConstant.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", IConstant.GOOGLE_CLIENT_ID)
                        .add("client_secret", IConstant.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", IConstant.GOOGLE_REDIRECT_URI)
                        .add("code", code)
                        .add("grant_type", IConstant.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").getAsString();
        return accessToken;
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = IConstant.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);
        return googlePojo;
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
        return "Google Login Servlet";
    }
}
