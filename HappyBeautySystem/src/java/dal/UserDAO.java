package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.User;

public class UserDAO extends DBContext {

    public ArrayList<User> getAllUser() {
        ArrayList<User> uList = new ArrayList<>();
        String sql = "SELECT * FROM Users";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserId"));
                u.setName(rs.getString("Name"));
                u.setUsername(rs.getString("Username"));
                u.setMobile(rs.getString("Mobile"));
                u.setEmail(rs.getString("Email"));
                u.setAddress(rs.getString("Address"));
                u.setPostCode(rs.getString("PostCode"));
                u.setImage(rs.getString("ImageUrl"));
                u.setRoleId(rs.getInt("RoleId"));
                u.setCreateDate(rs.getString("CreateDate"));
                u.setPassword(rs.getString("Password"));
                uList.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uList;
    }

    public User login(String username, String password) {
        String sql = "SELECT * FROM Users WHERE Username = ? AND Password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("UserId"), rs.getString("Name"),
                        rs.getString("Username"), rs.getString("Mobile"),
                        rs.getString("Email"), rs.getString("Address"),
                        rs.getString("PostCode"), rs.getString("ImageUrl"),
                        rs.getInt("RoleId"), rs.getString("CreateDate"),
                        rs.getString("Password"));
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getUserById(String userId){
        String sql = "SELECT * FROM Users WHERE UserId = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                User u = new User(rs.getInt("UserId"), rs.getString("Name"),
                        rs.getString("Username"), rs.getString("Mobile"),
                        rs.getString("Email"), rs.getString("Address"),
                        rs.getString("PostCode"), rs.getString("ImageUrl"),
                        rs.getInt("RoleId"), rs.getString("CreateDate"),
                        rs.getString("Password"));
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        ArrayList<User> uList = dao.getAllUser();
        for (User u : uList) {
            System.out.println(u);
        }
    }
}
