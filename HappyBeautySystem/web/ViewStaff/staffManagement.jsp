<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="HappyBeauty Template">
        <meta name="keywords" content="HappyBeauty, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>HappyBeauty</title>
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
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
        <style>
            .header__top__auth {
                display: inline-block;
                float: right; /* Đẩy nút Login và Register về phía bên phải */
                margin-top: 10px; /* Khoảng cách với các phần tử khác */
            }

            .header__right__auth {
                display: inline-block;
                float: right; /* Đẩy phần đăng nhập/dang ký trong header về phía bên phải */
                margin-top: 10px; /* Khoảng cách với các phần tử khác */
            }

            .header__menu ul {
                margin-top: 0; /* Reset margin cho ul */
            }

            .header__menu ul li {
                display: inline-block;
                margin-right: 20px; /* Khoảng cách giữa các mục menu */
            }

            .header__menu ul li:last-child {
                margin-right: 0; /* Xóa margin-right cho mục cuối cùng */
            }
        </style>

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="header__top__right">
                                <div class="header__top__auth">
                                    <a href="login">Login</a>
                                    <a href="register">Register</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="header__logo">
                            <a href="./home"><img src="ViewUser/img/image_av.jpg" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <nav class="header__menu">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li><a href="about">About</a></li>
                                <li><a href="product">Shop</a></li>
                                <li><a href="news">News</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
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
                                    <li>
                                        <button type="button" style="border-radius: 4px" class="btn btn-outline-dark py-2 px-4" data-toggle="dropdown" aria-expanded="false">
                                            <c:if test="${sessionScope.inforUserLogin.image != null && sessionScope.inforUserLogin.image ne ''}">
                                                <img class="rounded-circle" width="20px" src="${sessionScope.inforUserLogin.image}">
                                                <span class="font-weight-bold" style="font-size: 16px">${sessionScope.inforUserLogin.name}</span>
                                            </c:if>
                                            <c:if test="${sessionScope.inforUserLogin.image == null || sessionScope.inforUserLogin.image eq ''}">
                                                <img class="rounded-circle" width="20px" src="ViewUser/img/avatar.png">

                                                <span class="font-weight-bold" style="font-size: 16px">${sessionScope.inforUserLogin.name}</span>
                                            </c:if>
                                        </button>

                                        <ul class="dropdown">
                                            <li><a  type="button" data-toggle="modal"  data-target="#userProfileModal">User profile</a></li>
                                                <c:if test="${sessionScope.inforUserLogin.roleId == 1}">
                                                <li><a href="dashboard">Manage</a></li>
                                                </c:if>
                                            <li><a href="logout">Logout</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </c:if>
                    </div>

                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="home"><i class="fa fa-home"></i> Home</a>
                            <span>News</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Blog Section Begin -->
        <section class="blog spad">
            <div class="container">
                <div class="row">
                    <!-- Buttons for posting and editing news -->
                    <div class="col-lg-12 text-right mb-4">
                        <a href="addnews?service=addnews" class="btn btn-success">Post News</a>
                    </div>
                    <c:forEach var="news" items="${newsList}">
                        <div class="col-lg-4 col-md-4 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic large__item">
                                    <img src="${news.imgUrl}" alt="${news.title}">
                                </div>
                                <div class="blog__item__text">
                                    <h6><a href="newsdetail?service=viewNewsDetail&newsID=${news.newsId}">${news.title}</a></h6>
                                    <ul>
                                        <li>${news.createTime}</li>
                                        <li>Category: ${news.categoryID}</li>
                                        <li>Updated: ${news.updateTime}</li>
                                        <li>Active: ${news.isActive}</li>
                                        <li>Confirmed: ${news.isConfirm}</li>
                                    </ul>
                                    <p>${news.content}</p>
                                    <div>
                                        <a href="editnews?service=editNews&newsID=${news.newsId}" class="btn btn-primary">Edit News</a>
                                        <a href="hidenews?service=hideNews&newsID=${news.newsId}" class="btn btn-danger">Hide News</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="col-lg-12 text-center">
                        <a href="#" class="primary-btn load-btn">Load more posts</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Section End -->

        <!-- Instagram Begin -->
        <div class="instagram">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="ViewUser/img/instagram/insta-1.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="ViewUser/img/instagram/insta-2.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="ViewUser/img/instagram/insta-3.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="ViewUser/img/instagram/insta-4.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="ViewUser/img/instagram/insta-5.jpg">
                            <div class="instagram__text">
                                <i
                                    class="fa fa-instagram"></i>
                                <a href="#">@ashion_shop</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                        <div class="instagram__item set-bg" data-setbg="ViewUser/img/instagram/insta-6.jpg">
                            <div class="instagram__text">
                                <i class="fa fa-instagram"></i>
                                <a href="#">@ashion_shop</a>
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
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="./home"><img src="ViewUser/img/image_av.jpg" alt=""></a>
                            </div>
                            <p>Keep a beautiful smile and happy with HappyBeauty</p>
                            <a href="#"><img src="ViewUser/img/payment.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
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
                    <div class="col-lg-2 col-md-3 col-sm-6">
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
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->
        <!-- Js Plugins -->
        <script src="ViewUser/js/jquery-3.3.1.min.js"></script>
        <script src="ViewUser/js/bootstrap.min.js"></script>
        <script src="ViewUser/js/jquery-ui.min.js"></script>
        <script src="ViewUser/js/jquery.countdown.min.js"></script>
        <script src="ViewUser/js/jquery.nice-select.min.js"></script>
        <script src="ViewUser/js/jquery.zoom.min.js"></script>
        <script src="ViewUser/js/jquery.dd.min.js"></script>
        <script src="ViewUser/js/jquery.slicknav.js"></script>
        <script src="ViewUser/js/owl.carousel.min.js"></script>
        <script src="ViewUser/js/main.js"></script>
    </body>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
            var newPassword = document.getElementById("new_pass");
            var confirmPassword = document.getElementById("confirm_pass");

            newPassword.addEventListener("input", function () {
                var password = this.value.trim();
                var passwordError = document.getElementById("passwordError");

                if (password === "") {
                    passwordError.innerHTML = "Please enter a password (not all spaces).";
                } else if (!passwordPattern.test(password)) {
                    passwordError.innerHTML = "Password must be at least 8 characters long and include at least one letter, one number, and one special character.";
                } else {
                    passwordError.innerHTML = "";
                }
            });

            confirmPassword.addEventListener("input", function () {
                var password = newPassword.value.trim();
                var confirmPass = this.value.trim();
                var confirmPasswordError = document.getElementById("confirmPasswordError");

                if (confirmPass === "") {
                    confirmPasswordError.innerHTML = "Please enter a password (not all spaces).";
                } else if (password !== confirmPass) {
                    confirmPasswordError.innerHTML = "Passwords do not match.";
                } else {
                    confirmPasswordError.innerHTML = "";
                }
            });

            function validateForm() {
                var password = newPassword.value.trim();
                var confirmPass = confirmPassword.value.trim();

                if (password === "" || confirmPass === "") {
                    alert("Please enter a password (not all spaces).");
                    return false;
                }

                if (password !== confirmPass) {
                    alert("Passwords do not match.");
                    return false;
                }

                if (!passwordPattern.test(password)) {
                    alert("Password must be at least 8 characters long and include at least one letter, one number, and one special character.");
                    return false;
                }

                return true;
            }
        });
    </script>
</html>
