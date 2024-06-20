<%@page import="model.User"%>
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
    </head>

    <body>

        <!-- Header Section Begin -->
        <jsp:include page="navbar.jsp"/>
        <c:if test="${requestScope.errorOldpass != null}">
            <script>
                $(document).ready(function () {
                    $('#ChangePasswordModal').modal('show');
                    $('#oldPasswordError').text('${requestScope.errorOldpass}');
                });
            </script>
        </c:if>

        <!-- Categories Section Begin -->
        <section class="categories">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 p-0">
                        <div class="categories__item categories__large__item set-bg"
                             data-setbg="ViewUser/img/shop/banner-5.jpg">
                            <div class="categories__text">
                                <h1>HappyBeauty</h1>
                                <p style="color: black">Welcome to HappyBeauty, the ideal destination for beauty care products specifically for women
                                    - where your care and beauty are our top priorities!</p>
                                <a href="product">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 p-0">
                        <!--<div class="row">-->
                        <!--<div class="col-lg-6 col-md-6 col-sm-6 p-0">-->
                        <div class="categories__item set-bg" data-setbg="ViewUser/img/shop/banner-3.jpg">
                            <div class="categories__text">
                                <h4>Women’s skincare</h4>
                                <p>"Empower Your Glow: Discover the Best in Women's Skincare"</p>
                                <a href="product">Shop now</a>
                            </div>
                        </div>
                        <div class="categories__item set-bg" data-setbg="ViewUser/img/shop/banner-7.jpg">
                            <div class="categories__text">
                                <h4>Women’s makeup</h4>
                                <p>"Unleash Your Beauty: Elevate Your Look with Our Makeup"</p>
                                <a href="product">Shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Categories Section End -->

        <!-- Product Section Begin -->
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4">
                        <div class="section-title">
                            <h4>New products</h4>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-8">
                        <ul class="filter__controls">
                            <li class="active" data-filter="*"><a href="/HappyBeautySystem/product">View more product here</a></li>
                        </ul>
                    </div>
                </div>

                <div class="row property__gallery">
                    <!-- Product New  -->
                    <c:forEach items="${requestScope.top8New}" var="p">
                        <div class="col-lg-3 col-md-4 col-sm-6 mix women" style="">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="">
                                    <div class="label new" style="border-radius: 10px;">New</div>
                                    <a href="product?action=productdetail&product_id=${p.getProductId()}&product_category=${p.getCateId()}">
                                        <img src="${p.getPathImage()}" style = "border-radius: 20px; height: 100%; width: 100%" alt="image product"><span class="arrow_expand">

                                        </span>
                                    </a>
                                    <!--  // ToanLV code-->
                                    <ul class="product__hover">
                                        <li></li>
                                        <!--Add Product to WishList-->
                                        <li><a href="wishlist?service=addWishList&id=${p.getProductId()}">
                                                <span class="icon_heart_alt"></span>
                                            </a>
                                        </li>
                                        <!--Add Product to Cart-->
                                        <li>
                                            <a href="/HappyBeautySystem/AddToCart?service=addToCart&id=${p.getProductId()}">
                                                <span class="icon_bag_alt"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    <!--                                                //-->
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="product?action=productdetail&product_id=${p.getProductId()}&product_category=${p.getCateId()}">${p.getProductName()}</a></h6>
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product__price">Price: $${p.getPrice()}</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- Đến đây -->
                </div>
            </div>
        </section>
        <!-- Product Section End -->

        <!-- Banner Section Begin -->
        <section class="banner set-bg" data-setbg="ViewUser/img/banner/banner-5.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-7 col-lg-8 m-auto">
                        <div class="banner__slider owl-carousel">
                            <div class="banner__item">
                                <div class="banner__text">
                                    <span>The Skincare Collection</span>
                                    <h1>Discover Radiant Skin</h1>
                                    <a href="product">Shop now</a>
                                </div>
                            </div>
                            <div class="banner__item">
                                <div class="banner__text">
                                    <span>The Makeup Collection</span>
                                    <h1>Makeup Magic Starts Here</h1>
                                    <a href="product">Shop now</a>
                                </div>
                            </div>
                            <div class="banner__item">
                                <div class="banner__text">
                                    <span>The Bath&Body Collection</span>
                                    <h1>Unwind with Our Bath & Body Collection</h1>
                                    <a href="product">Shop now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Banner Section End -->

        <!-- Trend Section Begin -->
        <section class="trend spad">
            <div class="container">
                <div class="row" style="
                     justify-content: center;
                     text-align: center;">
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="trend__content">
                            <div class="section-title">
                                <h4>Popular Product</h4>
                            </div>
                            <c:forEach items="${requestScope.topPopular}" var="p">
                                <div class="trend__item">
                                    <div class="trend__item__pic">
                                        <a href="product?action=productdetail&product_id=${p.getProductId()}&product_category=${p.getCateId()}">
                                            <img style="
                                                 height: 90px;
                                                 width: 90px;
                                                 " src="${p.getPathImage()}" alt="">
                                        </a>
                                    </div>
                                    <div class="trend__item__text">
                                        <a href="product?action=productdetail&product_id=${p.getProductId()}&product_category=${p.getCateId()}">
                                            <h6>${p.getProductName()}</h6>
                                        </a>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$${p.getPrice()}</div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!--Top Best Seller Product-->
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="trend__content">
                            <div class="section-title">
                                <h4>Best Seller</h4>
                            </div>
                            <c:forEach items="${requestScope.topSeller}" var="p">
                                <div class="trend__item">
                                    <div class="trend__item__pic">
                                        <a href="product?action=productdetail&product_id=${p.getProductId()}&product_category=${p.getCateId()}">
                                            <img style="
                                                 height: 90px;
                                                 width: 90px;
                                                 " src="${p.getPathImage()}" alt="">
                                        </a>
                                    </div>
                                    <div class="trend__item__text">
                                        <a href="product?action=productdetail&product_id=${p.getProductId()}&product_category=${p.getCateId()}">
                                            <h6>${p.getProductName()}</h6>
                                        </a>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$${p.getPrice()}</div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <!--                    <div class="col-lg-4 col-md-4 col-sm-6">
                                            <div class="trend__content">
                                                <div class="section-title">
                                                    <h4>Feature 2</h4>
                                                </div>
                    <%--<c:forEach items="${requestScope.topSeller}" var="p">--%>
                        <div class="trend__item">
                            <div class="trend__item__pic">
                                <img style="
                                     height: 90px;
                                     width: 90px;
                                     " src="${p.getPathImage()}" alt="">
                            </div>
                            <div class="trend__item__text">
                                <h6>${p.getProductName()}</h6>
                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div class="product__price">$${p.getPrice()}</div>
                            </div>
                        </div>
                    <%--</c:forEach>--%>
                </div>
            </div>-->
                </div>
            </div>
        </section>
        <!-- Trend Section End -->

        <!-- Services Section Begin -->
        <section class="services spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-car"></i>
                            <h6>Free Shipping</h6>
                            <p>For all oder over $99</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-money"></i>
                            <h6>Money Back Guarantee</h6>
                            <p>If good have Problems</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-support"></i>
                            <h6>Online Support 24/7</h6>
                            <p>Dedicated support</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-headphones"></i>
                            <h6>Payment Secure</h6>
                            <p>100% secure payment</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services Section End -->

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
    </body>

</html>
