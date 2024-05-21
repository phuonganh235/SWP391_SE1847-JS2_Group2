

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
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style>
            .logo-pic{
                margin-left: 150px;
                width: 40%;
            }
        </style>
    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="offcanvas-menu-wrapper">
            <div class="offcanvas__close">+</div>
            <ul class="offcanvas__widget">
                <li><span class="icon_search search-switch"></span></li>
                <li><a href="#"><span class="icon_heart_alt"></span>
                        <div class="tip">2</div>
                    </a></li>
                <li><a href="#"><span class="icon_bag_alt"></span>
                        <div class="tip">2</div>
                    </a></li>
            </ul>
            <div class="offcanvas__logo">
                <a href="home.jsp"><img src="img/authen/logo.png" alt=""></a>
            </div>
            <div id="mobile-menu-wrap"></div>
            <div class="offcanvas__auth">
                <a href="login?service=null">Login</a>
                <a href="register">Register</a>
            </div>
        </div>
        <!-- Offcanvas Menu End -->
        <header class="header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-3 col-lg-2">
                        <div class="header__logo">
                            <a href="home.jsp"><img src="img/authen/logo.png" alt="" class="logo-pic"></a>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-7">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="home.jsp">Home</a></li>

                                <li><a href="shop.jsp">Shop</a>
                                    <ul class="dropdown">
                                        <li><a href="">Bodycare</a></li>
                                        <li><a href="">Skincare</a></li>
                                        <li><a href="">Haircare</a></li>
                                        <li><a href="">Makeup</a></li>
                                        <li><a href="">Perfume</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="product-details.jsp">Product Details</a></li>
                                        <li><a href="shop-cart.jsp">Shop Cart</a></li>
                                        <li><a href="checkout.jsp">Checkout</a></li>
                                        <li><a href="blog-details.jsp">Blog Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="blog.jsp">Blog</a></li>
                                <li><a href="contact.jsp">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                        <div class="header__right">
                            <div class="header__right__auth">
                                <a href="login?service=null">Login</a>
                                <a href="register?service=null">Register</a>
                            </div>
                            <ul class="header__right__widget">
                                <li><span class="icon_search search-switch"></span></li>
                                <li><a href="#"><span class="icon_heart_alt"></span>
                                        <div class="tip">2</div>
                                    </a></li>
                                    <%
                                        double granTotal = 0; // Khởi tạo biến granTotal
                                        int count = 0;
                                        java.util.Enumeration em = session.getAttributeNames();
                                        while (em.hasMoreElements()) {
                                            count++;
                                            String key = em.nextElement().toString();
                                            if (key.startsWith("cart_")) {
                                                ProductCart pro = (ProductCart) session.getAttribute(key);
                                                double subtotal = pro.getQuantity() * pro.getPrice();
                                                granTotal += subtotal; // Cộng dồn vào granTotal
                                    %>
                                    <%
                                            }
                                        }
                                    %>
                                <li>
                                    <a href="/HappyBeautySystem/ViewUser/shop-cart.jsp"><span class="icon_bag_alt"></span>
                                        <div class="tip"><%= count%></div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="canvas__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
    </body>
</html>
