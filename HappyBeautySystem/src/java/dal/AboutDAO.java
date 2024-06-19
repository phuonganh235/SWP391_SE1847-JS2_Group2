package dal;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.About;

public class AboutDAO extends DBContext {

    public ArrayList<About> getAllAbouts() {
        ArrayList<About> aList = new ArrayList<>();
        String sql = "SELECT * FROM About";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                About about = new About();
                about.setAboutId(rs.getInt("AboutId"));
                about.setTitle(rs.getString("Title"));
                about.setContent(rs.getString("Content"));
                about.setImageURL(rs.getString("ImageURL"));
                aList.add(about);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return aList;
    }

    public void updateAbout(About about) {
        String sql = "UPDATE About SET Title = ?, Content = ?, ImageURL = ? WHERE AboutID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, about.getTitle());
            st.setString(2, about.getContent());
            st.setString(3, about.getImageURL());
            st.setInt(4, about.getAboutId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addAbout(About about) {
        String sql = "INSERT INTO About (Title, Content, ImageURL) VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, about.getTitle());
            st.setString(2, about.getContent());
            st.setString(3, about.getImageURL());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteAbout(int aboutId) {
        String sql = "DELETE FROM About WHERE AboutID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aboutId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public About getAboutById(int aboutId) {
        About about = null;
        String sql = "SELECT * FROM About WHERE AboutId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aboutId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                about = new About();
                about.setAboutId(rs.getInt("AboutId"));
                about.setTitle(rs.getString("Title"));
                about.setContent(rs.getString("Content"));
                about.setImageURL(rs.getString("ImageURL"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return about;
    }
    
    public static void main(String[] args) {
        AboutDAO dao = new AboutDAO();
        dao.updateAbout(new About(4, "c", "c", "c"));
        
    }
}
