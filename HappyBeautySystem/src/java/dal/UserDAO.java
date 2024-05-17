package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.User;

public class UserDAO extends DBContext{
    
    public ArrayList<User> getAllUser(){
        ArrayList<User> uList = new ArrayList<>();
        String sql = "SELECT * FROM Users";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                User u = new User();
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
        }catch(Exception e) {
            e.printStackTrace();
        }
       return uList;
    }
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        ArrayList<User> uList = dao.getAllUser();
        for(User u : uList){
            System.out.println(uList);
        }
    }
}
