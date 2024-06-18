<%@page import="model.Product"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >

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
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="./home"><i class="fa fa-home"></i> Home</a>
                            <a href="/HappyBeautySystem/product">Product </a>
                            <span>${Category.categoryName} </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Product Details Section Begin -->
        <section class="product-details spad">
            <div class="container">
                <div class="row">
                    <!--Hiển thị chi tiết ảnh sp-->
                    <div class="col-lg-6">
                        <div class="product__details__pic">
                            <div class="product__details__pic__left product__thumb nice-scroll">
                                <c:forEach items="${image}" var="i">
                                    <a class="pt" href="${i}">
                                        <img style = "border-radius: 40px; height: 180px; width: 150px;" alt="image product" src="${i}" alt="">
                                    </a>
                                </c:forEach>
                            </div>
                            <div class="product__details__slider__content">
                                <div class="product__details__pic__slider owl-carousel">
                                    <img data-hash="product-1" class="product__big__img" style = "border-radius: 40px; height: 570px; width: 380px;" alt="image product" src="${ProductData.getPathImage()}" alt="">
                                    <c:forEach items="${image}" var="i">
                                        <img data-hash="product-1" class="product__big__img" style = "border-radius: 40px; height: 570px; width: 380px;" alt="image product" src="${i}" alt="">
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--                    <div class="col-lg-6">
                                            <div class="product__details__pic">
                                                <img src="${ProductData.getPathImage()}" style = "border-radius: 40px; height: 570px; width: 380px;" alt="image product">
                                            </div>
                                        </div>-->

                    <div class="col-lg-6">
                        <div class="product__details__text">
                            <h3>Name: ${ProductData.getProductName()}<span>Description: ${ProductData.getShortDes()}</span></h3>
                            <h4 style="color: #008ce6; font-weight: bold">Brand: ${ProductData.getCompanyName()}</h4>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <span>( Reviews: ${countReview} )</span>
                            </div>
                            <div class="product__details__price">Price: $${ProductData.getPrice()}</div>
                            <div class="">Category: ${requestScope.Category.categoryName}</div>
                            <p>${ProductData.getLongDes()}</p>
                            <div class="product__details__button">
                                <div class="quantity">
                                    <span>Quantity: ${ProductData.getQuantity()}</span>
                                    <script>
                                        document.addEventListener("DOMContentLoaded", function () {
                                            document.getElementById("quantity").oninput = function () {
                                                var quantity = this.value;
                                                if (quantity === "") {
                                                    document.getElementById("textError").innerHTML = "Please enter number!";
                                                } else if (parseInt(quantity) < 1) { // check number < 1
                                                    document.getElementById("textError").innerHTML = "Quantity must be greater than 0";
                                                } else if (parseInt(quantity) > ${ProductData.getQuantity()}) { // check number < 1
                                                    document.getElementById("textError").innerHTML = "Quantity must be less than or equal to ${ProductData.getQuantity()}";
                                                } else {
                                                    document.getElementById("textError").innerHTML = "";
                                                }
                                            };
                                        });
                                    </script>
                                    <!--<div class="pro-qty">-->
                                    <!--<div>-->
                                    <input style ="border: 2px solid #fddfdf;
                                           border-radius: 40px;
                                           width: 120px;
                                           height: 50px;
                                           text-align: center;
                                           background-color: #fddfdf;
                                           box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.2);" 
                                           min = "1" max = ${ProductData.getQuantity()} id="quantity" name="quantity" type="number" class="form-control" placeholder="1" value="${param.quantity}">
                                    <!--</div>-->
                                    <div style="display: block; text-align: center;">
                                        <span id="textError" style="color: red; font-size: 12px; font-weight: 500;  margin-top: 20px;"></span>  
                                    </div>
                                </div>

                                <a href="/HappyBeautySystem/AddToCart?service=addToCart&id=${ProductData.getProductId()}" class="cart-btn"><span class="icon_bag_alt"></span> Add to cart</a>
                                <div>
                                    <ul>
                                        <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                        <li><a href="#"><span class="icon_adjust-horiz"></span></a></li>
                                    </ul>  
                                </div>

                            </div>
                            <div class="product__details__widget">
                                <ul>
                                    <li>
                                        <span>Availability:</span>
                                        <div class="stock__checkbox">
                                            <label for="stockin">
                                                In Stock
                                                <input type="checkbox" id="stockin">
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <span>Available color:</span>
                                        <div class="color__checkbox">

                                            <label for="grey">
                                                <input type="radio" name="color__radio" id="grey">
                                                <span>${ProductData.getColor()}</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <span>Available size:</span>
                                        <div class="size__btn">

                                            <label for="l-btn">
                                                <input type="radio" id="l-btn">
                                                ${ProductData.getSize()}
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <span>Promotions:</span>
                                        <p>Free shipping</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">Specification</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">Reviews ( ${countReview} )</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <h6>Description</h6>
                                    <p>${ProductData.getLongDes()}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="related__title">
                            <h5>RELATED PRODUCTS</h5>
                        </div>
                    </div>
                    <!--Similar product-->
                    <c:forEach items="${requestScope.ProductCategory}" var="pc">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/related/rp-1.jpg">
                                    <c:if test="${top8New.contains(pc.getProductId())}">
                                        <div class="label new" style="border-radius: 10px;">New</div>
                                    </c:if>
                                    <c:if test="${lowInStock.contains(pc.getProductId())}">
                                        <div class="label new" style="color: #ff0000; background-color: #ffff66; border-radius: 10px;">Low In Stock</div>
                                    </c:if>
                                    <a href="product?action=productdetail&product_id=${pc.getProductId()}&product_category=${pc.getCateId()}">
                                        <img src="${pc.getPathImage()}" style = "border-radius: 20px; height: 100%; width: 100%" alt="image product"><span class="arrow_expand"></span></a>
                                    <ul class="product__hover">
                                        <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                        <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="product?action=productdetail&product_id=${pc.getProductId()}">${pc.getProductName()}</a></h6>
                                    <div class="rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product__price">$ ${pc.getPrice()}</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Product Details Section End -->

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
