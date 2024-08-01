<%@page import="model.Promotions"%>
<%@page import="java.util.List"%>
<%@page import="dal.PromotionDAO"%>
<%@page import="com.google.gson.Gson"%>
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
        <style>
            .label-container {
                display: flex;
                gap: 100px; /* Khoảng cách giữa các nhãn, có thể điều chỉnh */
            }
        </style>
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
                            <a href="home"><i class="fa fa-home"></i> Trang chủ</a>
                            <span>Cửa hàng</span>
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
                                            document.getElementById("priceError").innerHTML = "Vui lòng nhập số!";
                                        } else if (parseInt(fromPrice) < 0) { // check number < 0
                                            document.getElementById("priceError").innerHTML = "Giá nhỏ nhất > 0";
                                        } else {
                                            document.getElementById("priceError").innerHTML = "";
                                        }
                                    };
                                    document.getElementById("toPrice").oninput = function () {
                                        var fromPrice = this.value;
                                        if (fromPrice === "") {
                                            document.getElementById("priceError").innerHTML = "Vui lòng nhập số!";
                                        } else if (parseInt(fromPrice) < 0) { // Kiểm tra số âm
                                            document.getElementById("priceError").innerHTML = "Giá lớn nhất > 0";
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
                                            <h4>Phân loại</h4>
                                        </div>
                                    </div>

                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFive">Danh sách hãng</a>
                                    </div>
                                </div>
                                <!-- sidebar widget end-->
                                <div class="categories__accordion">
                                    <div class="accordion" id="accordionExample">
                                        <div class="card">

                                            <div id="collapseFive" class="h" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    <ul>
                                                        <li><a href="product">Tất cả</a></li>
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
                                                <h4>Tìm kiếm</h4>
                                            </div>
                                        </div>
                                    </div>

                                    <form action="product?service=search" method="post" onsubmit="return validateForm()">
                                        <input style = "
                                               border: 2px solid #BDBDBD;
                                               border-radius: 10px;
                                               overflow: hidden;" 
                                               id="text" name="text" placeholder="Nhập từ khóa tìm kiếm..." type="text" value="${param.text}">
                                        <button style="color: black; background-color: pink; border-radius: 40px;" 
                                                type="submit" class="btn btn-secondary btn-number"><i class="fa fa-search"></i></button>
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
                                                <h4>Lọc theo giá</h4>
                                            </div>
                                        </div>
                                    </div>

                                    <form action="product?service=searchPrice" method="post">
                                        <div class="categories__accordion">
                                            <div class="form-row">
                                                <div class="col mb-3">
                                                    <input min="0" id="fromPrice" name="fromPrice" type="number" class="form-control" placeholder="Từ" value="${param.fromPrice}">
                                                </div>
                                                <div style="margin-top: 7px; color: #9e9e9e">đ-</div>
                                                <div class="col mb-3">
                                                    <input min="0" id="toPrice" name="toPrice" type="number" class="form-control" placeholder="Đến" value="${param.toPrice}">
                                                </div>
                                                <div style="margin-top: 7px; color: #9e9e9e">đ</div>

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
                                                <h4>Sắp xếp</h4>
                                            </div>
                                        </div>

                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseFive">Thứ Tự</a>
                                        </div>
                                    </div>
                                    <!--sidebar widget end-->
                                    <div class="categories__accordion">
                                        <div class="accordion" id="accordionExample">
                                            <div class="card">
                                                <div id="collapseFive" class="collapse" data-parent="#accordionExample">
                                                    <div class="card-body">
                                                        <ul>
                                                            <li><a href="product?action=sort&type=low">Giá tăng dần</a></li>
                                                            <li><a href="product?action=sort&type=high">Giá giảm dần</a></li>
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
                                            <c:if test="${top8New.contains(p.getProductId())}">
                                                <div class="label new" style="border-radius: 10px;">Mới</div>
                                            </c:if>
                                            <c:if test="${lowInStock.contains(p.getProductId())}">
                                                <div class="label new" style="color: #ff0000; background-color: #ffff66; border-radius: 10px;">Sắp hết hàng</div>
                                            </c:if>
                                            <c:if test="${p.getQuantity() == 0}">
                                                <div class="label new" style="color: #ff0000; background-color: #ffff66; border-radius: 10px;">Hết hàng</div>
                                            </c:if>
                                            <a href="product?action=productdetail&product_id=${p.getProductId()}&product_category=${p.getCateId()}" >
                                                <img src="${p.getPathImage()}" style = "border-radius: 20px; height: 100%; width: 100%"" alt="image product"><span class="arrow_expand"></span></a>
                                            <ul class="product__hover">

                                                <li><a href="wishlist?service=addWishList&id=${p.getProductId()}">
                                                        <span class="icon_heart_alt"></span>
                                                    </a>
                                                </li>
                                                <li><a href="/HappyBeautySystem/AddToCart?service=addToCart&id=${p.getProductId()}">
                                                        <span class="icon_cart"></span></a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h5><a style="color: black; font-size: 18px; font-weight: 350;" href="product?action=productdetail&product_id=${p.getProductId()}&product_category=${p.getCateId()}">${p.getProductName()}</a></h5>
                                            <h6 style="color: #6d6dff; font-size: 22px; font-weight: 500;">${p.getCompanyName()}</h6>
                                            <%
                                                PromotionDAO promotionDAO = new PromotionDAO();
                                                List<Promotions> activePromotions = promotionDAO.getActivePromotion();
                                                int promotioncount = promotionDAO.countPromotion();
                                            %>
                                            <div id="field-price-${p.getProductId()}" class="product__price" style="color: #c0bfbf; font-size: 15px;; text-decoration: line-through;"></div>
                                            <div id="field-price2-${p.getProductId()}" class="product__price" style="color: #ea5d8c; font-size: 18px;"></div>
                                            <script>
                                                (function () {
                                                    // Function to format the price
                                                    function format(price) {
                                                        let priceString = parseFloat(price).toFixed(0);
                                                        priceString = priceString.replace(/\B(?=(\d{3})+(?!\d))/g, ".");
                                                        return priceString + ' VNĐ';
                                                    }

                                                    // Get the price from the server-side
                                                    let priceNew = ${p.getPrice()};

                                                    // Format the original price and display it
                                                    document.getElementById('field-price-${p.getProductId()}').innerHTML = format(priceNew);

                                                    // Get the active promotions from server-side
                                                    var promotions = <%= new Gson().toJson(activePromotions)%>;

                                                    // Calculate the promotional price
                                                    var promotionAmount = 0;
                                                    promotions.forEach(function (promotion) {
                                                        if (priceNew >= promotion.condition) {
                                                            promotionAmount = Math.max(promotionAmount, promotion.discountAmount);
                                                        }
                                                    });

                                                    // Calculate final price after discount
                                                    var priceAfterPromo = priceNew - promotionAmount;
                                                    priceAfterPromo = priceAfterPromo < 0 ? 0 : priceAfterPromo; // Ensure price is not negative

                                                    // Format the promotional price and display it
                                                    document.getElementById('field-price2-${p.getProductId()}').innerHTML = format(priceAfterPromo);
                                                    sessionStorage.setItem('priceAfterPromo', priceAfterPromo.toFixed(2));
                                                })();
                                            </script>
                                        </div>
                                    </div>
                                </div>    
                            </c:forEach>
                        </div>
                        <!--Pagination-->
                        <c:set var="page" value="${page}"/>
                        <c:set var="action" value="${param.action}"/>
                        <c:set var="type" value="${param.type}"/>
                        <c:set var="category_id" value="${param.category_id}"/>
                        <div class="col-lg-12 text-center">
                            <div class="pagination__option">
                                <c:forEach begin="${1}" end="${num}" var="i">
                                    <c:choose>
                                        <c:when test="${action == 'sort' && type == 'low'}">
                                            <a href="product?action=sort&type=low&page=${i}">${i}</a>
                                        </c:when>
                                        <c:when test="${action == 'sort' && type == 'high'}">
                                            <a href="product?action=sort&type=high&page=${i}">${i}</a>
                                        </c:when>
                                        <c:when test="${action == 'sort' && type == 'a-z'}">
                                            <a href="product?action=sort&type=a-z&page=${i}">${i}</a>
                                        </c:when>
                                        <c:when test="${action == 'sort' && type == 'z-a'}">
                                            <a href="product?action=sort&type=z-a&page=${i}">${i}</a>
                                        </c:when>
                                        <c:when test="${action == 'listByCategory'}">
                                            <a href="product?action=listByCategory&category_id=${category_id}&page=${i}">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="product?page=${i}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
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
