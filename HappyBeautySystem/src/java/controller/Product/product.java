package controller.Product;

import dal.CategoryDAO;
import dal.FeedbackDAO;
import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import model.Category;
import model.Feedback;
import model.Product;
import model.ProductImage;

import model.User;

import model.ProductSize;

public class product extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet product</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet product at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");

        ProductDAO d = new ProductDAO();
        CategoryDAO c = new CategoryDAO();
        FeedbackDAO f = new FeedbackDAO();
        UserDAO u = new UserDAO();

//        request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
        if (action.equals("")) {
            ArrayList<Product> productList = d.getAllProduct();
            ArrayList<Category> categoryList = c.getAllCategories();
//          Pagination
            int page = 0, numperpage = 6;
            int size = productList.size();
            // Number of pages needed for each page with 6 product sections
            int num = (size % 6 == 0 ? (size / 6) : ((size / 6)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            // Index of the first product on the page 
            start = (page - 1) * numperpage;
            // The end index cannot exceed the number of products
            end = Math.min(page * numperpage, size);
            ArrayList<Product> productByPage = d.getListByPage(productList, start, end);
            ArrayList<Product> productNew = d.getNewProduct();
            // Save a list of IDs of new products
            List<Integer> newProductIds = productNew.stream().map(Product::getProductId).collect(Collectors.toList());
            ArrayList<Product> productLowInStock = d.getProductLowStock();
            // Save a list of IDs of low products
            List<Integer> lowProductIds = productLowInStock.stream().map(Product::getProductId).collect(Collectors.toList());
            request.setAttribute("lowInStock", lowProductIds);
            request.setAttribute("top8New", newProductIds);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("productList", productByPage);
            request.setAttribute("categoryList", categoryList);
            request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
        }

        if (action.equalsIgnoreCase("listByCategory")) {
            String category_id = request.getParameter("category_id");
            int category_id1 = Integer.parseInt(category_id);
            ArrayList<Product> productList = d.getProductByCategory(category_id1);
            ArrayList<Category> category = c.getAllCategories();
            int page = 0, numperpage = 6;
            int size = productList.size();
            int num = (size % 6 == 0 ? (size / 6) : ((size / 6)) + 1);//so trang
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);
            ArrayList<Product> product = d.getListByPage(productList, start, end);
            ArrayList<Product> productNew = d.getNewProduct();
            // Save a list of IDs of new products
            List<Integer> newProductIds = productNew.stream().map(Product::getProductId).collect(Collectors.toList());
            ArrayList<Product> productLowInStock = d.getProductLowStock();
            // Save a list of IDs of low products
            List<Integer> lowProductIds = productLowInStock.stream().map(Product::getProductId).collect(Collectors.toList());
            request.setAttribute("lowInStock", lowProductIds);
            request.setAttribute("top8New", newProductIds);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("categoryList", category);
            request.setAttribute("productList", product);
            request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
        }

//        Sort Product
        if (action.equals("sort")) {
            String type = request.getParameter("type");
            ArrayList<Product> productNew = d.getNewProduct();
            // Save a list of IDs of new products
            List<Integer> newProductIds = productNew.stream().map(Product::getProductId).collect(Collectors.toList());
            request.setAttribute("top8New", newProductIds);
            ArrayList<Product> productLowInStock = d.getProductLowStock();
            // Save a list of IDs of low products
            List<Integer> lowProductIds = productLowInStock.stream().map(Product::getProductId).collect(Collectors.toList());
            request.setAttribute("lowInStock", lowProductIds);
            if (type.equals("low")) {
                ArrayList<Product> productList = d.getProductLow();
                ArrayList<Category> category = c.getAllCategories();
//              Pagination
                int page = 0, numperpage = 6;
                int size = productList.size();
                int num = (size % 6 == 0 ? (size / 6) : ((size / 6)) + 1);//so trang
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * numperpage;
                end = Math.min(page * numperpage, size);
                ArrayList<Product> product = d.getListByPage(productList, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("categoryList", category);
                request.setAttribute("productList", product);
                request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
            }

            if (type.equals("high")) {
                ArrayList<Product> productList = d.getProductHigh();
                ArrayList<Category> category = c.getAllCategories();
//              Pagination
                int page = 0, numperpage = 6;
                int size = productList.size();
                int num = (size % 6 == 0 ? (size / 6) : ((size / 6)) + 1);//so trang
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * numperpage;
                end = Math.min(page * numperpage, size);
                ArrayList<Product> product = d.getListByPage(productList, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("categoryList", category);
                request.setAttribute("productList", product);
                request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
            }
            if (type.equals("a-z")) {
                ArrayList<Product> productList = d.getProductAZ();
                ArrayList<Category> category = c.getAllCategories();
                //Pagination
                int page = 0, numperpage = 6;
                int size = productList.size();
                int num = (size % 6 == 0 ? (size / 6) : ((size / 6)) + 1);//so trang
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * numperpage;
                end = Math.min(page * numperpage, size);
                ArrayList<Product> product = d.getListByPage(productList, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("categoryList", category);
                request.setAttribute("productList", product);
                request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
            }
            if (type.equals("z-a")) {
                ArrayList<Product> productList = d.getProductZA();
                ArrayList<Category> category = c.getAllCategories();
                //Pagination
                int page = 0, numperpage = 6;
                int size = productList.size();
                int num = (size % 6 == 0 ? (size / 6) : ((size / 6)) + 1);//so trang
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * numperpage;
                end = Math.min(page * numperpage, size);
                ArrayList<Product> product = d.getListByPage(productList, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("categoryList", category);
                request.setAttribute("productList", product);
                request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
            }
        }

        //View Product detail
        if (action.equalsIgnoreCase("productdetail")) {
            String product_id = request.getParameter("product_id");

            int productId = Integer.parseInt(product_id);
            int product_category = Integer.parseInt(request.getParameter("product_category"));
            CategoryDAO dao = new CategoryDAO();
            //get image of one product
            ArrayList<ProductImage> i = d.getProductImage(productId);

            //Retrieve products by id
            Product product = d.getProductById(productId);

//            Get product size
            ArrayList<ProductSize> sizeList = d.getSizeByProductId(product.getProductId());

//            Get products with the same category: To get common products
            //Get products with the same category: To get common products
            ArrayList<Product> productByCategory = d.getProductByCategory(product_category);

            // To retrieve the product category
            ArrayList<Product> productNew = d.getNewProduct();
            // Save a list of IDs of new products
            List<Integer> newProductIds = productNew.stream().map(Product::getProductId).collect(Collectors.toList());
            request.setAttribute("top8New", newProductIds);
            ArrayList<Product> productLowInStock = d.getProductLowStock();
            // Save a list of IDs of low products
            List<Integer> lowProductIds = productLowInStock.stream().map(Product::getProductId).collect(Collectors.toList());
            request.setAttribute("lowInStock", lowProductIds);
//           To retrieve the product category

            Category cat = dao.getCategoryById(product_category);

            //Feedback by productID
            int countReview = f.countReviewByProductId(productId);

            ArrayList<User> user = u.getUserByProductId(productId);
            ArrayList<User> user2 = u.getUserByProductId2(productId);
//            request.setAttribute("user", user);
            request.setAttribute("user", user2);

            ArrayList<Feedback> feedback = f.getFeedbackByProductId(productId);
            request.setAttribute("feedback", feedback);
            //Get avg rating by productId
            double avgRating = f.getAverageRatingByProductId(productId);
            request.setAttribute("avgRating", avgRating);

            request.setAttribute("Category", cat);
            request.setAttribute("image", getPath(i));
            request.setAttribute("sizeList", sizeList);
//            Show first value of price and size, quantity
            request.setAttribute("price", sizeList.get(0).getPrice());
            request.setAttribute("size", sizeList.get(0).getSize());
            request.setAttribute("quantitySize", sizeList.get(0).getQuantity());
            request.setAttribute("ProductData", product);
            request.setAttribute("countReview", countReview);
            request.setAttribute("ProductCategory", productByCategory);
            request.setAttribute("Category", cat);
            request.getRequestDispatcher("/ViewUser/product-details.jsp").forward(request, response);
        }

    }

    //get Image url
    public ArrayList<String> getPath(ArrayList<ProductImage> list) {
        ArrayList<String> paths = new ArrayList<>();

        for (ProductImage imageProduct : list) {
            String path = imageProduct.getImageUrl();
            // Remove all occurrences of the character "
            path = path.replace("\"", "");
            paths.add(path);
        }

        return paths;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO d = new ProductDAO();
        CategoryDAO c = new CategoryDAO();
        FeedbackDAO f = new FeedbackDAO();
        ArrayList<Product> productNew = d.getNewProduct();
        HttpSession session = request.getSession(true);
        User inforUser = (User) session.getAttribute("inforUserLogin");
        // Save a list of IDs of new products
        List<Integer> newProductIds = productNew.stream().map(Product::getProductId).collect(Collectors.toList());
        request.setAttribute("top8New", newProductIds);
        ArrayList<Product> productLowInStock = d.getProductLowStock();
        // Save a list of IDs of low products
        List<Integer> lowProductIds = productLowInStock.stream().map(Product::getProductId).collect(Collectors.toList());
        request.setAttribute("lowInStock", lowProductIds);
        String service = request.getParameter("service") == null ? "" : request.getParameter("service");
        if (service.equalsIgnoreCase("search")) {
            String text = request.getParameter("text");
            ArrayList<Product> productList = d.searchProductByName(text);
            request.setAttribute("productList", productList);

            ArrayList<Category> category = c.getAllCategories();
            //Pagination
            int page = 0, numperpage = 6;
            int size = productList.size();
            int num = (size % 6 == 0 ? (size / 6) : ((size / 6)) + 1);//number of page
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);
            ArrayList<Product> productByPage = d.getListByPage(productList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("categoryList", category);
            request.setAttribute("productList", productByPage);
            request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
        }

        //Search products by price
        if (service.equalsIgnoreCase("searchPrice")) {
            String fromPrice = request.getParameter("fromPrice");
            String toPrice = request.getParameter("toPrice");
            ArrayList<Category> category = c.getAllCategories();

            Double from, to;
            try {
                from = (fromPrice == null || fromPrice.equals("")) ? null : Double.parseDouble(fromPrice);
                to = (toPrice == null || toPrice.equals("")) ? null : Double.parseDouble(toPrice);
                ArrayList<Product> listP = d.searchByPrice(from, to);
                //            Pagination
                int page = 0, numperpage = 6;
                int size = listP.size();
                int num = (size % 6 == 0 ? (size / 6) : ((size / 6)) + 1);//number of page
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * numperpage;
                end = Math.min(page * numperpage, size);
                ArrayList<Product> productByPage = d.getListByPage(listP, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("categoryList", category);
                request.setAttribute("productList", productByPage);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/ViewUser/shop.jsp").forward(request, response);
        }

        if (inforUser == null) {
            response.sendRedirect("login");
        } else {
            if (service.equals("addfeedback")) {
                int productId = Integer.parseInt(request.getParameter("product_id"));
                int user_id = Integer.parseInt(request.getParameter("user_id"));
                int rating = Integer.parseInt(request.getParameter("rating"));
                String comment = request.getParameter("comment");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String createDate = sdf.format(new Date());
                f.addFeedback(new Feedback(productId, user_id, rating, comment, createDate));
                response.sendRedirect("product");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
