<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/84a8258e0d.js" crossorigin="anonymous"></script>

        <!-- Css Styles -->
        <link rel="stylesheet" href="ViewUser/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/style.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/styleHome.css" type="text/css">

    </head>

    <body>
        <!-- Page Preloder -->


        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__container">
                <div class="header__logo">
                    <a href="./home"><img src="ViewUser/img/image_av.jpg" alt="Logo"></a>
                </div>
                <nav class="header__menu">
                    <ul>
                        <li><a href="home">Trang chủ</a></li>
                        <li><a href="about">Giới thiệu</a></li>
                        <li><a href="product">Sản phẩm</a>
                            <!--                            <ul class="dropdown">
                                                            <li><a href="./product-details.html">Bodycare</a></li>
                                                            <li><a href="./shop-cart.html">Skincare</a></li>
                                                            <li><a href="./checkout.html">Haircare</a></li>
                                                            <li><a href="./blog-details.html">Makerup</a></li>
                                                            <li><a href="./blog-details.html">Perfume</a></li>
                                                        </ul>-->
                        </li>
                        <li><a href="news">Tin mới</a></li>
                        <li><a href="./contact.html">Liên Hệ</a></li>
                        <li><a href="coupon">Mã giảm giá</a></li>
                    </ul>
                </nav>
                <div class="header__right">

                    <c:if test="${sessionScope.inforUserLogin == null}">
                        <div class="header__right__auth">
                            <a href="login">Đăng Nhập</a>
                            <a href="register">Dăng kí</a>
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
                                        <li><a  type="button" data-toggle="modal"  data-target="#userProfileModal">Thông tin cá nhân</a></li>
                                            <c:if test="${sessionScope.inforUserLogin.roleId == 1}">
                                            <li><a href="dashboard">Quản lý</a></li>
                                            </c:if>
                                        <li><a href="logout">Đăng xuất</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                    <ul class="header__right__widget">
                        <li><a href="wishlist?service=showWishList"><span class="icon_heart_alt"></span></a></li>
                        <li><a href="AddToCart?service=showCart"><span class="fa fa-shopping-cart"></span></a></li>
                        <li><a href="/HappyBeautySystem/ManagerOrder?service=managerOrder&option=0"><i class="fa fa-bars"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="canvas__open">
                <i class="fa fa-bars"></i>
            </div>


            <!-- User Profile -->
            <div class="modal fade col-md-12" role="dialog" id="userProfileModal" style="  padding-right: 18px" >
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="border-radius: 10px; margin-top: 70px;">
                        <div class="modal-header">
                            <h2 class="text-center font-weight-bold" style="font-family: Arial;">Thông tin cá nhân</h2>
                        </div>

                        <div class="modal-body" style="background-color: #ffe6f2">
                            <section>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                                <c:choose>
                                                    <c:when test="${sessionScope.inforUserLogin.image != null && sessionScope.inforUserLogin.image ne ''}">
                                                        <img class="rounded-circle mt-5" width="150px" height="150px" src="${sessionScope.inforUserLogin.image}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="rounded-circle mt-5" width="150px" src="ViewUser/img/avatar.png">
                                                    </c:otherwise>
                                                </c:choose>
                                                <span class="font-weight-bold">${sessionScope.inforUserLogin.name}</span>
                                                <span class="text-black-50">${sessionScope.inforUserLogin.email}</span>
                                            </div>
                                        </div>

                                        <div class="col-md-8">
                                            <div class="p-3 py-5">
                                                <form action="customerprofile" method="post" enctype="multipart/form-data"  onsubmit="return validateForm()">
                                                    <div class="row mt-4">
                                                        <div class="col-md-6">
                                                            <label class="labels font-weight-bold" style="font-size: 20px;">Họ và tên</label>
                                                            <input id="fullName" type="text" class="form-control" name="fullName" placeholder="Full Name" value="${sessionScope.inforUserLogin.name}">
                                                            <span id="nameError" style="color: red;"></span>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="labels font-weight-bold" style="font-size: 20px;">Số điện thoại</label>
                                                            <input type="text" class="form-control" name="mobile" placeholder="Mobile" value="${sessionScope.inforUserLogin.mobile}">
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col-md-6">
                                                            <label class="labels font-weight-bold" style="font-size: 20px;">Địa chỉ</label>
                                                            <input type="text" class="form-control" name="address" placeholder="Address" value="${sessionScope.inforUserLogin.address}">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="labels font-weight-bold" style="font-size: 20px;">Email</label>
                                                            <input type="text" class="form-control" name="email" placeholder="Email" value="${sessionScope.inforUserLogin.email}" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col-md-6">
                                                            <label class="labels font-weight-bold" style="font-size: 20px;">Ảnh đại diện</label>
                                                            <input type="file" class="form-control" name="avatar" placeholder="Avatar" value="${sessionScope.inforUserLogin.image}">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="labels font-weight-bold" style="font-size: 20px;">Ngày sinh</label>
                                                            <input type="date" class="form-control" name="birth" placeholder="Birth" value="${sessionScope.inforUserLogin.dateofbirth}">
                                                        </div>
                                                    </div>

                                                    <div class="row mt-4">

                                                        <div class="col-md-6">
                                                            <button class="btn btn-dark" type="submit">Lưu</button>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col-md-6 text-right">
                                                            <button class="btn btn-dark btn-sm" type="button" data-toggle="modal" data-dismiss="modal" data-target="#ChangePasswordModal">Thay đổi mật khẩu</button>
                                                        </div>

                                                        <div class="col-md-6 text-right">
                                                            <a href="home"><button class="btn btn-dark" type="button">Trang chủ</button></a>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>



            <!-- Change Password -->
            <div class="modal fade col-md-12" role="dialog" id="ChangePasswordModal">
                <div class="modal-dialog">
                    <div class="modal-content" style="border-radius: 10px; margin-top: 80px;">
                        <div class="modal-header">
                            <h1 style="text-align: center; font-size: 30px">Thay đổi mật khẩu</h1>
                        </div>
                        <div class="modal-body" style="background-color: #ffe6f2">
                            <form action="changepassword" method="post" onsubmit="return validateForm()">
                                <input type="hidden" name="userId" value="${sessionScope.inforUserLogin.userId}"/>
                                <b>Nhập mật khẩu cũ</b>&nbsp;&nbsp;
                                <div class="form-group">
                                    <input name="old_pass" type="password" class="form-control" placeholder="Nhập mật khẩu cũ" style="border-radius: 100px;" required>
                                    <span id="oldPasswordError" style="color: red;"></span>
                                </div>
                                <b>Nhập mật khẩu mới </b>&nbsp;&nbsp;
                                <div class="form-group">
                                    <input name="new_pass" type="password" id="new_pass" class="form-control" placeholder="Nhập mật khẩu mới" style="border-radius: 100px;" required>
                                    <span id="passwordError" style="color: red;"></span>
                                </div>
                                <b>xác nhận lại mật khẩu mới</b>&nbsp;&nbsp;
                                <div class="form-group">
                                    <input name="confirm_pass" type="password" id="confirm_pass" class="form-control" placeholder="xác nhận lại mật khẩu mới" style="border-radius: 100px;" required>
                                    <span id="confirmPasswordError" style="color: red;"></span>
                                </div>
                                <br>
                                <center><button type="submit" class="btn btn-dark" style="padding-right: 160px;padding-left: 160px; border-radius: 100px;">Thay đổi mật khẩu</button></center>
                            </form>
                            <br><br>

                        </div>

                    </div>
                </div>
            </div>


        </header>
    </body>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
            var newPassword = document.getElementById("new_pass");
            var confirmPassword = document.getElementById("confirm_pass");
            var fullName = document.getElementById('fullName');

            newPassword.addEventListener("input", function () {
                var password = this.value.trim();
                var passwordError = document.getElementById("passwordError");

                if (password === "") {
                    passwordError.innerHTML = "Mật khẩu không được để toàn khoảng Trắng.";
                } else if (!passwordPattern.test(password)) {
                    passwordError.innerHTML = "Mật khẩu phải dài ít nhất 8 ký tự và bao gồm ít nhất một chữ cái, một số và một ký tự đặc biệt.";
                } else {
                    passwordError.innerHTML = "";
                }
            });

            confirmPassword.addEventListener("input", function () {
                var password = newPassword.value.trim();
                var confirmPass = this.value.trim();
                var confirmPasswordError = document.getElementById("confirmPasswordError");

                if (confirmPass === "") {
                    confirmPasswordError.innerHTML = "Mật khẩu không được để toàn khoảng Trắng.";
                } else if (password !== confirmPass) {
                    confirmPasswordError.innerHTML = "Mất khẩu không hợp lệ.";
                } else {
                    confirmPasswordError.innerHTML = "";
                }
            });

            fullName.addEventListener("input", function () {
                var fullNameValue = this.value.trim();
                var nameError = document.getElementById("nameError");
                if (fullNameValue === "" || !fullNameValue.replace(/\s/g, '').length) {
                    nameError.innerHTML = "Họ và tên không được để toàn khoảng Trắng.";
                } else {
                    nameError.innerHTML = "";
                }
            });

            function validateForm() {
                var password = newPassword.value.trim();
                var confirmPass = confirmPassword.value.trim();
                var fullName = document.getElementById('fullName').value;

                if (password === "" || confirmPass === "") {
                    alert("Mật khẩu không được để trống");
                    return false;
                }

                if (password !== confirmPass) {
                    alert("Mất khẩu không hợp lệ.");
                    return false;
                }

                if (!passwordPattern.test(password)) {
                    alert("Mật khẩu phải dài ít nhất 8 ký tự và bao gồm ít nhất một chữ cái, một số và một ký tự đặc biệt.");
                    return false;
                }

                if (fullName.trim() === '') {
                    alert('Họ và tên không được để toàn khoảng Trắng');
                    return false;
                }

                return true;
            }
        });
    </script>
</html>
