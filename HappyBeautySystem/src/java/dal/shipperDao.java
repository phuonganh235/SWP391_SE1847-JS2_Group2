/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.Vector;
import model.Shipper;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class shipperDao extends DBContext {

    public Vector<Shipper> getAll(String sql) {
        Vector<Shipper> vector = new Vector<Shipper>();

        Statement sta;
        try {
            sta = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = sta.executeQuery(sql);
            while (rs.next()) {
                int shipperId = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String phone = rs.getString(4);
                int RoleId = rs.getInt(5);
                String gender = rs.getString(6);
                String password = rs.getString(7);
                Shipper newShipper = new Shipper(shipperId, name, email, phone, RoleId, gender, password);
                vector.add(newShipper);

            }
        } catch (SQLException ex) {
            Logger.getLogger(shipperDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Shipper getShipperById(int shipperId) {
        String sql = "SELECT* FROM Shipper WHERE shipperId = ?";

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, shipperId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {

                String name = rs.getString(2);
                String email = rs.getString(3);
                String phone = rs.getString(4);
                int RoleId = rs.getInt(5);
                String gender = rs.getString(6);
                String password = rs.getString(7);
                Shipper newShipper = new Shipper(shipperId, name, email, phone, RoleId, gender, password);
                return newShipper;
            }

        } catch (SQLException ex) {

        }
        return null;
    }

    public int insertShipper(Shipper shipper) {
        int n = 0;
        String sqlInsert = "INSERT INTO [dbo].[Shipper] ([name],[email],[phone],[RoleId],[gender],[password]) VALUES (?,?,?,?,?,?)";

        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sqlInsert);
            pre.setString(1, shipper.getName());
            pre.setString(2, shipper.getEmail());
            pre.setString(3, shipper.getPhone());
            pre.setInt(4, shipper.getRoleId());
            pre.setString(5, shipper.getGender());
            pre.setString(6, shipper.getPassword());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(staffDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateShipper(Shipper shipper) {
        int n = 0;
        String sqlEdit = "UPDATE [dbo].[Shipper]"
                + "   SET [name] = ?"
                + "      ,[email] = ?"
                + "      ,[phone] = ?"
                + "      ,[RoleId] = ?"
                + "      ,[gender] = ?"
                + "      ,[password] = ?"
                + " WHERE shipperId = ?";

        try (PreparedStatement pre = connection.prepareStatement(sqlEdit)) {
            pre.setString(1, shipper.getName());
            pre.setString(2, shipper.getEmail());
            pre.setString(3, shipper.getPhone());
            pre.setInt(4, shipper.getRoleId());
            pre.setString(5, shipper.getGender());
            pre.setString(6, shipper.getPassword());
            pre.setInt(7, shipper.getShipperId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(staffDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public void deleteShipper(int shipperId) {
        String sql = "DELETE FROM Shipper WHERE shipperId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, shipperId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Vector<Shipper> serachShipperByName(String name) {
        Vector<Shipper> vector = new Vector<Shipper>();
        String sqlSerach = "select * from Shipper where name like '%" + name + "%'";

        Statement statement;
        try {
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = statement.executeQuery(sqlSerach);
            while (rs.next()) {
                int shipperId = rs.getInt(1);
                String Name = rs.getString(2);
                String email = rs.getString(3);
                String phone = rs.getString(4);
                int RoleId = rs.getInt(5);
                String gender = rs.getString(6);
                String password = rs.getString(7);
                Shipper newShipper = new Shipper(shipperId, Name, email, phone, RoleId, gender, password);
                vector.add(newShipper);
            }
        } catch (SQLException ex) {
            Logger.getLogger(staffDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public boolean checkExistEmailShipper(String email) {
        String sql = "SELECT * FROM Shipper WHERE email = ?";
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

    public boolean checkExistPasswordShipper(String password) {
        String sql = "SELECT * FROM Shipper WHERE password = ?";
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

        shipperDao dao = new shipperDao();

    }

}
