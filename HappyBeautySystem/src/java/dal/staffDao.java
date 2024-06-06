/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Staff;
import java.sql.PreparedStatement;

/**
 *
 * @author phuan
 */
public class staffDao extends DBContext {

    public Vector<Staff> getAll(String sql) {
        Vector<Staff> vector = new Vector<Staff>();
        try {
            Statement sta = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = sta.executeQuery(sql);
            while (rs.next()) {
                int staffId = rs.getInt(1);
                String Name = rs.getString(2);
                String phone = rs.getString(5);
                String email = rs.getString(4);
                int RoldeId = rs.getInt(3);
                String gender = rs.getString(6);
                String password = rs.getString(7);
                Staff newStaff = new Staff(staffId, Name, email, phone, gender, password, RoldeId);
                vector.add(newStaff);

            }
        } catch (SQLException ex) {
            Logger.getLogger(staffDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vector;
    }

    public Staff getStaffById(int staffid) {
        String sql = "SELECT* FROM Staff WHERE staffId = ?";

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, staffid);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {

                String Name = rs.getString(2);
                String email = rs.getString(4);
                String phone = rs.getString(5);
                int RoldeId = rs.getInt(3);
                String gender = rs.getString(6);
                String password = rs.getString(7);
                Staff newStaff = new Staff(staffid, Name, email, phone, gender, password, RoldeId);
                return newStaff;
            }

        } catch (SQLException ex) {

        }
        return null;
    }

    public int insertStaff(Staff staff) {
        int n = 0;
        String sqlInsert = "INSERT INTO [dbo].[Staff]([name] ,[RoleId],[email],[phone] ,[gender],[password])"
                + "VALUES(?,?,?,?,?,?)";

        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sqlInsert);
            pre.setString(1, staff.getName());
            pre.setInt(2, staff.getRoleid());
            pre.setString(3, staff.getEmail());
            pre.setString(4, staff.getPhone());
            pre.setString(5, staff.getGender());
            pre.setString(6, staff.getPassword());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(staffDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateStaff(Staff staff) {
        int n = 0;
        String sqlEdit = "UPDATE [dbo].[Staff]"
                + "   SET [name] = ? "
                + "      ,[email] = ? "
                + "      ,[phone] = ?"
                + "      ,[gender] = ?"
                + "       ,[password] = ? "
                + " WHERE [staffId] = ?";  // Sửa lỗi cú pháp

        try (PreparedStatement pre = connection.prepareStatement(sqlEdit)) {
            pre.setString(1, staff.getName());
            pre.setString(2, staff.getEmail());
            pre.setString(3, staff.getPhone());
            pre.setString(4, staff.getGender());
            pre.setString(5, staff.getPassword());
            pre.setInt(6, staff.getStaffId());  // Đặt staffId đúng vị trí
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(staffDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public void deleteStaff(int staffId) {
        String sql = "DELETE FROM Staff WHERE staffId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, staffId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Vector<Staff> serachStaffByName(String name) {
        Vector<Staff> vector = new Vector<Staff>();
        String sqlSerach = "select * from Staff where name like '%" + name + "%'";

        Statement statement;
        try {
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = statement.executeQuery(sqlSerach);
            while (rs.next()) {
                int staffId = rs.getInt(1);
                String Name = rs.getString(2);
                String phone = rs.getString(5);
                String email = rs.getString(4);
                int RoldeId = rs.getInt(3);
                String gender = rs.getString(6);
                String password = rs.getString(7);
                Staff newStaff = new Staff(staffId, Name, email, phone, gender, password, RoldeId);
                vector.add(newStaff);
            }
        } catch (SQLException ex) {
            Logger.getLogger(staffDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

      public boolean checkExistEmail(String email) {
        String sql = "SELECT * FROM Staff WHERE email = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return true; // Email exists
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Email does not exist
    }

  public boolean checkExistPassword(String password) {
        String sql = "SELECT * FROM Staff WHERE password = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return true; // Password exists
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Password does not exist
    }

     public static void main(String[] args) {
        staffDao dao = new staffDao();
        boolean exists = dao.checkExistPassword("Hong23@2309456");
        System.out.println("Email exists: " + exists);
    }
}
