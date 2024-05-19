package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;

public class CategoryDAO extends DBContext {

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> categoryList = new ArrayList<>();
        String sql = "SELECT * FROM Category";
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

    public Category getCategoryById(int categoryId) {
        Category category = null;
        String sql = "SELECT * FROM Category WHERE CategoryId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                category = new Category();
                category.setCategoryId(rs.getInt("CategoryId"));
                category.setCategoryName(rs.getString("CategoryName"));
                category.setCategoryImageUrl(rs.getString("CategoryImageUrl"));
                category.setIsActive(rs.getBoolean("IsActive"));
                category.setCreateDate(rs.getString("CreateDate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }

    public void addCategory(Category category) {
        String sql = "INSERT INTO Category (CategoryName, CategoryImageUrl, IsActive, CreateDate) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category.getCategoryName());
            st.setString(2, category.getCategoryImageUrl());
            st.setBoolean(3, category.isIsActive());
            st.setString(4, category.getCreateDate());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateCategory(Category category) {
        String sql = "UPDATE Category SET CategoryName = ?, CategoryImageUrl = ?, IsActive = ?, CreateDate = ? WHERE CategoryId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category.getCategoryName());
            st.setString(2, category.getCategoryImageUrl());
            st.setBoolean(3, category.isIsActive());
            st.setString(4, category.getCreateDate());
            st.setInt(5, category.getCategoryId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteCategory(int categoryId) {
        String sql = "DELETE FROM Category WHERE CategoryId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        ArrayList<Category> categoryList = dao.getAllCategories();
        for (Category category : categoryList) {
            System.out.println(category);
        }
    }
}
