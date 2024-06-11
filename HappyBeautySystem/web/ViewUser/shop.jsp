<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page isErrorPage="true" %>
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
        <!-- Header Section End -->


        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="home"><i class="fa fa-home"></i> Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Shop Section Begin -->
        <section class="shop spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-12">
                        <div class="shop__sidebar">
                            <script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    document.getElementById("text").oninput = function () {
                                        var text = this.value;
                                        text = text.trim().replace(/\s+/g, ' ');
                                    };
                                    document.getElementById("fromPrice").oninput = function () {
                                        var fromPrice = this.value;
                                        if (fromPrice === "") {
                                            document.getElementById("priceError").innerHTML = "Please enter number!";
                                        } else if (parseInt(fromPrice) < 0) { // check number < 0
                                            document.getElementById("priceError").innerHTML = "From price must be > 0";
                                        } else {
                                            document.getElementById("priceError").innerHTML = "";
                                        }
                                    };
                                    document.getElementById("toPrice").oninput = function () {
                                        var fromPrice = this.value;
                                        if (fromPrice === "") {
                                            document.getElementById("priceError").innerHTML = "Please enter number!";
                                        } else if (parseInt(fromPrice) < 0) { // Kiểm tra số âm
                                            document.getElementById("priceError").innerHTML = "To price must be > 0";
                                        } else {
                                            document.getElementById("priceError").innerHTML = "";
                                        }
                                    };
                                });

                                function validateForm() {
                                    var isValid = true;
                                    var text = document.getElementById("text").value;
                                    text = text.trim().replace(/\s+/g, ' ');
                                    document.getElementById("text").value = text;
                                    return isValid;
                                }
                            </script>

                            <div class="sidebar__categories">
                                <!--List Category-->
                                <!--sidebar widget start-->
                                <div class="sidebar_widget">
                                    <div class="widget_list widget_categories">
                                        <div class="section-title">
                                            <h4>Shop By Categories</h4>
                                        </div>
                                    </div>

                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFive">List Category</a>
                                    </div>
                                </div>
                                <!-- sidebar widget end-->
                                <div class="categories__accordion">
                                    <div class="accordion" id="accordionExample">
                                        <div class="card">

                                            <div id="collapseFive" class="h" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    <ul>
                                                        <li><a href="product">All</a></li>
                                                            <c:forEach items="${categoryList}" var="c">
                                                            <li><a href="product?action=listByCategory&category_id=${c.categoryId}">${c.categoryName}</a></li>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--Price Product-->
                    <div class="col-lg-9 col-md-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6">
                                <!--search bar-->
                                <div class="sidebar__categories">

                                    <!--Search By Price-->
                                    <!--sidebar widget start-->
                                    <div class="sidebar_widget">
                                        <div class="widget_list widget_categories">
                                            <div class="section-title">
                                                <h4>Search Product</h4>
                                            </div>
                                        </div>
                                    </div>

                                    <form action="product?service=search" method="post" onsubmit="return validateForm()">
                                        <input style = "
                                               border: 2px solid #BDBDBD;
                                               border-radius: 10px;
                                               overflow: hidden;" 
                                               id="text" name="text" placeholder="Enter search keyword..." type="text" value="${param.text}">
                                        <button style="color: black; background-color: pink; border-radius: 40px;" 
                                                type="submit" class="btn btn-secondary btn-number"><i class="fa fa-search"></i></button>
                                        <!--<span id="textError" style="color: #008ce6; font-size: 13px; font-weight: 500;  margin-top: 10px;"></span>-->
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="sidebar__categories">
                                    <!--Search By Price-->
                                    <!--sidebar widget start-->
                                    <div class="sidebar_widget">
                                        <div class="widget_list widget_categories">
                                            <div class="section-title">
                                                <h4>Shop by price</h4>
                                            </div>
                                        </div>
                                    </div>

                                    <form action="product?service=searchPrice" method="post">
                                        <div class="categories__accordion">
                                            <div class="form-row">
                                                <div style="margin-top: 7px; color: #9e9e9e">$</div>
                                                <div class="col mb-3">
                                                    <!--<label for="fromPrice">From Price:</label>-->
                                                    <input min="0" id="fromPrice" name="fromPrice" type="number" class="form-control" placeholder="Min" value="${param.fromPrice}">
                                                </div>
                                                <div style="margin-top: 7px; color: #9e9e9e">-$</div>
                                                <div class="col mb-3">
                                                    <!--<label for="toPrice">To Price:</label>-->
                                                    <input min="0" id="toPrice" name="toPrice" type="number" class="form-control" placeholder="Max" value="${param.toPrice}">
                                                </div>
                                                <div class="col mb-3">
                                                    <button style="color: black; background-color: pink;" type="submit" class="btn btn-secondary btn-number">
                                                        <i class="fa fa-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <span id="priceError" style="color: red; font-size: 13px; font-weight: 500;"></span>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!--sidebar widget end-->
                            <!--Sidebar sort start-->
                            <div class="col-lg-4 col-md-6">
                                <div class="sidebar__categories">
                                    <!--Sort product-->
                                    <!--sidebar widget start-->
                                    <div class="sidebar_widget">
                                        <div class="widget_list widget_categories">
                                            <div class="section-title">
                                                <h4>Sort Product</h4>
                                            </div>
                                        </div>

                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseFive">Sort</a>
                                        </div>
                                    </div>
                                    <!--sidebar widget end-->
                                    <div class="categories__accordion">
                                        <div class="accordion" id="accordionExample">
                                            <div class="card">
                                                <div id="collapseFive" class="collapse" data-parent="#accordionExample">
                                                    <div class="card-body">
                                                        <ul>
                                                            <li><a href="product?action=sort&type=low">Prices range from low to high</a></li>
                                                            <li><a href="product?action=sort&type=high">Prices range from high to low</a></li>
                                                            <li><a href="product?action=sort&type=a-z">A-Z</a></li>
                                                            <li><a href="product?action=sort&type=z-a">Z-A</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!--List product-->
                        <div class="row">
                            <c:forEach items="${requestScope.productList}" var="p">
                                <div class="col-lg-4 col-md-4">
                                    <div class="product__item">                                         
                                        <div class="product__item__pic set-bg" data-setbg="ViewUser/img/shop/shop-7.jpg">
                                            <div class="label new">New</div>
                                            <a href="product?action=productdetail&product_id=${p.getProductId()}&product_category=${p.getCateId()}" >
                                                <img src="${p.getPathImage()}" style = "border-radius: 20px; height: 100%; width: 100%"" alt="image product"><span class="arrow_expand"></span></a>
                                            <ul class="product__hover">

                                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                                <li><a href="/HappyBeautySystem/AddToCart?service=addToCart&id=${p.getProductId()}">
                                                        <span class="icon_bag_alt"></span></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h5><a href="product?action=productdetail&product_id=${p.getProductId()}&product_category=${p.getCateId()}">${p.getProductName()}</a></h5>
                                            <h6>${p.getShortDes()}</h6>
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

                            <!--Pagination-->
                            <c:set var="page" value="${page}"/>
                            <div class="col-lg-12 text-center">
                                <div class="pagination__option">
                                    <c:forEach begin="${1}" end="${num}" var="i">
                                        <a href="product?page=${i}">${i}</a>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->

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
