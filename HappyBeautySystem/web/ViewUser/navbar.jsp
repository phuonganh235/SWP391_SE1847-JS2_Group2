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
        <style>
            #joinRoomModal .modal-content {
                background-color: #262625;
                border-radius: 15px;
                border: none;
            }

            #joinRoomModal .modal-header {
                background-color: #363739;
                border-bottom: none;
                border-radius: 15px 15px 0 0;
                padding: 20px 30px;
            }

            #joinRoomModal .modal-title {
                color: #fff;
                font-size: 24px;
                font-weight: 600;
            }

            #joinRoomModal .close {
                color: #fff;
                opacity: 0.8;
            }

            #joinRoomModal .modal-body {
                padding: 30px;
            }

            #form-container {
                width: 100%;
                max-width: 100%;
                background-color: transparent;
                position: static;
                transform: none;
            }

            #form__container__header {
                background-color: transparent;
                padding: 0 0 20px 0;
            }

            #form__container__header p {
                color: #fff;
                font-size: 20px;
                margin: 0;
                line-height: 1.4;
            }

            #form__content__wrapper {
                padding: 0;
            }

            #idroom {
                box-sizing: border-box;
                color: #fff;
                width: 100%;
                margin: 0 0 20px 0;
                border: none;
                border-radius: 8px;
                padding: 16px 20px;
                font-size: 16px;
                background-color: #3f434a;
            }

            #submitroom {
                width: 100%;
                padding: 16px 20px;
                font-size: 18px;
                font-weight: 600;
                color: #fff;
                background-color: #845695;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            #submitroom:hover {
                background-color: #9a67ad;
            }

            @media (max-width: 576px) {
                #joinRoomModal .modal-dialog {
                    margin: 10px;
                }

                #joinRoomModal .modal-body {
                    padding: 20px;
                }

                #idroom, #submitroom {
                    font-size: 14px;
                    padding: 12px 16px;
                }
            }


            .user-profile-points {
                background-color: #f8f9fa;
                border: 2px solid #28a745;
                border-radius: 10px;
                padding: 10px 15px;
                margin-top: 15px;
                display: inline-block;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .user-profile-points .points-label {
                font-weight: bold;
                color: #28a745;
                font-size: 16px;
                margin-right: 10px;
            }

            .user-profile-points .points-value {
                font-size: 18px;
                color: #343a40;
                font-weight: bold;
            }

        </style>
    </head>

    <body>
        <!-- Page Preloder -->


        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__container">
                <div class="header__logo">
                    <a href="./home"><img style="max-width: 400px; height: 400px" src="ViewUser/img/authen/logoweb.png" alt="Logo"></a>
                </div>
                <nav class="header__menu">
                    <ul>
                        <li><a href="home">Trang chủ</a></li>
                        <li><a href="about">Giới thiệu</a></li>
                        <li><a href="product">Sản phẩm</a></li>
                        <li><a href="news">Tin mới</a></li>
                        <li><a type="button" data-toggle="modal" data-target="#bookingModal">Tư Vấn</a></li>
<!--                        <li><a href="promotion">Khuyến mãi</a></li>-->
                        <li><a href="coupon">Mã giảm giá</a></li>
                    </ul>
                </nav>
               
                <div class="header__right">

                    <c:if test="${sessionScope.inforUserLogin == null}">
                        <div class="header__right__auth" >
                            <a href="login">Đăng Nhập</a>
                            <a href="register">Đăng kí</a>
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
                                            <img class="rounded-circle" width="20px" src="ViewAdmin/img/1.jpg">

                                            <span class="font-weight-bold" style="font-size: 16px">${sessionScope.inforUserLogin.name}</span>
                                        </c:if>
                                    </button>

                                    <ul class="dropdown">
                                        <li><a  type="button" data-toggle="modal"  data-target="#userProfileModal">Thông tin cá nhân</a></li>
                                        <li><a href="logout">Đăng xuất</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                </div>
                <ul class="header__right__widget" >
                    <li><a id="videoCallIcon" type="button" data-toggle="modal" data-target="#joinRoomModal"><i class="fa fa-video-camera"></i></a></li>
                    <li><a href="wishlist?service=showWishList"><span class="icon_heart_alt"></span></a></li>
                    <li><a href="AddToCart?service=showCart"><span class="fa fa-shopping-cart"></span></a></li>
                    <li><a href="/HappyBeautySystem/ManagerOrder?service=managerOrder&option=0"><i class="fa fa-bars"></i></a></li>
                </ul>
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
                                                        <img class="rounded-circle mt-5" width="150px" src="ViewAdmin/img/1.jpg">
                                                    </c:otherwise>
                                                </c:choose>
                                                <span class="font-weight-bold">${sessionScope.inforUserLogin.name}</span>
                                                <span class="text-black-50">${sessionScope.inforUserLogin.email}</span>
                                            </div>
                                            <!--                                            <div class="user-profile-points">
                                                                                            <span class="points-label">Điểm tích lũy mua hàng:</span>
                                                                                            <span class="points-value">${sessionScope.Point}</span>
                                                                                        </div>-->
                                        </div>
                                        <div class="col-md-8">
                                            <div class="p-3 py-5">
                                                <form action="customerprofile" id="formProfile" method="post" enctype="multipart/form-data"  onsubmit="return validateForm()">
                                                    <div class="row mt-4">
                                                        <div class="col-md-6">
                                                            <label for="fullName" class="labels font-weight-bold" style="font-size: 20px;">Họ và tên</label>
                                                            <input id="fullName" type="text" class="form-control" name="fullName" placeholder="Full Name" value="${sessionScope.inforUserLogin.name}">
                                                            <span id="nameError" style="color: red;"></span>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="mobileprofile" class="labels font-weight-bold" style="font-size: 20px;">Số điện thoại</label>
                                                            <input type="number" class="form-control" id="mobileprofile" name="mobile" placeholder="Mobile" value="${sessionScope.inforUserLogin.mobile}">
                                                            <span id="mobileErrorProfile" style="color: red;"></span>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col-md-6">
                                                            <label for="addressProfile" class="labels font-weight-bold" style="font-size: 20px;">Địa chỉ</label>
                                                            <input type="text" class="form-control" id="addressProfile" name="address" placeholder="Address" value="${sessionScope.inforUserLogin.address}">
                                                            <span id="addressErrorProfile" style="color: red;"></span>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="email" class="labels font-weight-bold" style="font-size: 20px;">Email</label>
                                                            <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="${sessionScope.inforUserLogin.email}" readonly>
                                                            <span id="emailError" style="color: red;"></span>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col-md-6">
                                                            <label class="labels font-weight-bold" style="font-size: 20px;">Ảnh đại diện</label>
                                                            <input type="file" class="form-control" name="avatar" placeholder="Avatar" onchange="loadImg(this, event)" required>
                                                            <span id="updatePathImageError" style="color: red;"></span>
<!--                                                            <img src="${sessionScope.inforUserLogin.image}" alt="lỗi ảnh" class="loadImage" />-->
                                                        </div>

                                                        <script>
                                                            function loadImg(input, event) {
                                                                var file = input.files[0];
                                                                var pathImageError = document.getElementById('updatePathImageError');
                                                                var loadImage = document.querySelector('.loadImage');

                                                                if (file) {
                                                                    var fileName = file.name;
                                                                    var fileExtension = fileName.split('.').pop().toLowerCase();

                                                                    if (['jpg', 'jpeg', 'png', 'gif'].includes(fileExtension)) {
                                                                        var reader = new FileReader();

                                                                        reader.onload = function (e) {
                                                                            loadImage.src = e.target.result;
                                                                        }

                                                                        reader.readAsDataURL(file);
                                                                        pathImageError.textContent = ''; // Clear error message if file is valid
                                                                    } else {
                                                                        pathImageError.textContent = 'Chỉ được tải lên các tệp hình ảnh (jpg, jpeg, png, gif).';
                                                                        input.value = ''; // Clear the input value to prevent form submission with invalid file
                                                                        loadImage.src = ''; // Clear the image preview
                                                                    }
                                                                } else {
                                                                    pathImageError.textContent = 'Vui lòng chọn một tệp hình ảnh.';
                                                                    loadImage.src = ''; // Clear the image preview
                                                                }
                                                            }
                                                        </script>

                                                        <div class="col-md-6">
                                                            <label for="birth" class="labels font-weight-bold" style="font-size: 20px;">Ngày sinh</label>
                                                            <input type="date" class="form-control" id="birth" name="birth" placeholder="Birth" value="${sessionScope.inforUserLogin.dateofbirth}">
                                                            <span id="birthError" style="color: red;"></span>
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
                            <form action="changepassword" method="post" id="formChangePass">
                                <input type="hidden" name="userId" value="${sessionScope.inforUserLogin.userId}"/>
                                <b>Nhập mật khẩu cũ</b>&nbsp;&nbsp;
                                <div class="form-group">
                                    <input name="old_pass" type="password" class="form-control" placeholder="Nhập mật khẩu cũ" style="border-radius: 100px;" required>
                                    <span id="oldPasswordError" style="color: red;">${errorOldpass}</span>
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
            <!-- form booking -->
            <div class="modal fade" role="dialog" id="bookingModal">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content" style="border-radius: 10px; margin-bottom: 30px">
                        <div class="modal-header">
                            <h2 class="modal-title font-weight-bold" style="font-family: Arial;">Đặt lịch tư vấn</h2>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body" style="background-image: url('ViewUser/img/shop/banner-7.jpg'); background-size: cover; background-position: center; background-repeat: no-repeat; max-height: 80vh; overflow-y: auto;">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-6">
                                        <form action="Consultation?service=insert" method="post" id="consultationForm">
                                            <div class="form-group">
                                                <label for="customerName" class="font-weight-bold">Họ và tên:</label>
                                                <input type="text" class="form-control" id="customerName" name="customerName" required>
                                                <small class="text-danger" id="nameCustomerError"></small>
                                            </div>
                                            <div class="form-group">
                                                <label for="customerAddress" class="font-weight-bold">Địa chỉ:</label>
                                                <input type="text" class="form-control" id="customerAddress" name="customerAddress" required="">
                                                <small class="text-danger" id="addressError"></small>
                                            </div>
                                            <div class="form-group">
                                                <label for="customerPhone" class="font-weight-bold">Số điện thoại:</label>
                                                <input type="number" class="form-control" id="customerPhone" name="customerPhone" required>
                                                <small class="text-danger" id="phoneError"></small>
                                            </div>
                                            <div class="form-group">
                                                <label for="customerEmail" class="font-weight-bold">Email:</label>
                                                <input type="email" class="form-control" id="customerEmail" name="customerEmail" required>

                                            </div>
                                            <div class="form-group">
                                                <label for="consultationDate" class="font-weight-bold">Ngày tư vấn:</label>
                                                <input type="date" class="form-control" id="consultationDate" name="consultationDate" required>
                                                <small class="text-danger" id="dateError"></small>
                                            </div>
                                            <div class="form-group">
                                                <label for="timeSlot" class="font-weight-bold">Chọn khoảng thời gian:</label>
                                                <select class="form-control" id="timeSlot" name="timeSlot" required>
                                                    <option value="">-- Chọn khoảng thời gian --</option>
                                                    <option value="8:00-9:00">8:00 AM - 9:00 AM</option>
                                                    <option value="9:00-10:00">9:00 AM - 10:00 AM</option>
                                                    <option value="10:00-11:00">10:00 AM - 11:00 AM</option>
                                                    <option value="14:00-15:00">2:00 PM - 3:00 PM</option>
                                                    <option value="15:00-16:00">3:00 PM - 4:00 PM</option>
                                                    <option value="16:00-17:00">4:00 PM - 5:00 PM</option>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="note" class="font-weight-bold">Ghi chú:</label>
                                                <textarea class="form-control" id="note" name="note" rows="3"></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Đặt lịch</button>
                                        </form>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="feature-intro" style="background-color: rgba(255, 255, 255, 0.8); padding: 20px; border-radius: 10px; margin-bottom: 20px;">
                                            <h2 style="color: #333;">Dịch vụ tư vấn sản phẩm từ xa</h2>
                                            <h5 style="color: #666;">HappybeautySystem cung cấp dịch vụ tư vấn sản phẩm từ xa cho khách hàng với tiêu chí:</h5>
                                            <ul style="color: #444; padding-left: 20px;">
                                                <li>Nhanh chóng</li>
                                                <li>Tiện lợi</li>
                                                <li>Miễn phí</li>
                                            </ul>
                                        </div>
                                        <div class="video-guide" style="background-color: rgba(255, 255, 255, 0.8); padding: 20px; border-radius: 10px;">
                                            <h4 style="color: #333; margin-bottom: 15px;">Hướng dẫn đặt lịch tư vấn</h4>
                                            <div class="embed-responsive embed-responsive-16by9">                         
                                                <video width="320" height="240" controls>
                                                    <source src="ViewUser/img/Untitled video - Made with Clipchamp.mp4" type="video/mp4">                               
                                                </video>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <h5 class="w-100 text-center">HappyBeautySystem – Your Beauty, Our Passion.</h5>
                        </div>
                    </div>
                </div>
            </div>



            <!-- Video Call Modal -->
            <div class="modal fade" id="joinRoomModal" tabindex="-1" role="dialog" aria-labelledby="joinRoomModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="joinRoomModalLabel">👋Tạo Hoặc tham gia phòng</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div id="lobby-container">
                                <div id="form-container">

                                    <div id="form__content__wrapper">
                                        <form id="join-form">
                                            <input id="idroom" type="text" name="invite_link" placeholder="Nhập mã phòng" required/>
                                            <input id="submitroom" type="submit" value="Join Room" />
                                        </form>
                                    </div>
                                </div>
                            </div>
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
            var formChangePass = document.getElementById("formChangePass");

            function validatePassword() {
                var password = newPassword.value.trim();
                var passwordError = document.getElementById("passwordError");
                if (password === "") {
                    passwordError.innerHTML = "Mật khẩu không được để trống.";
                    return false;
                } else if (!passwordPattern.test(password)) {
                    passwordError.innerHTML = "Mật khẩu phải dài ít nhất 8 ký tự và bao gồm ít nhất một chữ cái, một số và một ký tự đặc biệt.";
                    return false;
                } else {
                    passwordError.innerHTML = "";
                    return true;
                }
            }

            function validateConfirmPassword() {
                var password = newPassword.value.trim();
                var confirmPass = confirmPassword.value.trim();
                var confirmPasswordError = document.getElementById("confirmPasswordError");
                if (confirmPass === "") {
                    confirmPasswordError.innerHTML = "Xác nhận mật khẩu không được để trống.";
                    return false;
                } else if (password !== confirmPass) {
                    confirmPasswordError.innerHTML = "Mật khẩu xác nhận không khớp.";
                    return false;
                } else {
                    confirmPasswordError.innerHTML = "";
                    return true;
                }
            }

            newPassword.addEventListener("input", validatePassword);
            confirmPassword.addEventListener("input", validateConfirmPassword);

            formChangePass.addEventListener("submit", function (event) {
                var isPasswordValid = validatePassword();
                var isConfirmPasswordValid = validateConfirmPassword();

                if (!(isPasswordValid && isConfirmPasswordValid)) {
                    event.preventDefault(); // Ngăn form submit nếu có lỗi
                }
            });
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var errorMessage = "${errorOldpass}";
            if (errorMessage) {
                //                alert(errorMessage);

                $('#ChangePasswordModal').modal('show');
            }
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var fullName = document.getElementById('fullName');
            var address = document.getElementById('addressProfile');
            var mobile = document.getElementById('mobileprofile');
            var datOfBirth = document.getElementById('birth');
            var form = document.getElementById('formProfile');

            function validateFullName() {
                var fullNameValue = fullName.value.trim();
                var nameError = document.getElementById("nameError");
                if (fullNameValue === "" || !fullNameValue.replace(/\s/g, '').length) {
                    nameError.innerHTML = "Họ và tên không được để trống hoặc chỉ chứa khoảng trắng.";
                    return false;
                } else {
                    nameError.innerHTML = "";
                    return true;
                }
            }

            function validateAddress() {
                var addressValue = address.value.trim();
                var addressErrorProfile = document.getElementById("addressErrorProfile");
                if (!addressValue.replace(/\s/g, '').length) {
                    addressErrorProfile.innerHTML = "Địa chỉ không được chỉ chứa khoảng trắng.";
                    return false;
                } else {
                    addressErrorProfile.innerHTML = "";
                    return true;
                }
            }

            function validateMobile() {
                var mobileValue = mobile.value.trim();
                var mobileErrorProfile = document.getElementById("mobileErrorProfile");
                if (mobileValue.length < 10 || mobileValue.length > 11) {
                    mobileErrorProfile.innerHTML = "Số điện thoại tối thiểu là 10 tối đa 11 số.";
                    return false;
                } else {
                    mobileErrorProfile.innerHTML = "";
                    return true;
                }
            }

            function validateDateOfBirth() {
                var dateOfbirth = new Date(datOfBirth.value);
                var currentDate = new Date();
                var birthError = document.getElementById("birthError");
                if (dateOfbirth > currentDate) {
                    birthError.innerHTML = "Ngày sinh không được vượt quá ngày hiện tại.";
                    return false;
                } else {
                    birthError.innerHTML = "";
                    return true;
                }
            }

            fullName.addEventListener("input", validateFullName);
            address.addEventListener("input", validateAddress);
            mobile.addEventListener("input", validateMobile);
            datOfBirth.addEventListener("input", validateDateOfBirth);

            form.addEventListener('submit', function (e) {
                let isValid = true;
                // Gọi tất cả các hàm validate khi submit form
                isValid = validateFullName() && isValid;
                isValid = validateAddress() && isValid;
                isValid = validateMobile() && isValid;
                isValid = validateDateOfBirth() && isValid;
                if (!isValid) {
                    e.preventDefault();
                }
            });
        }
        );
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var formConsultion = document.getElementById('consultationForm');
            var nameInput = document.getElementById('customerName');
            var phoneInput = document.getElementById('customerPhone');
            var dateInput = document.getElementById('consultationDate');
            var address = document.getElementById("customerAddress");
            var nameCustomerError = document.getElementById('nameCustomerError');
            var phoneError = document.getElementById('phoneError');
            var dateError = document.getElementById('dateError');
            var addressError = document.getElementById("addressError")
            function validateName() {
                var name = nameInput.value.trim();
                if (name === '' || name.replace(/\s/g, '').length === 0) {
                    nameCustomerError.innerHTML = 'Họ và tên không được để trống hoặc chỉ chứa khoảng trắng.';
                    return false;
                } else {
                    nameCustomerError.innerHTML = '';
                    return true;
                }
            }
            function validateAddress() {
                var adress = address.value.trim();
                if (adress.replace(/\s/g, '').length === 0) {
                    addressError.innerHTML = 'Địa chỉ không được  chỉ chứa khoảng trắng.';
                    return false;
                } else {
                    addressError.innerHTML = '';
                    return true;
                }
            }

            function validatePhone() {
                var phone = phoneInput.value.trim();
                if (phone === '' || phone.replace(/\s/g, '').length === 0 || !/^[0-9]+$/.test(phone)) {
                    phoneError.innerHTML = 'Số điện thoại không hợp lệ hoặc chỉ chứa khoảng trắng.';
                    return false;
                } else if (phone.length < 10 || phone.length > 11) {
                    phoneError.innerHTML = 'Số điện thoại tối thiểu là 10 tối đa 11 số.';
                    return false;
                } else {
                    phoneError.innerHTML = '';
                    return true;
                }
            }

            function validateDate() {
                var date = new Date(dateInput.value);
                var today = new Date();
                var day = date.getDay();
                date.setHours(0, 0, 0, 0);
                today.setHours(0, 0, 0, 0);
                if (day === 0 || day === 6) {
                    dateError.innerHTML = 'Ngày tư vấn không được là thứ 7 hoặc chủ nhật.';
                    return false;
                } else if (date <= today) {
                    dateError.innerHTML = 'Ngày tư vấn không được trước hoặc là ngày hôm nay';
                    return false;
                } else {
                    dateError.innerHTML = '';
                    return true;
                }
            }



            nameInput.addEventListener('input', validateName);
            phoneInput.addEventListener('input', validatePhone);
            address.addEventListener('input', validateAddress);
            dateInput.addEventListener('change', validateDate);

            formConsultion.addEventListener('submit', function (e) {
                let isValid = true;
                // Gọi tất cả các hàm validate khi submit form
                isValid = validateName() && isValid;
                isValid = validatePhone() && isValid;
                isValid = validateDate() && isValid;
                isValid = validateAddress() && isValid;
                if (!isValid) {
                    e.preventDefault();
                }
            });
        }
        );
    </script>

    <script>
        let formJoinVideo = document.getElementById('join-form');

        formJoinVideo.addEventListener('submit', (e) => {
            e.preventDefault();
            let inviteCode = e.target.invite_link.value;

            // Đóng modal join room
            $('#joinRoomModal').modal('hide');
            // Mở cửa sổ popup mới cho video call
            let videoCallWindow = window.open('videocall?roomId=' + inviteCode, 'VideoCall', 'width=800,height=600,resizable=yes');
            // Kiểm tra nếu popup bị chặn
            if (!videoCallWindow || videoCallWindow.closed || typeof videoCallWindow.closed == 'undefined') {
                alert('Vui lòng cho phép popup để mở cửa sổ video call.');
            }
        });


    </script>
</html>
