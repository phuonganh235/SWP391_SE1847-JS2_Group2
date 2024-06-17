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
        String sql = "UPDATE About SET Title = ?, Content = ?, ImageURL = ? WHERE AboutId = ?";
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

    public static void main(String[] args) {
        AboutDAO dao = new AboutDAO();
        dao.updateAbout(new About(1, "ABOUT US", "> Blockquotes can also be nested...\n"
                + ">> ...by using additional greater-than signs right next to each other...\n"
                + "> > > ...or with spaces between arrows.", "ViewUser\\img\\image_av.jpg"));
        ArrayList<About> ab = dao.getAllAbouts();
        for (About about : ab) {
            System.out.println(about);
        }
    }
}
