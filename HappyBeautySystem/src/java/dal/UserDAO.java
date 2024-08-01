package dal;

import controller.Authentication.PasswordUtil;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class UserDAO extends DBContext {

    // Retrieves all users from the Users table in the database
    public ArrayList<User> getAllUser(String sql) {
        ArrayList<User> uList = new ArrayList<>();

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
                u.setDateofbirth(rs.getString("DateOfBirth"));
                uList.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uList;
    }
    

    public User getUserByEmail(String email) {
        User user = null;
        String sql = "SELECT * FROM Users WHERE Email = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setUserId(rs.getInt("UserId"));
                    user.setName(rs.getString("Name"));
                    user.setUsername(rs.getString("Username"));
                    user.setMobile(rs.getString("Mobile"));
                    user.setEmail(rs.getString("Email"));
                    user.setAddress(rs.getString("Address"));
                    user.setPostCode(rs.getString("PostCode"));
                    user.setImage(rs.getString("ImageUrl"));
                    user.setRoleId(rs.getInt("RoleId"));
                    user.setCreateDate(rs.getString("CreateDate"));
                    user.setPassword(rs.getString("Password"));
                    user.setStatuss(rs.getInt("Statuss"));
                    user.setDateofbirth(rs.getString("DateOfBirth"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error in getUserByEmail: " + e.getMessage());
            e.printStackTrace();
        }

        return user;
    }

    public boolean emailExistsInDatabase(String email) {
        String sql = "SELECT COUNT(*) FROM Users WHERE Email = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<User> SearchStaffByName(String name) {
        ArrayList<User> uList = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE name LIKE ? AND RoleId = 4";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
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
                u.setDateofbirth(rs.getString("DateOfBirth"));
                uList.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uList;
    }

    public ArrayList<User> SearchShipperByName(String name) {
        ArrayList<User> uList = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE name LIKE ? AND RoleId =3";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
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
                u.setDateofbirth(rs.getString("DateOfBirth"));
                uList.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uList;
    }

    public int insertUser(User user) {
        int n = 0;
        PreparedStatement pre;
        String sqlInsert = "INSERT INTO [dbo].[Users]([Name],[Username],[Mobile],[Email],[Address] ,[PostCode],[ImageUrl] ,[RoleId],[CreateDate] ,[Password] ,[Statuss],[DateOfBirth]) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            pre = connection.prepareStatement(sqlInsert);
            pre.setString(1, user.getName());
            pre.setString(2, user.getUsername());
            pre.setString(3, user.getMobile());
            pre.setString(4, user.getEmail());
            pre.setString(5, user.getAddress());
            pre.setString(6, user.getPostCode() != null ? user.getPostCode() : "");
            pre.setString(7, user.getImage() != null ? user.getImage() : "");
            pre.setInt(8, user.getRoleId());
            pre.setString(9, user.getCreateDate());
            pre.setString(10, user.getPassword());
            pre.setInt(11, user.getStatuss());
            pre.setString(12, user.getDateofbirth());
            n = pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Authenticates a user with the provided username and password
    public User login(String username, String password) {
    String sql = "SELECT * FROM [Users] WHERE Username = ? AND Password = ?";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        String encodedPassword = PasswordUtil.encodePassword(password);
        ps.setString(1, username);
        ps.setString(2, encodedPassword);
        
        try (ResultSet rs = ps.executeQuery()) {
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
                    rs.getInt("Statuss"),
                    rs.getString("DateOfBirth")
                );
            }
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
                        rs.getString("Password"), rs.getInt("Statuss"),
                        rs.getString("DateOfBirth")); // Lấy giá trị trường dateOfBirth
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Retrieves a user by their userId
    public User getUserByUserId(int userId) {
        String sql = "SELECT * FROM Users WHERE UserId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("UserId"), rs.getString("Name"),
                        rs.getString("Username"), rs.getString("Mobile"),
                        rs.getString("Email"), rs.getString("Address"),
                        rs.getString("PostCode"), rs.getString("ImageUrl"),
                        rs.getInt("RoleId"), rs.getString("CreateDate"),
                        rs.getString("Password"), rs.getInt("Statuss"),
                        rs.getString("DateOfBirth")); // Lấy giá trị trường dateOfBirth
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
                        rs.getString("Password"), rs.getInt("Statuss"),
                        rs.getString("DateOfBirth"));
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Checks if an email already exists in the Users table
    public boolean checkExistEmail(String email, int roleId) {
        String sql = "SELECT COUNT(*) FROM Users WHERE Email = ? and RoleId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setInt(2, roleId);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                return true; // Email already exists
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    // Method to check if user exists

    public boolean userExists(String username, int roleId) {
        String sql = "SELECT COUNT(*) FROM Users WHERE Username = ? and RoleId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setInt(2, roleId);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Registers a new user with the provided details
    public void register(String name, String username, String password, String mobile, String email, String address, String postCode, String createDate, int roleId, int statuss, String dateOfBirth) {
    String sql = "INSERT INTO Users (Name, Username, Mobile, Email, Address, PostCode, RoleId, CreateDate, Password, Statuss, DateOfBirth) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        String encodedPassword = PasswordUtil.encodePassword(password);
        
        ps.setString(1, name);
        ps.setString(2, username);
        ps.setString(3, mobile);
        ps.setString(4, email);
        ps.setString(5, address);
        ps.setString(6, postCode);
        ps.setInt(7, roleId);
        ps.setString(8, createDate);
        ps.setString(9, encodedPassword);
        ps.setInt(10, statuss);
        ps.setString(11, dateOfBirth);
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
                + " SET [Name] = ?,"
                + " [Username] = ?,"
                + " [Mobile] = ?,"
                + " [Email] = ?,"
                + " [Address] = ?,"
                + " [PostCode] = ?,"
                + " [Password] = ?,"
                + " [Statuss] = ?,"
                + " [DateOfBirth] = ?"
                + " WHERE [UserId] = ?";

        try (PreparedStatement pre = connection.prepareStatement(sqlUpdate)) {
            pre.setString(1, user.getName());
            pre.setString(2, user.getUsername());
            pre.setString(3, user.getMobile());
            pre.setString(4, user.getEmail());
            pre.setString(5, user.getAddress());
            pre.setString(6, user.getPostCode());
            pre.setString(7, user.getPassword());
            pre.setInt(8, user.getStatuss());
            pre.setString(9, user.getDateofbirth());
            pre.setInt(10, user.getUserId());

            n = pre.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateUserRole(int roleId, int userId) {
        int n = 0;
        String sqlUpdate = "UPDATE [dbo].[Users] SET [RoleId] = ? WHERE userId = ?";

        try (PreparedStatement pre = connection.prepareStatement(sqlUpdate)) {
            pre.setInt(1, roleId);  // Set the roleId parameter
            pre.setInt(2, userId);  // Set the userId parameter

            n = pre.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;  // Return the number of rows affected
    }

    public int updateUserCustomer(User user) {
        int n = 0;
        String sqlUpdate = "UPDATE [dbo].[Users]"
                + " SET [Name] = ?,"
                + " [Mobile] = ?,"
                + " [Email] = ?,"
                + " [Address] = ?,"
                + " [ImageUrl] = ?,"
                + " [DateOfBirth] = ?"
                + " WHERE [UserId] = ?";

        try (PreparedStatement pre = connection.prepareStatement(sqlUpdate)) {
            pre.setString(1, user.getName());
            pre.setString(2, user.getMobile());
            pre.setString(3, user.getEmail());
            pre.setString(4, user.getAddress());
            pre.setString(5, user.getImage());
            pre.setString(6, user.getDateofbirth());
            pre.setInt(7, user.getUserId());

            n = pre.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public void deleteStaff(int staffId) {
        String sql = "DELETE FROM Users WHERE userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, staffId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
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
                u.setDateofbirth(rs.getString("DateOfBirth")); // Lấy giá trị trường dateOfBirth
                uList.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uList;
    }

    //    Count numbers of users
    public int CountUser() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count' FROM users where RoleId = '2' or RoleId = '2' ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    public User getUser(int userId, String old_pass) {
        try {
            String sql = "select * from Users where UserId = ? and Password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, old_pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
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
                u.setDateofbirth(rs.getString("DateOfBirth"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void changePassword(int userId, String new_pass1) {
        try {
            String sql = "UPDATE Users SET Password = ? WHERE UserId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, new_pass1);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<User> getUserByProductId(int productId) {
        ArrayList<User> uList = new ArrayList<>();
        String sql = "SELECT u.* FROM Users u \n"
                + "INNER JOIN Cart c ON u.UserId = c.UserId \n"
                + "INNER JOIN Product p ON p.ProductId = c.ProductId \n"
                + "WHERE p.ProductId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
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
                u.setDateofbirth(rs.getString("DateOfBirth")); // Lấy giá trị trường DateOfBirth
                uList.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return uList;
    }

    public ArrayList<User> getUserByProductId2(int productId) {
        ArrayList<User> uList = new ArrayList<>();
        String sql = "SELECT distinct u.* FROM Users u \n"
                + "INNER JOIN Feedback f ON u.UserId = f.user_id \n"
                + "INNER JOIN Product p ON p.ProductId = f.product_id \n"
                + "where p.ProductId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
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
                u.setDateofbirth(rs.getString("DateOfBirth")); // Lấy giá trị trường DateOfBirth
                uList.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return uList;
    }

    public boolean updateUserStatus(int userId, int newStatus) {
        String sql = "UPDATE Users SET Statuss = ? WHERE UserId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newStatus);
            ps.setInt(2, userId);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getUserIdByUsername(String username) {
        int userId = -1;
        String query = "SELECT id FROM Users WHERE username = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    userId = rs.getInt("id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userId;
    }

    public static void main(String[] args) {
        UserDAO userDB = new UserDAO();
        // Kiểm tra hàm checkExistEmail
        String testEmail = "sang@gmail.com";
        int testRoleId = 3;
        boolean emailExists = userDB.checkExistEmail(testEmail, testRoleId);
        System.out.println("Email " + testEmail + " exists: " + emailExists);

        // Kiểm tra hàm userExists
        String testUsername = "sangtv";
        boolean userExists = userDB.userExists(testUsername, testRoleId);
        System.out.println("User " + testUsername + " exists: " + userExists);

    }
}
