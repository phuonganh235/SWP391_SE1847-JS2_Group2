<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
        <title>HappyBeauty - Purchase Success</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="ViewUser/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/style.css" type="text/css">
        <link href="ViewUser/css/style-order-successfull.css" rel="stylesheet" type="text/css" />
        <style>
            .success-container {
                text-align: center;
                padding: 50px 0;
                background-color: #f9f9f9;
                border: 1px solid #e0e0e0;
                border-radius: 10px;
                margin-top: 50px;
            }

            .success-container h2 {
                color: #d9534f;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .success-container p {
                font-size: 16px;
                color: #5a5a5a;
            }

            .success-container a.site-btn {
                margin-top: 20px;
                display: inline-block;
                background-color: #5cb85c;
                color: #fff;
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
            }

            .success-container a.site-btn:hover {
                background-color: #4cae4c;
            }

            .products-list {
                margin: 30px 0;
                text-align: left;
            }

            .products-list h3 {
                margin-bottom: 20px;
                color: #d9534f;
                font-weight: bold;
            }

            .products-list ul {
                list-style-type: none;
                padding: 0;
            }

            .products-list ul li {
                background-color: #f1f1f1;
                padding: 10px;
                margin-bottom: 10px;
                border-radius: 5px;
            }

            .footer {
                margin-top: 50px;
            }
        </style>
    </head>

    <body>
        <jsp:include page="navbar.jsp" />

        <!-- Success Message Section Begin -->
        <div class="container success-container">
            <h2>Mua hàng không thành công !!</h2>
            <p>Cảm ơn bạn đã mua hàng của chúng tôi. Nhưng trong quá trình mua hàng đã có sản phẩm được bán hết</p>
            <div class="products-list">
                <h3>Sản phẩm hết hàng:</h3>
                <ul>
                    <c:forEach var="product" items="${listProductHaveQuantityIsZero}">
                        <li>Mã sản phẩm : ${product.productId} - Tên : ${product.productName}</li>
                        </c:forEach>
                </ul>
            </div>
            <a href="/HappyBeautySystem/home" class="site-btn">Quay lại mua hàng</a>
        </div>
        <!-- Success Message Section End -->
        <jsp:include page="footer.jsp"/>
        <!-- Footer Section End -->

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
    </body>

</html>
