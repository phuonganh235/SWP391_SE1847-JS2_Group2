package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Product;

public class ProductDAO extends DBContext {

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> pList = new ArrayList<>();
        String sql = "SELECT * FROM Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product prd = new Product();
                prd.setProductId(rs.getInt("ProductId"));
                prd.setProductName(rs.getString("ProductName"));
                prd.setShortDes(rs.getString("ShortDescription"));
                prd.setLongDes(rs.getString("LongDescription"));
                prd.setAddDes(rs.getString("AdditionalDescription"));
                prd.setPrice(rs.getFloat("Price"));
                prd.setQuantity(rs.getInt("Quantity"));
                prd.setSize(rs.getString("Size"));
                prd.setColor(rs.getString("Color"));
                prd.setCompanyName(rs.getString("CompanyName"));
                prd.setCateId(rs.getInt("CategoryId"));
                prd.setSubCateId(rs.getInt("SubCategoryId"));
                prd.setSold(rs.getInt("Sold"));
                prd.setIsCustomized(rs.getBoolean("IsCustomized"));
                prd.setIsActive(rs.getBoolean("IsCustomized"));
                prd.setCreateDate(rs.getString("CreateDate"));
                pList.add(prd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pList;
    }

    public Product getProductById(int productId) {
        Product product = null;
        String sql = "SELECT * FROM Product WHERE ProductId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setProductName(rs.getString("ProductName"));
                product.setShortDes(rs.getString("ShortDescription"));
                product.setLongDes(rs.getString("LongDescription"));
                product.setAddDes(rs.getString("AdditionalDescription"));
                product.setPrice(rs.getFloat("Price"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setSize(rs.getString("Size"));
                product.setColor(rs.getString("Color"));
                product.setCompanyName(rs.getString("CompanyName"));
                product.setCateId(rs.getInt("CategoryId"));
                product.setSubCateId(rs.getInt("SubCategoryId"));
                product.setSold(rs.getInt("Sold"));
                product.setIsCustomized(rs.getBoolean("IsCustomized"));
                product.setIsActive(rs.getBoolean("IsActive"));
                product.setCreateDate(rs.getString("CreateDate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    public void addProduct(Product product) {
        String sql = "INSERT INTO Product (ProductName, ShortDescription, LongDescription, AdditionalDescription, Price, Quantity, Size, Color, CompanyName, CategoryId, SubCategoryId, Sold, IsCustomized, IsActive, CreateDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getProductName());
            st.setString(2, product.getShortDes());
            st.setString(3, product.getLongDes());
            st.setString(4, product.getAddDes());
            st.setFloat(5, product.getPrice());
            st.setInt(6, product.getQuantity());
            st.setString(7, product.getSize());
            st.setString(8, product.getColor());
            st.setString(9, product.getCompanyName());
            st.setInt(10, product.getCateId());
            st.setInt(11, product.getSubCateId());
            st.setInt(12, product.getSold());
            st.setBoolean(13, product.isIsCustomized());
            st.setBoolean(14, product.isIsActive());
            st.setString(15, product.getCreateDate());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(Product product) {
        String sql = "UPDATE Product SET ProductName = ?, ShortDescription = ?, LongDescription = ?, AdditionalDescription = ?, Price = ?, Quantity = ?, Size = ?, Color = ?, CompanyName = ?, CategoryId = ?, SubCategoryId = ?, Sold = ?, IsCustomized = ?, IsActive = ?, CreateDate = ? WHERE ProductId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getProductName());
            st.setString(2, product.getShortDes());
            st.setString(3, product.getLongDes());
            st.setString(4, product.getAddDes());
            st.setFloat(5, product.getPrice());
            st.setInt(6, product.getQuantity());
            st.setString(7, product.getSize());
            st.setString(8, product.getColor());
            st.setString(9, product.getCompanyName());
            st.setInt(10, product.getCateId());
            st.setInt(11, product.getSubCateId());
            st.setInt(12, product.getSold());
            st.setBoolean(13, product.isIsCustomized());
            st.setBoolean(14, product.isIsActive());
            st.setString(15, product.getCreateDate());
            st.setInt(16, product.getProductId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int productId) {
        String sql = "DELETE FROM Product WHERE ProductId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        ArrayList<Product> pList = dao.getAllProduct();
        Product p = dao.getProductById(1);
        
        
    }
}
