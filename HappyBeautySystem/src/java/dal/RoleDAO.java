package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;

public class RoleDAO extends DBContext {

    // Retrieves all users from the Users table in the database
    public ArrayList<Role> getAllRole() {
        ArrayList<Role> uList = new ArrayList<>();
        String sql = "Select * from Roles";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Role u = new Role();
                u.setRoleId(rs.getInt("RoleId"));
                u.setName(rs.getString("Name"));
                u.setDescription(rs.getString("Description"));

                uList.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uList;
    }

    public Role getRoleById(int roleId) {
        Role role = null;
        String sql = "SELECT * FROM Roles WHERE RoleId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                role = new Role();
                role.setRoleId(rs.getInt("RoleId"));
                role.setName(rs.getString("Name"));
                role.setDescription(rs.getString("Description"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return role;
    }
    
    public void addRole(Role about) {
        String sql = "INSERT INTO Roles (RoleId, Name, Description) VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, about.getRoleId());
            st.setString(2, about.getName());
            st.setString(3, about.getDescription());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateRole(Role about) {
        String sql = "UPDATE Roles SET RoleId = ?, Name = ?, Description = ? WHERE RoleID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, about.getRoleId());
            st.setString(2, about.getName());
            st.setString(3, about.getDescription());
            st.setInt(4, about.getRoleId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteRole(int roleId) {
        String sql = "DELETE FROM Roles WHERE RoleID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        RoleDAO userDB = new RoleDAO();
        ArrayList<Role> pList = userDB.getAllRole();
        for (Role product : pList) {
            System.out.println(product);
        }
//        int testRoleId = 3;

    }
}
