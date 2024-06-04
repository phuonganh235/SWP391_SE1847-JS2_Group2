<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.ProductCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>HappyBeauty</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/84a8258e0d.js" crossorigin="anonymous"></script>

        <!-- Css Styles -->
        <link rel="stylesheet" href="ViewUser/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/style.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/styleHome.css" type="text/css">
    </head>
    <body>
        <!-- Page Preloder -->
       

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__container">
                <div class="header__logo">
                    <a href="./home"><img src="ViewUser/img/image_av.jpg" alt="Logo"></a>
                </div>
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="home">Home</a></li>
                        <li><a href="./shop.html">About</a></li>
                        <li><a href="#">Shop</a>
                            <ul class="dropdown">
                                <li><a href="./product-details.html">Bodycare</a></li>
                                <li><a href="./shop-cart.html">Skincare</a></li>
                                <li><a href="./checkout.html">Haircare</a></li>
                                <li><a href="./blog-details.html">Makerup</a></li>
                                <li><a href="./blog-details.html">Perfume</a></li>
                            </ul>
                        </li>
                        <li><a href="./blog.html">Blog</a></li>
                        <li><a href="./contact.html">Contact</a></li>
                    </ul>
                </nav>
                <div class="header__right">
                    <c:if test="${sessionScope.inforUserLogin == null}">
                        <div class="header__right__auth">
                            <a href="login">Login</a>
                            <a href="register">Register</a>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.inforUserLogin != null}">
                        <nav class="header__menu">
                            <ul>
                                <li><a href="#">${sessionScope.inforUserLogin.getName()}</a>
                                    <ul class="dropdown">
                                        <li><a href="customerprofile?service=ViewProfile">View Profile</a></li>
                                        <li><a href="customerprofile?service=editprofile">Edit Profile</a></li>
                                        <li><a href="logout">Logout</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                    <ul class="header__right__widget">
                        <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                        <li><a href="AddToCart?service=showCart"><span class="fa fa-shopping-cart"></span></a></li>
                        <li><a href="/HappyBeautySystem/ManagerOrder?service=managerOrder&option=0"><i class="fa fa-bars"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="canvas__open">
                <i class="fa fa-bars"></i>
            </div>
        </header>
    </body>
</html>
