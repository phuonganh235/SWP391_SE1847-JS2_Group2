<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.WishList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>HappyBeauty</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="ViewUser/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/style.css" type="text/css">
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px;
                text-align: left;
            }
            tr:hover {
                background-color: #ffe2ff;
            }
        </style>
    </head>

    <body>
        <!-- Header Section Begin -->
        <jsp:include page="navbar.jsp" />
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="./home"><i class="fa fa-home"></i> Trang chủ</a>
                            <span>Danh sách sản phẩm yêu thích của bạn</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->
        <!-- Shop Cart Section Begin -->
        <section class="shop-cart spad">
            <div class="container">
                <div class="row" style="text-align: center;">
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="cart__btn">
                            <a href="product">Mua sắm</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">

                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="cart__btn">
                            <a href="wishlist?service=deleteAllWishList">Xóa tất cả</a>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="col-lg-12">
                        <div class="shop__cart__table">
                            <table>
                                <tbody>
                                    <%
                                        List<WishList> list = (List<WishList>) request.getAttribute("wishList");
                                        if (list != null && !list.isEmpty()) {
                                            ProductDAO daoProduct = new ProductDAO();
                                            for (WishList wish : list) {
                                                Product pro = daoProduct.getProductById(wish.getProductId());
                                    %>
                                    <tr>
                                        <!--Add wishlist to Cart-->
                                        <!--<td><input type="checkbox" class="product-checkbox" data-product-id="<%= pro.getProductId()%>"></td>-->
                                        <td class="cart__product__item">
                                            <a
                                                href="product?action=productdetail&product_id=<%= pro.getProductId()%>&product_category=<%= pro.getCateId()%>">
                                                <img style = "border: 4px solid #fddfdf; border-radius: 40px; height: 185px; width: 150px; margin-left :50px"
                                                     src="<%= pro.getPathImage()%>" alt=""></a>
                                            <div class="cart__product__item__title" style="margin-top: 38px; margin-left: 300px">
                                                <h6><a
                                                        href="product?action=productdetail&product_id=<%= pro.getProductId()%>&product_category=<%= pro.getCateId()%>"><%= pro.getProductName()%> <%= pro.getCompanyName()%></a>
                                                </h6>
                                                <div id="field-price-<%= pro.getProductId()%>" class="cart__price"></div>
                                                <script>
                                                    (function () {
                                                        // Function to format the price
                                                        function format(price) {
                                                            // Convert the price to a string with a fixed number of decimal places (0 in this case)
                                                            let priceString = parseFloat(price).toFixed(0);

                                                            // Use a regular expression to insert dots at the thousand places
                                                            priceString = priceString.replace(/\B(?=(\d{3})+(?!\d))/g, ".");

                                                            // Return the formatted price with ' VNĐ' appended
                                                            return priceString + ' VNĐ';
                                                        }

                                                        // Use JSP to get the price from the server-side
                                                        let priceNew = <%= pro.getPrice()%>;

                                                        // Format the price and display it in the specified HTML element
                                                        document.getElementById('field-price-<%= pro.getProductId()%>').innerHTML = format(priceNew);
                                                    })();
                                                </script>
                                            </div>
                                        </td>
                                        <td class="cart__product__item__title">
                                            <div class="product__details__button">
                                                <a href="product?action=productdetail&product_id=<%= pro.getProductId()%>&product_category=<%= pro.getCateId()%>"
                                                   class="cart-btn" 
                                                   style="margin-top: 40px; background-color: #84abfa; height: 50px; width: 200px;
                                                   border: 4px; border-radius: 40px;
                                                   box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.2);
                                                   text-align: center"><span class="icon_bag_alt"></span> Xem chi tiết</a>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="product__details__button">
                                                <a href="wishlist?service=deleteWishList&productId=<%= wish.getProductId()%>&userId=<%= wish.getUserId()%>" class="cart-btn" 
                                                   style="margin-top: 40px; background-color: #f94874; height: 50px; width: 200px;
                                                   border: 4px; border-radius: 40px;
                                                   box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.2);
                                                   text-align: center"><span class="icon_trash"></span> Bỏ yêu thích</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    } else {
                                    %>
                                    <tr>
                                        <td colspan="5" class="text-center">Danh sách yêu thích của bạn trống!</td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


        </section>
        <!-- Shop Cart Section End -->

        <!--footer area start-->
        <jsp:include page="footer.jsp"/>
        <!--footer area end-->

        <!-- Js Plugins -->
        <script src="ViewUser/js/jquery-3.3.1.min.js"></script>
        <script src="ViewUser/js/bootstrap.min.js"></script>
        <script src="ViewUser/js/jquery.magnific-popup.min.js"></script>
        <script src="ViewUser/js/jquery-ui.min.js"></script>
        <script src="ViewUser/js/mixitup.min.js"></script>
        <script src="ViewUser/js/jquery.countdown.min.js"></script>
        <script src="ViewUser/js/jquery.slicknav.js"></script>
        <script src="ViewUser/js/owl.carousel.min.js"></script>
        <script src="ViewUser/js/jquery.nicescroll.min.js"></script>
        <script src="ViewUser/js/main.js"></script>
        <script>
                                        // Định nghĩa mảng để lưu trữ các id sản phẩm được chọn
                                        let listProcductIdChoose = [];

                                        function confirm(btn) {
                                            // Lấy danh sách các checkbox được chọn
                                            var checkboxes = document.querySelectorAll('.product-checkbox:checked');
                                            listProcductIdChoose = [];

                                            checkboxes.forEach(function (checkbox) {
                                                // Lấy id sản phẩm từ data-attribute của checkbox
                                                var productId = checkbox.getAttribute('data-product-id');
                                                listProcductIdChoose.push(productId); // Thêm id vào mảng listProcductIdChoose
                                            });

                                            if (listProcductIdChoose.length > 0) {
                                                let link = "AddToCart?service=showCart";
                                                let params = new URLSearchParams();

                                                // Thêm các id sản phẩm đã chọn vào params
                                                for (let i = 0; i < listProcductIdChoose.length; i++) {
                                                    params.append('id', listProcductIdChoose[i]);
                                                }

                                                // Tạo URL với các tham số đã được thêm vào
                                                link += '&' + params.toString();

                                                // Chuyển hướng đến servlet với URL đã xây dựng
                                                window.location.href = link;
                                            }
                                        }
        </script>

    </body>

</html>
