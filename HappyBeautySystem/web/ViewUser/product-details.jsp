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
        <style>
            .button-holder button {
                border: 2px solid #6699ff;
                border-radius: 40px;
                width: 70px;
                height: 37px;
                text-align: center;
                background-color: #99ccff;
                box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.2);
                transition: background-color 0.3s, border-color 0.3s;
            }

            .button-holder button.active {
                background-color: #ff99cc;
                border-color: #f971cbda;
                color: white;
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
                            <a href="./home"><i class="fa fa-home"></i> Trang chủ</a>
                            <a href="/HappyBeautySystem/product">Sản phẩm </a>
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
                                        <img style = "border: 4px solid #fddfdf; border-radius: 40px; height: 180px; width: 150px;" alt="image product" src="${i}" alt="">
                                    </a>
                                </c:forEach>
                                <img data-hash="product-1" class="product__big__img" style = "border: 4px solid #fddfdf; border-radius: 40px; height: 180px; width: 150px;" alt="image product" src="${ProductData.getPathImage()}" alt="">
                            </div>
                            <div class="product__details__slider__content">
                                <div class="product__details__pic__slider owl-carousel">
                                    <img data-hash="product-1" class="product__big__img" style = "border: 4px solid #fddfdf; border-radius: 40px; height: 570px; width: 380px;" alt="image product" src="${ProductData.getPathImage()}" alt="">
                                    <c:forEach items="${image}" var="i">
                                        <img data-hash="product-1" class="product__big__img" style = "border: 4px solid #fddfdf; border-radius: 40px; height: 570px; width: 380px;" alt="image product" src="${i}" alt="">
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="product__details__text">
                            <h3>${ProductData.getProductName()}</h3>
                            <h4 style="color: #008ce6; font-weight: bold">Hãng: ${ProductData.getCompanyName()}</h4>
                            <div class="rating">
                                <span style="color: #ddb100; font-weight: bold; font-size: 14px">${avgRating}  </span>
                                <i class="fa fa-star"></i>

                                <span>(</span><span style="color: black; font-size: 13px">${countReview}</span><span>Đánh Giá )</span>
                            </div>
                            <span>Mô tả: ${ProductData.getShortDes()}</span>

                            <div id="field-price" class="product__details__price">Giá: ${price} VNĐ</div>

                            <div style="color: black; font-weight: bold">Hướng dẫn sử dụng:</div>
                            <p>${ProductData.getLongDes()}</p>
                            <div class="product__details__widget">
                                <ul>
                                    <li>
                                        <span>Trạng thái:</span>
                                        <div class="stock__checkbox" id="stock-status">
                                            <!--Status-->
                                        </div>
                                    </li>
                                    <li>
                                        <span>Màu:</span>
                                        <div class="color__checkbox">

                                            <label for="grey">
                                                <input type="radio" name="color__radio" id="grey">
                                                <span>${ProductData.getColor()}</span>
                                            </label>
                                        </div>
                                    </li>
                                    <script>
                                        function updatePriceQuantity(element) {
                                            // Get the price from the button's attribute, Update the price display
                                            var price = parseFloat(element.getAttribute('price')).toFixed(0);
                                            document.getElementById('field-price').innerHTML = 'Giá: ' + price + ' VNĐ';
                                            // Update the hidden price input
                                            document.getElementById('price').value = price;

                                            var quantitySize = element.getAttribute('quantitySize');
                                            document.getElementById('field-quantity').innerHTML = 'Số lượng: ' + quantitySize;
                                            document.getElementById('field-quantity').setAttribute('quantitySize', quantitySize);
                                            document.getElementById('quantity').setAttribute('max', quantitySize);

                                            // Reset the quantity input field to its default value (1)
                                            document.getElementById('quantity').value = 1;
                                            // Update the hidden quantity input
                                            document.getElementById('quantitySize').value = quantitySize;

                                            // Update the hidden price input
                                            document.getElementById('price').value = price;
                                            // Get the size from the button's value
                                            var size = element.getAttribute('value');
                                            // Update the hidden size input
                                            document.getElementById('size').value = size;
                                            // Clear any existing error messages
                                            document.getElementById('textError').innerHTML = "";

                                            // Get all buttons
                                            var buttons = document.querySelectorAll('.button-holder button');

                                            // Remove the active class from all buttons
                                            buttons.forEach(function (btn) {
                                                btn.classList.remove('active');
                                            });

                                            // Add the active class to the clicked button
                                            element.classList.add('active');
                                            // Update the stock status based on quantitySize
                                            var stockStatusElement = document.getElementById('stock-status');
                                            if (quantitySize > 0) {
                                                stockStatusElement.innerHTML = '<p style="color: #2bba00; font-weight: bold">Còn hàng</p>';
                                            } else {
                                                stockStatusElement.innerHTML = '<p style="color: #ea0b4e; font-weight: bold">Hết hàng</p>';
                                            }
                                        }
                                        // Initialize the fields with the first button's attributes on page load
                                        window.onload = function () {
                                            var firstButton = document.querySelector('.button-holder button');
                                            if (firstButton) {
                                                updatePriceQuantity(firstButton);
                                            }
                                        }
                                    </script>
                                    <li>
                                        <span>Kích cỡ:</span>
                                        <div class="size__btn">
                                            <div class="button-holder">
                                                <c:forEach items="${sizeList}" var="s">
                                                    <button onclick="updatePriceQuantity(this)" value='${s.size}' price='${s.price}' quantitySize='${s.quantity}'
                                                            class="${status.first ? 'active' : ''}">
                                                        ${s.size}
                                                    </button>
                                                </c:forEach>
                                            </div>
                                            <input type="hidden" id="quantitySize" name="quantitySize" value="${quantitySize}" />
                                            <input type="hidden" id="price" name="price" value="${price}" />
                                            <input type="hidden" id="size" name="size" value="${size}" />
                                        </div>
                                    </li>

                                    <li>
                                        <span>Vận chuyển:</span>
                                        <p style="color: #2bba00; font-weight: bold">Miễn phí giao hàng</p>
                                    </li>
                                </ul>
                            </div>
                            <hr></hr>
                            <div id="field-quantity" class="quantity" style="color: black; font-size: 13px; font-weight: 600;  margin-top: 15px;">
                                Số lượng: ${quantitySize}
                            </div>
                            <div class="product__details__button">

                                <script>
                                    document.addEventListener("DOMContentLoaded", function () {
                                        document.getElementById("quantity").oninput = function () {
                                            var quantity = this.value;
                                            var maxQuantity = parseInt(document.getElementById("quantity").getAttribute('max'));
                                            if (quantity === "") {
                                                document.getElementById("textError").innerHTML = "Vui lòng nhập số!";
                                            } else if (parseInt(quantity) < 1) { // check number < 1
                                                document.getElementById("textError").innerHTML = "Số lượng lớn hơn 0";
                                            } else if (parseInt(quantity) > maxQuantity) { // check number < 1
                                                document.getElementById("textError").innerHTML = "Số lượng phải lớn hơn hoặc bằng " + maxQuantity;
                                            } else {
                                                document.getElementById("textError").innerHTML = "";
                                            }
                                        };
                                    });
                                </script>

                                <div id="field-quantity">
                                    <input style ="border: 2px solid #fddfdf;
                                           border-radius: 40px;
                                           width: 120px;
                                           height: 50px;
                                           text-align: center;
                                           background-color: #fddfdf;
                                           box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.2);
                                           margin-bottom: 10px; margin-left: 50px" 
                                           min = "1" max = ${quantitySize} id="quantity" name="quantity" type="number" class="form-control" placeholder="1" >
                                </div>

                                <div style="display: block; text-align: center;">
                                    <span id="textError" style="color: red; font-size: 12px; font-weight: 500;  margin-top: 20px;"></span>  
                                </div>

                                <a href="/HappyBeautySystem/AddToCart?service=addToCart&id=${ProductData.getProductId()}" class="cart-btn" style="margin-top: 10px"><span class="icon_cart"></span> Thêm vào giỏ hàng</a>
                                <div style="margin-top: 19px;">
                                    <ul>
                                        <li><a href="wishlist?service=addWishList&id=${ProductData.getProductId()}"><span class="icon_heart_alt"></span></a></li>
                                        <li><a href="#"><span class="icon_adjust-horiz"></span></a></li>
                                    </ul>  
                                </div>

                            </div>

                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Mô tả chi tiết</a>
                                </li>
                                <!--                                <li class="nav-item">
                                                                    <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">Specification</a>
                                                                </li>-->
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">Đánh giá sản phẩm ( ${countReview} )</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <h5 style="font-weight: 600;text-transform: uppercase">Mô tả chi tiết</h5>
                                    <p>${ProductData.getLongDes()}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel" style="margin-top: 50px">
                                <div class="blog__details__comment">
                                    <h5>Viết Đánh Giá</h5>
                                    <form action="product?action=productdetail&service=addfeedback&product_id=${ProductData.getProductId()}&product_category=${ProductData.getCateId()}&user_id=${sessionScope.inforUserLogin.userId}" method="POST">
                                        <div class="form-group">
                                            <textarea class="form-control" id="comment" name="comment" rows="4" placeholder="Viết đánh giá của quý khách ở đây..." required></textarea>
                                            <span id="nameError" style="color: red;"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="rating">Mức độ hài lòng:</label>
                                            <div id="rating">
                                                <label>
                                                    <input type="radio" name="rating" value="1" required> &#9733;
                                                </label>
                                                <label>
                                                    <input type="radio" name="rating" value="2"> &#9733 &#9733
                                                </label>
                                                <label>
                                                    <input type="radio" name="rating" value="3"> &#9733 &#9733 &#9733
                                                </label>
                                                <label>
                                                    <input type="radio" name="rating" value="4"> &#9733 &#9733 &#9733 &#9733
                                                </label>
                                                <label>
                                                    <input type="radio" name="rating" value="5"> &#9733 &#9733 &#9733 &#9733 &#9733
                                                </label>
                                            </div>
                                        </div>
                                        <button type="submit" class="site-btn">Gửi đánh giá</button>
                                    </form>
                                    <h5 style="margin-top: 50px">${countReview} Đánh Giá</h5>
                                    <c:forEach items="${feedback}" var="feedback">
                                        <div class="blog__comment__item">
                                            <div class="blog__comment__item__pic">
                                                <img src="" alt="">
                                            </div>
                                            <div class="blog__comment__item__text">
                                                <c:forEach items="${user}" var="user">
                                                    <c:if test="${feedback.userId == user.userId}">
                                                        <h6>${user.name}</h6>
                                                    </c:if>
                                                </c:forEach>    
                                                <p>${feedback.comment}</p>
                                                <ul>
                                                    <li><i class="fa fa-clock-o"></i> ${feedback.createdAt}</li>

                                                </ul>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="related__title">
                            <h5>SẢN PHẨM LIÊN QUAN</h5>
                        </div>
                    </div>
                    <!--Similar product-->
                    <c:forEach items="${requestScope.ProductCategory}" var="pc">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/related/rp-1.jpg">
                                    <c:if test="${top8New.contains(pc.getProductId())}">
                                        <div class="label new" style="border-radius: 10px;">Mới</div>
                                    </c:if>
                                    <c:if test="${lowInStock.contains(pc.getProductId())}">
                                        <div class="label new" style="color: #ff0000; background-color: #ffff66; border-radius: 10px;">Sắp hết hàng</div>
                                    </c:if>
                                    <a href="product?action=productdetail&product_id=${pc.getProductId()}&product_category=${pc.getCateId()}">
                                        <img src="${pc.getPathImage()}" style = "border-radius: 20px; height: 100%; width: 100%" alt="image product"><span class="arrow_expand"></span></a>
                                    <ul class="product__hover">
                                        <li><a href="wishlist?service=addWishList&id=${pc.getProductId()}"><span class="icon_heart_alt"></span></a></li>
                                        <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h5><a href="product?action=productdetail&product_id=${pc.getProductId()}&product_category=${pc.getCateId()}">${pc.getProductName()}</a></h5>
                                    <div class="rating">
                                        <span style="color: #ddb100; font-weight: bold; font-size: 14px">${avgRating}  </span>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product__price" style="color: #ea5d8c; font-size: 16px;">${pc.getPrice()} VNĐ</div>
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
        <script>
                                    document.addEventListener("DOMContentLoaded", function () {
                                        function formatFullName(name) {
                                            name = name.trim().replace(/\s+/g, ' ');
                                            return name;
                                        }

                                        document.getElementById("comment").oninput = function () {
                                            var name = this.value;
                                            this.value = name;
                                            if (name === "") {
                                                document.getElementById("nameError").innerHTML = "Comment must not be empty.";
                                            } else if (/^\s/.test(name)) {
                                                document.getElementById("nameError").innerHTML = "Comment should not have all space.";
                                            } else {
                                                document.getElementById("nameError").innerHTML = "";
                                            }
                                        };

                                    });
        </script>
    </body>

</html>
