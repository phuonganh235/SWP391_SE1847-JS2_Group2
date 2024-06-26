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
                n.setCategoryID(rs.getInt("CategoryID"));
                nList.add(n);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nList;
    }

    public boolean addNews(News news) {
    String sql = "INSERT INTO [dbo].[News]([Title],[Content],[CreateTime],[ImageURL],[IsConfirmed],[UserID],[IsActive],[UpdateTime],[CategoryID])"
               + " VALUES(?,?,?,?,0,?,1,?,?)";
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
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0; // Return true if at least one row is affected
    } catch (Exception e) {
        e.printStackTrace();
        return false; // Return false if an exception occurs
    }
}

    public boolean updateNews(News news) {
    String sql = "UPDATE [dbo].[News] "
            + "SET [Title] = ?, [Content] = ?, [CreateTime] = ?, [ImageURL] = ?, "
            + "[IsConfirmed] = 0, [UserID] = ?, [IsActive] = 1, [UpdateTime] = ?, [CategoryID] = ? "
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
        
        int rowsUpdated = ps.executeUpdate();
        return rowsUpdated > 0; // Trả về true nếu có ít nhất một dòng được cập nhật thành công
    } catch (Exception e) {
        e.printStackTrace();
        return false; // Trả về false nếu có lỗi xảy ra
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

    public News getNewsById(int newsId) {
        News news = null;
        String sql = "SELECT * FROM News WHERE NewsID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newsId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                news = new News();
                news.setNewsId(rs.getInt("NewsID"));
                news.setTitle(rs.getString("Title"));
                news.setContent(rs.getString("Content"));
                news.setCreateTime(rs.getTimestamp("CreateTime"));
                news.setImgUrl(rs.getString("ImageURL"));
                news.setIsConfirm(rs.getBoolean("IsConfirmed"));
                news.setUserID(rs.getInt("UserID"));
                news.setIsActive(rs.getBoolean("IsActive"));
                news.setUpdateTime(rs.getTimestamp("UpdateTime"));
                news.setCategoryID(rs.getInt("CategoryID"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }

    public static void main(String[] args) {
        NewsDAO dao = new NewsDAO();
        ArrayList<News> nList = dao.viewAllNews();
        for (News n : nList) {
            System.out.println(n);
        }
    }
}
