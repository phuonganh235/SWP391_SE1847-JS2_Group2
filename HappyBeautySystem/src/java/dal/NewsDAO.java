package dal;

import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.News;

public class NewsDAO extends DBContext {

    public ArrayList<News> viewAllNews() {
        ArrayList<News> nList = new ArrayList<>();
        String sql = "SELECT * FROM News";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt("NewsID"));
                n.setTitle(rs.getString("Title"));
                n.setContent(rs.getString("Content"));
                n.setCreateTime(rs.getTimestamp("CreateTime"));
                n.setImgUrl(rs.getString("ImageURL"));
                n.setIsConfirm(rs.getBoolean("IsConfirmed"));
                n.setUserID(rs.getInt("UserID"));
                n.setIsActive(rs.getBoolean("IsActive"));
                n.setUpdateTime(rs.getTimestamp("UpdateTime"));
                n.setUserID(rs.getInt("CategoryID"));
                nList.add(n);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nList;
    }

    public void addNews(News news) {
        String sql = "INSERT INTO [dbo].[News]([Title],[Content],[CreateTime],[ImageURL],[IsConfirmed],[UserID],[IsActive],[UpdateTime]\n" +
"           ,[CategoryID])\n"
                + "     VALUES(?,?,?,?,0,?,1,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getContent());
            ps.setTimestamp(3, news.getCreateTime());
            ps.setString(4, news.getImgUrl());
            ps.setInt(5, news.getUserID());
            if (news.getUpdateTime() != null) {
                ps.setTimestamp(6, news.getUpdateTime());
            } else {
                ps.setNull(6, java.sql.Types.DATE);
            }
            ps.setInt(7, news.getCategoryID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateNews(News news) {
        String sql = "UPDATE [dbo].[News] "
                + "SET [Title] = ?, [Content] = ?, [CreateDate] = ?, [ImageURL] = ?, "
                + "[IsConfirmed] = 0, [UserID] = ?, [IsActive] = 1, [UpdateTime] = ?, [CategoryID] = ?"
                + "WHERE [NewsID] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getContent());
            ps.setTimestamp(3, news.getCreateTime());
            ps.setString(4, news.getImgUrl());
            ps.setInt(5, news.getUserID());
            if (news.getUpdateTime() != null) {
                ps.setTimestamp(6, news.getUpdateTime());
            } else {
                ps.setNull(6, java.sql.Types.TIMESTAMP);
            }
            ps.setInt(7, news.getCategoryID());
            ps.setInt(8, news.getNewsId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void hideNews(int newsId) {
        String sql = "UPDATE [dbo].[News] "
                + "SET [IsConfirmed] = 0, [IsActive] = 0 "
                + "WHERE [NewsID] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newsId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        NewsDAO dao = new NewsDAO();
        ArrayList<News> nList = dao.viewAllNews();
        for (News n : nList) {
            System.out.println(n);
        }
    }
}
