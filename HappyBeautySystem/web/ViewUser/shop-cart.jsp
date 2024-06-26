<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@page import="model.ProductCart"%>
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
        <jsp:include page="navbar.jsp" />
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="./home"><i class="fa fa-home"></i> Trang chủ</a>
                            <span>Giỏ hàng</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->
        <!-- Shop Cart Section Begin -->
        <section class="shop-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shop__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th style="margin-left :40px">Sản phẩm</th>
                                        <th>Giá bán</th>
                                        <th>Số lượng</th>
                                        <th>Tổng tiền</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<Cart> listCart = (List<Cart>) request.getAttribute("listCart");
                                        double granTotal = 0;
                                        if (listCart != null && !listCart.isEmpty()) {
                                            ProductDAO daoProduct = new ProductDAO();
                                            for (Cart cart : listCart) {
                                                Product pro = daoProduct.getProductById(cart.getProductId());
                                                if (pro != null) {
                                                    double subtotal = cart.getQuantity() * pro.getPrice();

                                                    String formattedGranTotal = String.format("%.2f", granTotal);
                                    %>
                                    <tr>
                                        <td><input type="checkbox" class="product-checkbox" data-product-id="<%= pro.getProductId()%>" data-price="<%= String.format("%.2f", subtotal)%>"
                                                   onclick="updateTotal()"></td>
                                        <td class="cart__product__item">
                                            <a
                                                href="product?action=productdetail&product_id=<%= pro.getProductId()%>&product_category=<%= pro.getCateId()%>">
                                                <img style="height: 90px; width: 90px; margin-left: 40px;"
                                                     src="<%= pro.getPathImage()%>" alt=""></a>
                                            <div class="cart__product__item__title">
                                                <h6><a
                                                        href="product?action=productdetail&product_id=<%= pro.getProductId()%>&product_category=<%= pro.getCateId()%>"><%= pro.getProductName()%></a>
                                                </h6>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="cart__price"><%= String.format("%.2f", pro.getPrice())%></td>
                                        <td class="cart__quantity">
                                            <input type="number" value="<%= cart.getQuantity()%>" style="width: 50%" onblur="changeQuantity(this, `<%= cart%>`, <%= pro.getPrice()%>)"/>
                                        </td>

                                        <td class="cart__price sub_total" data-price="<%= String.format("%.2f", subtotal)%>"
                                            id="subtotal-<%= cart.getCartId()%>"><%= String.format("%.2f", subtotal)%></td>
                                        <td class="cart__close">
                                            <a
                                                href="AddToCart?service=deleteCart&productId=<%= cart.getProductId()%>&userId=<%= cart.getUserId()%>">
                                                <span class="icon_close"></span>
                                            </a>
                                        </td>

                                    </tr>
                                    <%
                                            }
                                        }
                                    } else {
                                    %>
                                    <tr>
                                        <td colspan="5" class="text-center">Giỏ hàng trống</td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="cart__btn">
                            <a href="product">Tiếp tục mua sắm</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="discount__content">
                            <h6>Mã giảm giá</h6>
                            <form action="#">
                                <input type="text" placeholder="Nhập mã giảm giá của bạn">
                                <button type="submit" class="site-btn">Áp dụng</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4 offset-lg-2">
                        <div class="cart__total__procced">
                            <h6>Thông tin mua hàng</h6>
                            <ul>
                                <li>Tổng tiền <span id="granTotal"><%= String.format("%.2f", granTotal)%></span></li>
                            </ul>
                            <button class="primary-btn " style="background-color: green" onclick="confirm(this);" >Xác nhận thanh toán</button></div>
                    </div>
                </div>
        </section>
        <!-- Shop Cart Section End -->

        <!-- Instagram Begin -->
        <div class="instagram">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="img/instagram/insta-1.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="img/instagram/insta-2.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="img/instagram/insta-3.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="img/instagram/insta-4.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="img/instagram/insta-5.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="img/instagram/insta-6.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ ashion_shop</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Instagram End -->

        <!-- Footer Section Begin -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-7">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="./index.html"><img src="ViewUser/img/footer-logo.png" alt=""></a>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                cilisis.</p>
                            <div class="footer__payment">
                                <a href="#"><img src="ViewUser/img/payment/payment-1.png" alt=""></a>
                                <a href="#"><img src="ViewUser/img/payment/payment-2.png" alt=""></a>
                                <a href="#"><img src="ViewUser/img/payment/payment-3.png" alt=""></a>
                                <a href="#"><img src="ViewUser/img/payment/payment-4.png" alt=""></a>
                                <a href="#"><img src="ViewUser/img/payment/payment-5.png" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-5">
                        <div class="footer__widget">
                            <h6>Quick links</h6>
                            <ul>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Blog</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-7">
                        <div class="footer__widget">
                            <h6>Account</h6>
                            <ul>
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">Orders Tracking</a></li>
                                <li><a href="#">Checkout</a></li>
                                <li><a href="#">Wishlist</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-7">
                        <div class="footer__widget">
                            <h6>NEWSLETTER</h6>
                            <div class="footer__newslatter">
                                <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                                <form action="#">
                                    <input type="text" placeholder="Your email">
                                    <button type="submit"><span class="icon_mail_alt"></span></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer__copyright__text">
                            <p>
                                Copyright &copy;
                                <script>document.write(new Date().getFullYear());</script>
                                All rights reserved | This template is made with <i class="fa fa-heart"
                                                                                    aria-hidden="true"></i> by <a href="https://colorlib.com"
                                                                                    target="_blank">Colorlib</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
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
        <script>
                                    // Định nghĩa mảng để lưu trữ các id sản phẩm được chọn
                                    let listProcductIdChoose = [];
                                    function updateTotal() {
                                        var checkboxes = document.querySelectorAll('.product-checkbox');
                                        var total = 0;
                                        checkboxes.forEach(function (checkbox) {
                                            if (checkbox.checked) {
                                                total += parseFloat(checkbox.dataset.price);
                                            }
                                        });
                                        document.getElementById('granTotal').innerText = total.toFixed(2);
                                    }

                                    function stringToObject(string) {
                                        let keyValuePairs = string.split(", ");
                                        let obj = {};

                                        for (let i = 0; i < keyValuePairs.length; i++) {
                                            let keyValue = keyValuePairs[i].split("=");
                                            let key = keyValue[0].trim();
                                            let value = keyValue[1].trim();

                                            if (!isNaN(value)) {
                                                value = parseFloat(value);
                                            }

                                            obj[key] = value;
                                        }

                                        return obj;
                                    }

                                    function changeQuantity(position, obj_raw, price) {
                                        let value = +position.value;
                                        if (value <= 0) {
                                            position.value = 1;
                                            value = 1;
                                        }
                                        let obj = stringToObject(obj_raw);
                                        $.ajax({
                                            url: "/HappyBeautySystem/AddToCart?service=updateQuantity&productId=" + obj.productId + "&userId=" + obj.userId + "&quantity=" + value,
                                            type: "POST",
                                            success: function (data) {
                                                let id = obj.cartId;
                                                let subtotalElement = document.getElementById('subtotal-' + id);
                                                let newSubtotal = price * value;
                                                subtotalElement.innerHTML = newSubtotal.toFixed(2);
                                                subtotalElement.setAttribute('data-price', newSubtotal.toFixed(2));

                                                // Cập nhật lại data-price của checkbox tương ứng
                                                var checkbox = document.querySelector('.product-checkbox[data-product-id="' + obj.productId + '"]');
                                                if (checkbox) {
                                                    checkbox.setAttribute('data-price', newSubtotal.toFixed(2));
                                                }

                                                updateTotal();  // Gọi updateTotal để cập nhật tổng giá khi thay đổi số lượng
                                            },
                                            error: function (xhr, status, error) {
                                                console.log(error);
                                            }
                                        });
                                    }

                                    function confirm(btn) {
                                        var checkboxes = document.querySelectorAll('.product-checkbox:checked');
                                        listProcductIdChoose = [];

                                        checkboxes.forEach(function (checkbox) {
                                            var productId = checkbox.getAttribute('data-product-id');
                                            listProcductIdChoose.push(productId);
                                        });

                                        if (listProcductIdChoose.length > 0) {
                                            let link = "OrderController?service=showAll";
                                            let params = new URLSearchParams();

                                            for (let i = 0; i < listProcductIdChoose.length; i++) {
                                                params.append('id', listProcductIdChoose[i]);
                                            }

                                            link += '&' + params.toString();
                                            window.location.href = link;
                                        }
                                    }

// Gọi updateTotal ban đầu để đảm bảo tổng giá ban đầu là 0
                                    updateTotal();




        </script>

    </body>

</html>
