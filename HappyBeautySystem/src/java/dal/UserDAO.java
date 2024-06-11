package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class UserDAO extends DBContext {

    // Retrieves all users from the Users table in the database
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
                u.setStatuss(rs.getInt("Statuss")); // Lấy giá trị trường Statuss
                uList.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uList;
    }

    // Authenticates a user with the provided username and password
    public User login(String username, String password) {
        String sql = "SELECT * FROM [Users] WHERE Username = ? AND Password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("UserId"),
                        rs.getString("Name"),
                        rs.getString("Username"),
                        rs.getString("Mobile"),
                        rs.getString("Email"),
                        rs.getString("Address"),
                        rs.getString("PostCode"),
                        rs.getString("ImageUrl"),
                        rs.getInt("RoleId"),
                        rs.getString("CreateDate"),
                        rs.getString("Password"),
                        rs.getInt("Statuss") // Thêm giá trị Statuss vào constructor
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Retrieves a user by their userId
    public User getUserById(String userId) {
        String sql = "SELECT * FROM Users WHERE UserId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("UserId"), rs.getString("Name"),
                        rs.getString("Username"), rs.getString("Mobile"),
                        rs.getString("Email"), rs.getString("Address"),
                        rs.getString("PostCode"), rs.getString("ImageUrl"),
                        rs.getInt("RoleId"), rs.getString("CreateDate"),
                        rs.getString("Password"), rs.getInt("Statuss")); // Thêm giá trị Statuss vào constructor
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Retrieves a user by their username
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM Users WHERE Username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("UserId"), rs.getString("Name"),
                        rs.getString("Username"), rs.getString("Mobile"),
                        rs.getString("Email"), rs.getString("Address"),
                        rs.getString("PostCode"), rs.getString("ImageUrl"),
                        rs.getInt("RoleId"), rs.getString("CreateDate"),
                        rs.getString("Password"), rs.getInt("Statuss")); // Thêm giá trị Statuss vào constructor
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Checks if an email already exists in the Users table
    public boolean checkExistEmail(String email) {
        String sql = "SELECT * FROM Users WHERE Email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return false; // Email đã tồn tại
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    // Registers a new user with the provided details
    public void register(String name, String username, String password, String mobile, String email, String address, String postCode, String createDate, int roleId, int statuss) {
        String sql = "INSERT INTO Users (Name, Username, Mobile, Email, Address, PostCode, RoleId, CreateDate, Password, Statuss) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, username);
            ps.setString(3, mobile);
            ps.setString(4, email);
            ps.setString(5, address);
            ps.setString(6, postCode);
            ps.setInt(7, roleId);
            ps.setString(8, createDate);
            ps.setString(9, password);
            ps.setInt(10, statuss);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Retrieves the role of a user based on their username and password
    public int getRole(String username, String password) {
        String sql = "SELECT RoleId FROM Users WHERE Username = ? AND Password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("RoleId");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 2;
    }

    public int updateUser(User user) {
        int n = 0;
        String sqlUpdate = "UPDATE [dbo].[Users]"
                + "   SET [Name] = ?,"
                + "      [Mobile] = ?,"
                + "      [Email] = ?,"
                + "      [Address] = ?,"
                + "      [PostCode] = ?,"
                + "      [Statuss] = ?" // Thêm giá trị trường Statuss vào câu lệnh cập nhật
                + " WHERE [UserId] = ?";

        try (PreparedStatement pre = connection.prepareStatement(sqlUpdate)) {
            pre.setString(1, user.getName());
            pre.setString(2, user.getMobile());
            pre.setString(3, user.getEmail());
            pre.setString(4, user.getAddress());
            pre.setString(5, user.getPostCode());
            pre.setInt(6, user.getStatuss());
            pre.setInt(7, user.getUserId());

            n = pre.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Change password when forgot or user wants to change their password
    public void updatePassword(String password, String username) {
        String sql = "UPDATE Users SET Password = ? WHERE Username = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, password);
            preparedStatement.setString(2, username);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // Retrieves users by their roleId and statuss

    public ArrayList<User> getUserByRoleIdAndStatuss(int roleId, int statuss) {
        ArrayList<User> uList = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE RoleId = ? AND Statuss = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roleId);
            ps.setInt(2, statuss);
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
                u.setStatuss(rs.getInt("Statuss"));
                uList.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uList;
    }

    // Method to check if user exists
    public boolean userExists(String username) {
        String sql = "SELECT COUNT(*) FROM Users WHERE Username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
        // Retrieves users by their roleId and statuss
    public ArrayList<User> getUserByRoleIdAndStatus(int roleId, int statuss) {
        ArrayList<User> uList = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE RoleId = ? AND Statuss = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roleId);
            ps.setInt(2, statuss);
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
                u.setStatuss(rs.getInt("Statuss"));
                uList.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uList;
    }
}
