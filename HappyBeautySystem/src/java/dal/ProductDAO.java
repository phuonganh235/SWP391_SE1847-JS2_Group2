package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;
import model.Product;
import model.ProductImage;
import model.ProductSize;

public class ProductDAO extends DBContext {

    // Retrieves all products from the Product table in the database
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
                prd.setIsActive(rs.getBoolean("IsActive"));
                prd.setCreateDate(rs.getString("CreateDate"));
                prd.setPathImage(rs.getString("pathImage"));
                pList.add(prd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pList;
    }

    // Retrieves all products are active from the Product table in the database
    public ArrayList<Product> getAllProductActive() {
        ArrayList<Product> pList = new ArrayList<>();
        String sql = "SELECT * FROM Product where IsActive = 1";
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
                prd.setIsActive(rs.getBoolean("IsActive"));
                prd.setCreateDate(rs.getString("CreateDate"));
                prd.setPathImage(rs.getString("pathImage"));
                pList.add(prd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pList;
    }

    // Retrieves a sublist of products from a given list based on the start and end indices
    public ArrayList<Product> getListByPage(ArrayList<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    // Retrieves products by their ID from the Product table
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

    // Retrieves images associated with a product by the product's ID
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

    //    Get Size By productId
    public ArrayList<ProductSize> getSizeByProductId(int pid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<ProductSize> sizeList = new ArrayList<>();
        String sql = "select * from ProductSize where ProductID=" + pid;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("productId");
                String size = rs.getString("size");
                float price = rs.getFloat("price");
                int quantity = rs.getInt("quantity");

                sizeList.add(new ProductSize(id, size, price, quantity));
            }
            return sizeList;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return sizeList;
    }

    // Retrieves a product by its ID from the Product table
    public Product getProductById(int productId) {
        Product product = null;
        String sql = "SELECT * FROM Product WHERE ProductId = ? and isActive = 1";
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

    public ArrayList<Product> getProductByCategory(int category_id) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "Select * from Product p inner join Category c "
                + "on p.CategoryId = c.CategoryId "
                + "WHERE p.CategoryId = ? and p.isActive = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, category_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getFloat(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getBoolean(14), rs.getBoolean(15), rs.getString(16), rs.getString(17)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    Select new Product(8 products just imported 30 days ago)
    public ArrayList<Product> getNewProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 8 *\n"
                + "FROM [dbo].[Product]\n"
                + "WHERE [CreateDate] >= DATEADD(day, -30, GETDATE()) and isActive = 1\n"
                + "ORDER BY [CreateDate] DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getFloat(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getBoolean(14), rs.getBoolean(15), rs.getString(16), rs.getString(17)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    Sellect the best seller products
    public ArrayList<Product> getSellerProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 3 * FROM [dbo].[Product] where isActive = 1\n"
                + "ORDER BY Sold DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getFloat(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getBoolean(14), rs.getBoolean(15), rs.getString(16), rs.getString(17)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    Sellect the Popular products 
    public ArrayList<Product> getPopularProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 3 * FROM [dbo].[Product] where isActive = 1\n"
                + "ORDER BY Quantity DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getFloat(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getBoolean(14), rs.getBoolean(15), rs.getString(16), rs.getString(17)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //    Sellect the best favourite products
    public ArrayList<Product> getFavouriteProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "WITH TopProducts AS (\n"
                + "    SELECT TOP (3) [ProductId], COUNT(DISTINCT [UserId]) AS UserCount\n"
                + "    FROM [Wishlist]\n"
                + "    GROUP BY [ProductId]\n"
                + "    ORDER BY UserCount DESC\n"
                + ")\n"
                + "SELECT * FROM [Product] p\n"
                + "JOIN TopProducts tp ON p.[ProductId] = tp.[ProductId] where p.isActive = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getFloat(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getBoolean(14), rs.getBoolean(15), rs.getString(16), rs.getString(17)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Searches for products by category name
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

    // Searches for products by product name
    public ArrayList<Product> searchProductByName(String text) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE ProductName LIKE ? and isActive = 1";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + text + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getFloat(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getBoolean(14), rs.getBoolean(15), rs.getString(16), rs.getString(17)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//  Search Products by Price
    public ArrayList<Product> searchByPrice(Double from, Double to) {

        ArrayList<Product> list = new ArrayList<>();

        String sql = "SELECT *  FROM Product\n"
                + "WHERE 1=1 and isActive = 1";
        if (from != null) {
            sql += "and price >= '" + from + "'";
        }
        if (to != null) {
            sql += "and price <= '" + to + "'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Product p = new Product(
                        rs.getInt(1), // productId
                        rs.getString(2), // productName
                        rs.getString(3), // shortDes
                        rs.getString(4), // longDes
                        rs.getString(5), // addDes
                        rs.getFloat(6), // price
                        rs.getInt(7), // quantity
                        rs.getString(8), // size
                        rs.getString(9), // color
                        rs.getString(10), // companyName
                        rs.getInt(11), // cateId
                        rs.getInt(12), // subCateId
                        rs.getInt(13), // sold
                        rs.getBoolean(14), // isCustomized
                        rs.getBoolean(15), // isActive
                        rs.getString(16), // createDate
                        rs.getString(17) // pathImage
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        }
        return list;
    }

    // Sort Product from low to hight
    public ArrayList<Product> getProductLow() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "Select *\n"
                + "from Product p inner join Category c on p.CategoryId = c.CategoryId where p.isActive = 1 \n"
                + "ORDER BY p.Price";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getFloat(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getBoolean(14), rs.getBoolean(15), rs.getString(16), rs.getString(17)));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        }
        return list;
    }

    //Sort Product from low to hight
    public ArrayList<Product> getProductHigh() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "Select *\n"
                + "from Product p inner join Category c on p.CategoryId = c.CategoryId where p.isActive = 1\n"
                + "ORDER BY p.Price DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getFloat(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getBoolean(14), rs.getBoolean(15), rs.getString(16), rs.getString(17)));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        }
        return list;
    }
//
//    //Sort Product from A to Z

    public ArrayList<Product> getProductAZ() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select *\n"
                + "from Product p inner join Category c on p.CategoryId = c.CategoryId where p.isActive = 1\n"
                + "ORDER BY p.ProductName";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getFloat(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getBoolean(14), rs.getBoolean(15), rs.getString(16), rs.getString(17)));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        }
        return list;
    }
//
//    //Sort Product from Z to A

    public ArrayList<Product> getProductZA() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select *\n"
                + "from Product p inner join Category c on p.CategoryId = c.CategoryId where p.isActive = 1\n"
                + "ORDER BY p.ProductName DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getFloat(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getBoolean(14), rs.getBoolean(15), rs.getString(16), rs.getString(17)));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        }
        return list;
    }

    // Adds a new product to the Product table in the database
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

    // Updates an existing product in the Product table in the database
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

    // Deletes a product from the Product table in the database by its ID
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

    //Search Product by name in dashboard
    public ArrayList<Product> searchProductByNameToManage(String productName) {
        ArrayList<Product> pList = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE ProductName LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + productName + "%");
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
                prd.setIsActive(rs.getBoolean("IsActive"));
                prd.setCreateDate(rs.getString("CreateDate"));
                prd.setPathImage(rs.getString("pathImage"));
                pList.add(prd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pList;
    }

//    Count total products
    public int countProduct() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count' FROM Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int countReview(int id) {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count'\n"
                + "  FROM [ProductReview] where [ProductId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public void updateProductQuantityTru(int productId, int quantityToUpdate) {
        String sql = "UPDATE Product SET Quantity = Quantity - ? WHERE ProductId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantityToUpdate);
            st.setInt(2, productId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProductQuantityPlus(int productId, int quantityToUpdate) {
        String sql = "UPDATE Product SET Quantity = Quantity + ? WHERE ProductId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantityToUpdate);
            st.setInt(2, productId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //    Count numbers of products low in stock
    public int CountLowStock() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count' FROM Product where Quantity < 50 and Quantity > 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return count;
    }

    //    Get products low in stock
    public ArrayList<Product> getProductLowStock() {
        ArrayList<Product> pList = new ArrayList<>();
        String sql = "SELECT * FROM Product where Quantity < 50 and Quantity > 0";
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
            e.printStackTrace(); // Log the exception
        }
        return pList;
    }

    // Updates the IsActive status of a product in the Product table in the database by its ID
    public void updateProductActiveStatus(int productId, boolean isActive) {
        String sql = "UPDATE Product SET IsActive = ? WHERE ProductId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, isActive);
            st.setInt(2, productId);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getProductQuantity(int productId) {
        int quantity = 0;
        String sql = "SELECT Quantity FROM Product WHERE ProductId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("Quantity");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quantity;
    }
    // Get quantity

    public int getQuantity(int productId) {
        String sql = "SELECT Quantity FROM Product WHERE ProductId = ?";
        int quantity = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("Quantity");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quantity;
    }

//    Test
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
//        dao.getProductQuantity(1);
        System.out.println(dao.getProductQuantity(1));

//        dao.updateProductQuantityTru(1, 3);
        ArrayList<Product> pList = dao.getProductLowStock();
        for (Product product : pList) {
            System.out.println(product);
        }
//        dao.updateProductActiveStatus(10, true);
//        ArrayList<Product> pList = dao.getAllProduct();
//        Product p = dao.getProductById(1);
//        Product pro = dao.getProductById(1);
//        System.out.println(pro.getProductName());
//
//        ArrayList<ProductSize> pList = dao.getSizeByProductId(1);
//        Product cList = dao.getProductById(1);
//        ArrayList<Product> cList = dao.getNewProduct();
//        for (Product product : cList) {
//        System.out.println(cList);
//        }
//        Product p = dao.getProductById(1);
//        System.out.println(pList);
    }

}
