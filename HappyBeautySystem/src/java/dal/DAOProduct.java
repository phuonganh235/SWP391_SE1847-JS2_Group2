package dal;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import model.Product;
import java.sql.ResultSet;

public class DAOProduct extends DBContext {

    // Get all product
    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> pList = new ArrayList<>();
        String sql = "SELECT * FROM Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("ProductId"));
                p.setProductName(rs.getString("ProductName"));
                p.setShortDes(rs.getString("ShortDes"));
                p.setLongDes(rs.getString("LongDes"));
                p.setAddDes(rs.getString("AddDes"));
                p.setPrice(rs.getFloat("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSize(rs.getString("Size"));
                p.setColor(rs.getString("Color"));
                p.setCompanyName(rs.getString("CompanyName"));
                p.setCateId(rs.getInt("CateId"));
                p.setSubCateId(rs.getInt("SubCateId"));
                p.setSold(rs.getInt("Sold"));
                p.setIsCustomized(rs.getBoolean("IsCustomized"));
                p.setIsActive(rs.getBoolean("IsActive"));
                p.setCreateDate(rs.getString("CreateDate"));
                pList.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pList;
    }

    public ArrayList<Product> getProductsByQuery(String sql) {
        ArrayList<Product> pList = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("ProductId"));
                p.setProductName(rs.getString("ProductName"));
                p.setShortDes(rs.getString("ShortDescription"));
                p.setLongDes(rs.getString("LongDescription"));
                p.setAddDes(rs.getString("AdditionalDescription"));
                p.setPrice(rs.getFloat("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSize(rs.getString("Size"));
                p.setColor(rs.getString("Color"));
                p.setCompanyName(rs.getString("CompanyName"));
                p.setCateId(rs.getInt("CategoryId"));
                p.setSubCateId(rs.getInt("SubCategoryId"));
                p.setSold(rs.getInt("Sold"));
                p.setIsCustomized(rs.getBoolean("IsCustomized"));
                p.setIsActive(rs.getBoolean("IsActive"));
                p.setCreateDate(rs.getString("CreateDate"));
                pList.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pList;
    }
    
    public static void main(String[] args) {
        DAOProduct dao= new DAOProduct();
        ArrayList<Product> arr = dao.getProductsByQuery("select * from Product where ProductId =1 ");
        for (Product product : arr) {
            System.out.println(product.getColor());
        }
    }

}
