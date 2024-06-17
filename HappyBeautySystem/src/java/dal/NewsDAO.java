
package dal;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.News;

/**
 *
 * @author admin
 */
public class NewsDAO extends DBContext{
    
    public ArrayList<News> viewAllNews(){
        ArrayList<News> nList = new ArrayList<>();
        String sql = "SELECT * FROM News";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                News n = new News();
                n.setNewsId(rs.getInt("NewsID"));
                n.setTitle(rs.getString("Title"));
                n.setContent(rs.getString("Content"));
                n.setCreatedDate(rs.getTimestamp("CreateDate"));
                n.setImgUrl(rs.getString("ImageURL"));
                n.setIsConfirm(rs.getBoolean("IsConfirmed"));
                n.setUserID(rs.getInt("UserID"));
                n.setIsActive(rs.getBoolean("IsActive"));
                nList.add(n);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nList;
    }
    
    public static void main(String[] args) {
        NewsDAO dao = new NewsDAO();
        ArrayList<News> nList = dao.viewAllNews();
        for(News n : nList){
            System.out.println(n);
        }
    }
}
