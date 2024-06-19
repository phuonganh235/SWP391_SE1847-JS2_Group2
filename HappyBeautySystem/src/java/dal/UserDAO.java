package dal;

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
                        rs.getInt("Statuss"),
                        rs.getString("DateOfBirth") // Lấy giá trị trường dateOfBirth
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
                        rs.getString("DateOfBirth")); // Lấy giá trị trường dateOfBirth
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
            ps.setString(11, dateOfBirth); // Thêm giá trị dateOfBirth
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

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();

        User u = userDAO.login("sangtv", "sang@12234");
        System.out.println(u);
        System.out.println(userDAO.getUserByProductId(1));
        // Create a new user
        // Tạo đối tượng User để kiểm tra
//        User user = new User();
//        user.setUserId(1050); // ID người dùng cần cập nhật
//        user.setName("Nguyen Van A");
//        user.setUsername("nguyenvana");
//        user.setMobile("0912345678");
//        user.setEmail("nguyenvana@example.com");
//        user.setAddress("123 Đường ABC, Quận 1");
//        user.setPostCode("700000");
//        user.setPassword("Passw0rd!");
//        user.setStatuss(1);
//        user.setDateofbirth("2000-01-01");
//
//        // Gọi hàm updateUser và in ra kết quả
//        int result = userDAO.updateUser(user);
//        if (result > 0) {
//            System.out.println("Cập nhật thành công!");
//        } else {
//            System.out.println("Cập nhật thất bại!");
//        }
    }
}
