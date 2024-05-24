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
        <jsp:include page="navbar.jsp"/>
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                            <span>Shopping cart</span>
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
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<Cart> listCart = (List<Cart>) request.getAttribute("listCart");
                                        double granTotal = 0; // Khai báo và gán giá trị mặc định cho biến granTotal
                                        if (listCart != null && !listCart.isEmpty()) {
                                            ProductDAO daoProduct = new ProductDAO();
                                            for (Cart cart : listCart) {
                                                Product pro = daoProduct.getProductById(cart.getProductId());
                                                if (pro != null) {
                                                    double subtotal = cart.getQuantity() * pro.getPrice();
                                                    granTotal += subtotal;
                                                    String formattedGranTotal = String.format("%.2f", granTotal);
                                    %>
                                    <tr>
                                        <td class="cart__product__item">
                                            <img src="ViewUser/img/shop-cart/Ami.png" alt=""/>
                                            <div class="cart__product__item__title">
                                                <h6><%= pro.getProductName()%></h6>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="cart__price" data-price="<%= pro.getPrice()%>">$<%= pro.getPrice()%></td>
                                        <td class="cart__quantity">
                                            <input type="number" value="<%= cart.getQuantity()%>" style="width: 50%" onblur="changeQuantity(this, `<%= cart%>`, <%= pro.getPrice()%>)"/>
                                        </td>
                                        <td class="cart__price sub_total" data-price="<%= subtotal%>" id="<%= cart.getCartId()%>">$<%= subtotal%></td>
                                        <td class="cart__close">
                                            <a href="AddToCart?service=deleteCart&productId=<%= cart.getProductId()%>&userId=<%= cart.getUserId()%>">
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
                                        <td colspan="5" class="text-center">Your cart is empty</td>
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
                            <a href="#">Continue Shopping</a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="cart__btn update__btn">
                            <a href="#"><span class="btn btn-success"></span> Update cart</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="discount__content">
                            <h6>Discount codes</h6>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">Apply</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4 offset-lg-2">
                        <div class="cart__total__procced">
                            <h6>Cart total</h6>
                            <ul>
                                <li>Total <span id="granTotal">$<%= granTotal%></span></li>
                            </ul>
                            <a href="#" class="primary-btn">Order With Address Default</a>
                            <br><!-- comment -->
                            <a href="#" class="primary-btn " style="background-color: green">Order With Address Orther</a>
                        </div>
                    </div>
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
                    <div class="col-lg-4 col-md-6 col-sm-7">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="./index.html"><img src="img/logo.png" alt=""></a>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                cilisis.</p>
                            <div class="footer__payment">
                                <a href="#"><img src="img/payment/payment-1.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-2.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-3.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-4.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-5.png" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-5">
                        <div class="footer__widget">
                            <h6>Quick links</h6>
                            <ul>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Blogs</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4">
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
                    <div class="col-lg-4 col-md-8 col-sm-8">
                        <div class="footer__newslatter">
                            <h6>NEWSLETTER</h6>
                            <form action="#">
                                <input type="text" placeholder="Email">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                            <div class="footer__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <div class="footer__copyright__text">
                            <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                        </div>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
        <!-- Search End -->

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
                                document.addEventListener('DOMContentLoaded', function () {
                                    const priceCells = document.querySelectorAll('.cart__price');
                                    priceCells.forEach(cell => {
                                        const price = parseFloat(cell.getAttribute('data-price'));
                                        cell.textContent = price.toFixed(2);
                                    });

                                });
        </script>
        <!--        //CHANGE QUANTITY -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>

                                function stringToObject(string) {
                                    //Tách chuỗi ra thành các phần tử có key với value ví du:
                                    // [name=abc,age=20,gender=male]
                                    let keyValuePairs = string.split(", ");
                                    let obj = {}; // tạo 1 obj rỗng

                                    // duyệt mọi phần tử
                                    for (let i = 0; i < keyValuePairs.length; i++) {
                                        // Tạo 1 mảng chứa key - value,
                                        // trong mỗi phần tử lúc nãy vừa tách, ta tách tiếp thành cặp key-value
                                        // để thêm vào obj
                                        let keyValue = keyValuePairs[i].split("=");

                                        // Mảng có 2 phần tử, 0: key, 1: value
                                        let key = keyValue[0].trim();
                                        let value = keyValue[1].trim();

                                        // Check xem value có phải số hay không? nếu là số thì parse
                                        if (!isNaN(value)) {
                                            value = parseFloat(value);
                                        }

                                        // thêm key-value vào obj
                                        obj[key] = value;
                                    }

                                    return obj;
                                }
                                function changeQuantity(position, obj_raw, price) {
                                    let value = +position.value;
                                    if (value <= 0) {
                                        position.value = 1;

                                    }
                                    console.log(typeof +position.value);
                                    let obj = stringToObject(obj_raw);
                                    console.log(obj)
                                    console.log(price);
                                    $.ajax({
                                        url: "/HappyBeautySystem/AddToCart?service=updateQuantity&productId=" + obj.productId + "&userId=" + obj.userId + "&quantity=" + position.value,
                                        type: "POST",
                                        success: function (data) {
                                            let id = obj.cartId;
                                            let total = document.getElementById(id);
                                            total.innerHTML = price * position.value;

                                            let priceCells = document.querySelectorAll('.sub_total');
                                            let totalPrice = 0;
                                            console.log(priceCells);
                                            priceCells.forEach(cell => {
                                                let price = +cell.innerHTML;
//                                                cell.textContent = price.toFixed(2);
                                                totalPrice += price;
                                                
                                            });
                                            console.log(totalPrice);
                                            document.getElementById('granTotal').innerHTML = totalPrice.toFixed(2);

                                        },
                                        error: function (xhr, status, error) {

                                        }
                                    });
                                }
        </script>

    </body>
</html>
