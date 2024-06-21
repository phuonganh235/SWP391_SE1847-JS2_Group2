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
                        <li><a href="home">Home</a></li>
                        <li><a href="about">About</a></li>
                        <li><a href="product">Shop</a>
                            <!--                            <ul class="dropdown">
                                                            <li><a href="./product-details.html">Bodycare</a></li>
                                                            <li><a href="./shop-cart.html">Skincare</a></li>
                                                            <li><a href="./checkout.html">Haircare</a></li>
                                                            <li><a href="./blog-details.html">Makerup</a></li>
                                                            <li><a href="./blog-details.html">Perfume</a></li>
                                                        </ul>-->
                        </li>
                        <li><a href="news">News</a></li>
                        <li><a href="./contact.html">Contact</a></li>
                    </ul>
                </nav>
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
            <div class="modal fade col-md-12" role="dialog" id="userProfileModal" style="padding-right: 18px ">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="border-radius: 10px; margin-top: 70px;">
                        <div class="modal-header">
                            <h2 class="text-center font-weight-bold" style="font-family: Arial;">User Profile</h2>
                        </div>

                        <div class="modal-body">
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
                                                <form action="ManageAccount" method="post" enctype="multipart/form-data">
                                                    <div class="row mt-4">
                                                        <div class="col-md-6">
                                                            <label class="labels font-weight-bold" style="font-size: 20px;">Full Name</label>
                                                            <input type="text" class="form-control" name="fullName" placeholder="Full Name" value="${sessionScope.inforUserLogin.name}">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="labels font-weight-bold" style="font-size: 20px;">Mobile</label>
                                                            <input type="text" class="form-control" name="mobile" placeholder="Mobile" value="${sessionScope.inforUserLogin.mobile}">
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col-md-6">
                                                            <label class="labels font-weight-bold" style="font-size: 20px;">Address</label>
                                                            <input type="text" class="form-control" name="address" placeholder="Address" value="${sessionScope.inforUserLogin.address}">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="labels font-weight-bold" style="font-size: 20px;">Email</label>
                                                            <input type="text" class="form-control" name="email" placeholder="Email" value="${sessionScope.inforUserLogin.email}" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col-md-6">
                                                            <label class="labels font-weight-bold" style="font-size: 20px;">Avatar</label>
                                                            <input type="file" class="form-control" name="avatar" placeholder="Avatar" value="${sessionScope.inforUserLogin.image}">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="labels font-weight-bold" style="font-size: 20px;">Birth</label>
                                                            <input type="date" class="form-control" name="birth" placeholder="Birth" value="${sessionScope.inforUserLogin.dateofbirth}">
                                                        </div>
                                                    </div>

                                                    <div class="row mt-4">

                                                        <div class="col-md-6">
                                                            <button class="btn btn-dark" type="submit">Save</button>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col-md-6 text-right">
                                                            <button class="btn btn-dark btn-sm" type="button" data-toggle="modal" data-dismiss="modal" data-target="#ChangePasswordModal">Change Password</button>
                                                        </div>

                                                        <div class="col-md-6 text-right">
                                                            <a href="home"><button class="btn btn-dark" type="button">Home</button></a>
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
                            <h1 style="text-align: center; font-size: 30px">Change password</h1>
                        </div>
                        <div class="modal-body">
                            <form action="changepassword" method="post" onsubmit="return validateForm()">
                                <input type="hidden" name="userId" value="${sessionScope.inforUserLogin.userId}"/>
                                <b>Enter old password</b>&nbsp;&nbsp;
                                <div class="form-group">
                                    <input name="old_pass" type="password" class="form-control" placeholder="Enter old password" style="border-radius: 100px;" required>
                                    <span id="oldPasswordError" style="color: red;"></span>
                                </div>
                                <b>Enter New password</b>&nbsp;&nbsp;
                                <div class="form-group">
                                    <input name="new_pass" type="password" id="new_pass" class="form-control" placeholder="Enter New password" style="border-radius: 100px;" required>
                                    <span id="passwordError" style="color: red;"></span>
                                </div>
                                <b>Enter the new password again</b>&nbsp;&nbsp;
                                <div class="form-group">
                                    <input name="confirm_pass" type="password" id="confirm_pass" class="form-control" placeholder="Enter the new password again" style="border-radius: 100px;" required>
                                    <span id="confirmPasswordError" style="color: red;"></span>
                                </div>
                                <br>
                                <center><button type="submit" class="btn btn-dark" style="padding-right: 160px;padding-left: 160px; border-radius: 100px;">update password</button></center>
                            </form>
                            <br><br>
                            <a type="button" href="login" style="padding-left: 190px; text-decoration: none; border-radius: 100px;">back to login</a>
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
