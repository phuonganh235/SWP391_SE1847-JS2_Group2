package dal;

import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;
import model.News;

public class NewsDAO extends DBContext {

    public ArrayList<News> viewAllNews() {
        ArrayList<News> nList = new ArrayList<>();
        String sql = "SELECT n.*, c.CategoryName FROM News n JOIN Category c ON n.CategoryID = c.CategoryID";
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

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
                n.setCategoryName(rs.getString("CategoryName")); // Add this line to set the category name
                nList.add(n);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nList;
    }

    public ArrayList<News> searchNews(String query) {
        ArrayList<News> newsList = new ArrayList<>();
        String sql = "SELECT n.*, c.CategoryName FROM News n JOIN Category c ON n.CategoryID = c.CategoryID WHERE n.Title LIKE ? OR n.Content LIKE ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + query + "%");
            ps.setString(2, "%" + query + "%");
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
                n.setCategoryName(rs.getString("CategoryName"));
                newsList.add(n);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newsList;
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
                + "SET [Title] = ?, [Content] = ?, [ImageURL] = ?, "
                + "[IsActive] = ?, [UpdateTime] = GETDATE(), [CategoryID] = ? "
                + "WHERE [NewsID] = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getContent());
            ps.setString(3, news.getImgUrl());
            ps.setBoolean(4, news.isIsActive());
            ps.setInt(5, news.getCategoryID());
            ps.setInt(6, news.getNewsId());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean hideNews(int newsId) {
        String sql = "UPDATE News SET isActive = 0 WHERE newsId = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, newsId);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
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

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> categoryList = new ArrayList<>();
        String sql = "SELECT * FROM Category WHERE IsActive = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryId(rs.getInt("CategoryId"));
                category.setCategoryName(rs.getString("CategoryName"));
                category.setCategoryImageUrl(rs.getString("CategoryImageUrl"));
                category.setIsActive(rs.getBoolean("IsActive"));
                category.setCreateDate(rs.getString("CreateDate"));
                categoryList.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categoryList;
    }

    public static void main(String[] args) {
        NewsDAO dao = new NewsDAO();
        ArrayList<News> nList = dao.viewAllNews();
        for (News n : nList) {
            System.out.println(n);
        }
    }
}
