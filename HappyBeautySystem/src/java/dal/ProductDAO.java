package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;
import model.Product;
import model.ProductImage;

public class ProductDAO extends DBContext {
//  Lấy tất cả sp
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
                prd.setPathImage(rs.getString("pathImage"));
                pList.add(prd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pList;
    }
    
//  Lấy danh sách sp trên 1 trang từ start tới end
    public ArrayList<Product> getListByPage(ArrayList<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    } 
    
//  Lấy tất cả sp theo productId
    public ArrayList<Product> getProduct(int id) {
        ArrayList<Product> pList = new ArrayList<>();
        String sql = "SELECT * FROM Product where productId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
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
                prd.setPathImage(rs.getString("pathImage"));
                pList.add(prd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pList;
    }

//  Lấy chi tiết hình ảnh sản phẩm
    public ArrayList<ProductImage> getProductImage(int productId) {
        ArrayList<ProductImage> pimList = new ArrayList<>();
        String sql = "SELECT [ImageId]\n"
                + "      ,[ImageUrl]\n"
                + "      ,[ProductId]\n"
                + "      ,[DefaultImage]\n"
                + "  FROM [ProductImages]\n "
                + "where ProductId = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductImage pim = new ProductImage();
                pim.setImageId(rs.getInt("imageId"));
                pim.setImageUrl(rs.getString("imageUrl"));
                pim.setProductId(rs.getInt("productId"));
                pim.setDefaultImage(rs.getBoolean("defaultImage"));
                pimList.add(pim);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pimList;
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
                product.setPathImage(rs.getString("pathImage"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

//  Tìm kiếm sp theo Category
    public ArrayList<Product> searchProductByCategory(String text) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT DISTINCT c.[CategoryName], p.[ProductId], p.[ProductName], \n"
                + "  p.[ShortDescription], p.[Price], p.[pathImage]\n"
                + "  FROM [Product] p left join [Category] c on c.CategoryId = p.CategoryId\n"
                + "  where c.[CategoryName] like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + text + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getInt(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
//  Tìm kiếm sp theo tên sp
    public ArrayList<Product> searchProductByName(String text) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT DISTINCT c.[CategoryName], p.[ProductId], p.[ProductName], \n"
                + "  p.[ShortDescription], p.[Price], p.[pathImage]\n"
                + "  FROM [Product] p left join [Category] c on c.CategoryId = p.CategoryId\n"
                + "  where p.[ProductName] like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + text + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getInt(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//  Thêm sản phẩm
    public void addProduct(Product product) {
        String sql = "INSERT INTO Product (ProductName, ShortDescription, LongDescription, AdditionalDescription, Price, Quantity, Size, Color, CompanyName, CategoryId, SubCategoryId, Sold, IsCustomized, IsActive, CreateDate, pathImage) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
            st.setString(16, product.getPathImage());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    Cập nhật sp
    public void updateProduct(Product product) {
        String sql = "UPDATE Product SET ProductName = ?, ShortDescription = ?, LongDescription = ?, AdditionalDescription = ?, Price = ?, Quantity = ?, Size = ?, Color = ?, CompanyName = ?, CategoryId = ?, SubCategoryId = ?, Sold = ?, IsCustomized = ?, IsActive = ?, CreateDate = ?, PathImage = ?  WHERE ProductId = ?";
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
            st.setString(16, product.getPathImage());
            st.setInt(17, product.getProductId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    Xóa sp khỏi db
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

//    Test
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        ArrayList<Product> pList = dao.getAllProduct();
        Product p = dao.getProductById(1);
        System.out.println(pList);
    }
}
