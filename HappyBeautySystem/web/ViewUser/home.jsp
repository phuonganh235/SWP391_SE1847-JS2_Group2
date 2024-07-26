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
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&family=Lobster&family=Sacramento&display=swap" rel="stylesheet">

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
                                <p style="color: black">Chào mừng bạn đến với HappyBeauty, điểm đến lý tưởng về các sản phẩm chăm sóc sắc đẹp dành riêng cho phụ nữ 
                                    - nơi việc chăm sóc và làm đẹp của bạn là ưu tiên hàng đầu của chúng tôi!</p>
                                <a href="product">Mua sắm ngay</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 p-0">
                        <!--<div class="row">-->
                        <!--<div class="col-lg-6 col-md-6 col-sm-6 p-0">-->
                        <div class="categories__item set-bg" data-setbg="ViewUser/img/shop/banner-3.jpg">
                            <div class="categories__text">
                                <h4 style="font-family: 'Dancing Script', cursive; font-size: 40px">Chăm sóc cho làn da tươi trẻ</h4>
                                <p>"Trao quyền cho sự tỏa sáng của bạn: </p>
                                <p> Khám phá những điều tốt nhất trong chăm sóc da của phụ nữ"</p>
                                <a href="product">Mua sắm ngay</a>
                            </div>
                        </div>
                        <div class="categories__item set-bg" data-setbg="ViewUser/img/shop/banner-7.jpg">
                            <div class="categories__text">
                                <h4 style="font-family: 'Dancing Script', cursive; font-size: 40px">Hoàn thiện vẻ đẹp của bạn</h4>
                                <p>"Giải phóng vẻ đẹp của bạn: </p>
                                <p> Nâng tầm vẻ ngoài của bạn với cách trang điểm của chúng tôi"</p>
                                <a href="product">Mua sắm ngay</a>
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
                            <h4>Sản phẩm mới</h4>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-8">
                        <ul class="filter__controls">
                            <li class="active" data-filter="*"><a href="/HappyBeautySystem/product">Xem thêm sản phẩm tại đây</a></li>
                        </ul>
                    </div>
                </div>

                <div class="row property__gallery">
                    <!-- Product New  -->
                    <c:forEach items="${requestScope.top8New}" var="p">
                            <div class="col-lg-3 col-md-4 col-sm-6 mix women" style="">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="">
                                        <div class="label new" style="border-radius: 10px;">Mới</div>
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
                                                    <span class="icon_cart"></span>
                                                </a>
                                            </li>
                                        </ul>
                                        <!--                                                //-->
                                    </div>
                                    <div class="product__item__text">
                                        <a href="product?action=productdetail&product_id=${p.getProductId()}&product_category=${p.getCateId()}">
                                            <h6 style="color: black; font-size: 18px; font-weight: 500;">${p.getProductName()}</h6>
                                        </a>
                                        <h6 style="color: #6d6dff; font-size: 22px; font-weight: 500;">${p.getCompanyName()}</h6>

                                        <div id="field-price-${p.getProductId()}" class="product__price" style="color: #ea5d8c;"></div>
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
                                                let priceNew = ${p.getPrice()};

                                                // Format the price and display it in the specified HTML element
                                                document.getElementById('field-price-${p.getProductId()}').innerHTML = format(priceNew);
                                            })();
                                        </script>
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
                                    <span>Bộ sưu tập sản phẩm chăm sóc da</span>
                                    <h1 style="font-family: 'Dancing Script', cursive;">Khám phá làn da tươi trẻ</h1>
                                    <a href="product">Mua sắm ngay</a>
                                </div>
                            </div>
                            <div class="banner__item">
                                <div class="banner__text">
                                    <span>Bộ sưu tập sản phẩm trang điểm</span>
                                    <h1 style="font-family: 'Dancing Script', cursive;">Nơi sự diệu kì của trang điểm bắt đầu</h1>
                                    <a href="product">Mua sắm ngay</a>
                                </div>
                            </div>
                            <div class="banner__item">
                                <div class="banner__text">
                                    <span>Bộ sưu tập chắm sóc cơ thể</span>
                                    <h1 style="font-family: 'Dancing Script', cursive;">Mang tới làn da mềm mịn và quyến rũ.</h1>
                                    <a href="product">Mua sắm ngay</a>
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

                    <div class="col-lg-3 col-md-3 col-sm-4" style="margin-right: 100px">
                        <div class="trend__content">
                            <div class="section-title">
                                <h4>Đề xuất</h4>
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
                                            <h6 style="color: black; font-size: 16px; font-weight: 500;">${p.getProductName()}</h6>
                                        </a>
                                        <h6 style="color: #6d6dff; font-size: 15px; font-weight: 500;">${p.getCompanyName()}</h6>

                                        <div id="price-${p.getProductId()}" class="product__price" style="color: #ea5d8c; font-size: 13px;"></div>
                                        <script>
                                            (function () {
                                                // Function to format the price
                                                function Priceformat(price) {
                                                    // Convert the price to a string with a fixed number of decimal places (0 in this case)
                                                    let priceString = parseFloat(price).toFixed(0);

                                                    // Use a regular expression to insert dots at the thousand places
                                                    priceString = priceString.replace(/\B(?=(\d{3})+(?!\d))/g, ".");

                                                    // Return the formatted price with ' VNĐ' appended
                                                    return priceString + ' VNĐ';
                                                }

                                                // Use JSP to get the price from the server-side
                                                let price = ${p.getPrice()};

                                                // Format the price and display it in the specified HTML element
                                                document.getElementById('price-${p.getProductId()}').innerHTML = Priceformat(price);
                                            })();
                                        </script>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!--Top Best Seller Product-->
                    <div class="col-lg-3 col-md-3 col-sm-4">
                        <div class="trend__content">
                            <div class="section-title">
                                <h4>Bán chạy</h4>
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
                                            <h6 style="color: black; font-size: 16px; font-weight: 500;">${p.getProductName()}</h6>
                                        </a>
                                        <h6 style="color: #6d6dff; font-size: 15px; font-weight: 500;">${p.getCompanyName()}</h6>

                                        <div id="sellerprice-${p.getProductId()}" class="product__price" style="color: #ea5d8c; font-size: 13px;"></div>
                                        <script>
                                            (function () {
                                                // Function to format the price
                                                function PriceSellerformat(price) {
                                                    // Convert the price to a string with a fixed number of decimal places (0 in this case)
                                                    let priceString = parseFloat(price).toFixed(0);

                                                    // Use a regular expression to insert dots at the thousand places
                                                    priceString = priceString.replace(/\B(?=(\d{3})+(?!\d))/g, ".");

                                                    // Return the formatted price with ' VNĐ' appended
                                                    return priceString + ' VNĐ';
                                                }

                                                // Use JSP to get the price from the server-side
                                                let priceSeller = ${p.getPrice()};

                                                // Format the price and display it in the specified HTML element
                                                document.getElementById('sellerprice-${p.getProductId()}').innerHTML = PriceSellerformat(priceSeller);
                                            })();
                                        </script>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <!--Top favourite Product-->
                    <div class="col-lg-3 col-md-3 col-sm-4" style="margin-left: 100px">
                        <div class="trend__content">
                            <div class="section-title">
                                <h4>Được yêu thích</h4>
                            </div>
                            <c:forEach items="${requestScope.topFavourite}" var="p">
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
                                            <h6 style="color: black; font-size: 16px; font-weight: 500;">${p.getProductName()}</h6>
                                        </a>
                                        <h6 style="color: #6d6dff; font-size: 15px; font-weight: 500;">${p.getCompanyName()}</h6>

                                        <div id="likeprice-${p.getProductId()}" class="product__price" style="color: #ea5d8c; font-size: 13px;"></div>
                                        <script>
                                            (function () {
                                                // Function to format the price
                                                function likePrice(price) {
                                                    // Convert the price to a string with a fixed number of decimal places (0 in this case)
                                                    let priceString = parseFloat(price).toFixed(0);

                                                    // Use a regular expression to insert dots at the thousand places
                                                    priceString = priceString.replace(/\B(?=(\d{3})+(?!\d))/g, ".");

                                                    // Return the formatted price with ' VNĐ' appended
                                                    return priceString + ' VNĐ';
                                                }

                                                // Use JSP to get the price from the server-side
                                                let likeprice = ${p.getPrice()};

                                                // Format the price and display it in the specified HTML element
                                                document.getElementById('likeprice-${p.getProductId()}').innerHTML = likePrice(likeprice);
                                            })();
                                        </script>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
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
                            <h6>Miễn phí giao hàng</h6>
                            <p>Cho tất cả đơn hàng</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-money"></i>
                            <h6>Đảm bảo hoàn lại tiền</h6>
                            <p>Nếu sản phẩm gặp vấn đề</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-support"></i>
                            <h6>Chăm sóc trực tuyến 24/7</h6>
                            <p>Hỗ trợ nhiệt tình</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-headphones"></i>
                            <h6>Thanh toán an toàn</h6>
                            <p>100% thanh toán an toàn</p>
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

    <!--Chatbot-->
    <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger
        intent="WELCOME"
        chat-title="HappyBeautySystem"
        agent-id="cc8fd10b-488f-4ebb-a442-953e6ecafe27"
        language-code="vi"
        ></df-messenger>
</html>
