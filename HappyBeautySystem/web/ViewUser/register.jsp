<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Register</title>
        <!-- Font Icon -->
        <link rel="stylesheet" href="ViewUser/fonts/authen/material-icon/css/material-design-iconic-font.min.css">
        <!-- Main css -->
        <link rel="stylesheet" href="ViewUser/css/authen/style.css">
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                var mobilePattern = /^(?:\+84|0)(3|5|7|8|9)[0-9]{8}$/;
                var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

                function formatFullName(name) {
                    name = name.trim().replace(/\s+/g, ' ');
                    return name;
                }

                function formatAddress(address) {
                    address = address.trim().replace(/\s+/g, ' ');
                    return address;
                }

                document.getElementById("name").oninput = function () {
                    var name = this.value; // Không cần loại bỏ dấu cách ở đây
                    this.value = name;
                    if (name === "") {
                        document.getElementById("nameError").innerHTML = "Họ và tên không được để trống.";
                    } else if (/^\s/.test(name)) {
                        document.getElementById("nameError").innerHTML = "Tên đầy đủ không được bắt đầu bằng dấu cách.";
                    } else {
                        document.getElementById("nameError").innerHTML = "";
                    }
                };

                document.getElementById("username").oninput = function () {
                    var username = this.value;
                    if (/\s/.test(username)) {
                        document.getElementById("usernameError").innerHTML = "Tên người dùng không được chứa khoảng trắng.";
                    } else {
                        document.getElementById("usernameError").innerHTML = "";
                    }
                };

                document.getElementById("email").oninput = function () {
                    var email = this.value;
                    if (!emailPattern.test(email)) {
                        document.getElementById("emailError").innerHTML = "Vui lòng nhập địa chỉ email hợp lệ.";
                    } else {
                        document.getElementById("emailError").innerHTML = "";
                    }
                };

                document.getElementById("address").oninput = function () {
                    var address = this.value;
                    this.value = address;
                    if (address === "") {
                        document.getElementById("addressError").innerHTML = "Địa chỉ không được để trống.";
                    } else if (/^\s/.test(address)) { // Corrected from name to address
                        document.getElementById("addressError").innerHTML = "Địa chỉ không được bắt đầu bằng dấu cách.";
                    } else {
                        document.getElementById("addressError").innerHTML = "";
                    }
                };

                document.getElementById("mobile").oninput = function () {
                    var mobile = this.value;
                    if (!mobilePattern.test(mobile)) {
                        document.getElementById("mobileError").innerHTML = "Vui lòng nhập số điện thoại di động Việt Nam hợp lệ.";
                    } else {
                        document.getElementById("mobileError").innerHTML = "";
                    }
                };

                document.getElementById("pass").oninput = function () {
                    var password = this.value;
                    if (!passwordPattern.test(password)) {
                        document.getElementById("passwordError").innerHTML = "Mật khẩu phải dài ít nhất 8 ký tự và bao gồm ít nhất một chữ cái, một số và một ký tự đặc biệt.";
                    } else {
                        document.getElementById("passwordError").innerHTML = "";
                    }
                };

                document.getElementById("re_pass").oninput = function () {
                    var password = document.getElementById("pass").value;
                    var re_password = this.value;
                    if (password !== re_password) {
                        document.getElementById("rePasswordError").innerHTML = "Mật khẩu không khớp.";
                    } else {
                        document.getElementById("rePasswordError").innerHTML = "";
                    }
                };
            });

            function validateForm() {
                var isValid = true;

                var name = document.getElementById("name").value;
                var username = document.getElementById("username").value;
                var email = document.getElementById("email").value;
                var address = document.getElementById("address").value;
                var mobile = document.getElementById("mobile").value;
                var password = document.getElementById("pass").value;
                var re_password = document.getElementById("re_pass").value;

                var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                var mobilePattern = /^(?:\+84|0)(3|5|7|8|9)[0-9]{8}$/;
                var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

                name = name.trim().replace(/\s+/g, ' ');
                document.getElementById("name").value = name;

                if (name === "" || /^\s/.test(name)) {
                    document.getElementById("nameError").innerHTML = "Tên đầy đủ không được bắt đầu bằng dấu cách và không được để trống.";
                    isValid = false;
                }
                if (address === "" || /^\s/.test(address)) {
                    document.getElementById("addressError").innerHTML = "Địa chỉ không được bắt đầu bằng dấu cách và không được để trống.";
                    isValid = false;
                }
                if (/\s/.test(username)) {
                    document.getElementById("usernameError").innerHTML = "Tên người dùng không được chứa khoảng trắng.";
                    isValid = false;
                }
                if (!emailPattern.test(email)) {
                    document.getElementById("emailError").innerHTML = "Vui lòng nhập địa chỉ email hợp lệ.";
                    isValid = false;
                } else {
                    document.getElementById("emailError").innerHTML = "";
                }

                if (!mobilePattern.test(mobile)) {
                    document.getElementById("mobileError").innerHTML = "Vui lòng nhập số điện thoại di động Việt Nam hợp lệ.";
                    isValid = false;
                } else {
                    document.getElementById("mobileError").innerHTML = "";
                }

                if (!passwordPattern.test(password)) {
                    document.getElementById("passwordError").innerHTML = "Mật khẩu phải dài ít nhất 8 ký tự và bao gồm ít nhất một chữ cái, một số và một ký tự đặc biệt.";
                    isValid = false;
                } else {
                    document.getElementById("passwordError").innerHTML = "";
                }
                return isValid;
            }
        </script>

    </head>
    <body>
        <div class="main">
            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Đăng ký</h2>

                            <form action="register" method="POST" class="register-form" id="register-form" onsubmit="return validateForm()">
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="name" id="name" placeholder="Họ và tên" required/>
                                    <span id="nameError" style="color: red;"></span>
                                </div>

                                <div class="form-group">
                                    <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="username" id="username" placeholder="Tên người dùng" required/>
                                    <span id="usernameError" style="color: red;"></span>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Email" required/>
                                    <span id="emailError" style="color: red;"></span>
                                </div>
                                <div class="form-group">
                                    <label for="address"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="address" id="address" placeholder="Địa chỉ" required/>
                                    <span id="addressError" style="color: red;"></span>
                                </div>
                                <div class="form-group">
                                    <label for="mobile"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="mobile" id="mobile" placeholder="Số điện thoại" required/>
                                    <span id="mobileError" style="color: red;"></span>
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="pass" placeholder="Mật khẩu" required/>
                                    <span id="passwordError" style="color: red;"></span>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="re_password" id="re_pass" placeholder="Nhắc lại mật khẩu" required/>
                                    <span id="rePasswordError" style="color: red;"></span>
                                </div>
                                <!--                                <div class="form-group">
                                                                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required />
                                                                    <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in <a href="#" class="term-service">Terms of service</a></label>
                                                                </div>-->
                                <c:if test="${not empty emailError}">
                                    <div class="error-message" style="color: red; margin-bottom: 10px;">
                                        ${emailError}
                                    </div>
                                </c:if>
                                <c:if test="${not empty mobileError}">
                                    <div class="error-message" style="color: red; margin-bottom: 10px;">
                                        ${mobileError}
                                    </div>
                                </c:if>
                                <c:if test="${not empty passwordError}">
                                    <div class="error-message" style="color: red; margin-bottom: 10px;">
                                        ${passwordError}
                                    </div>
                                </c:if>
                                <c:if test="${not empty usernameError}">
                                    <div class="error-message" style="color: red; margin-bottom: 10px;">
                                        ${usernameError}
                                    </div>
                                </c:if>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Đăng ký"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="ViewUser/img/authen/logo1.png" alt="sing up image"></figure>
                            <a href="login" class="signup-image-link">Tôi đã có tài khoản</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script src="ViewUser/vendor/jquery/jquery.min.js"></script>
        <script src="ViewUser/js/authen/main.js"></script>
    </body>
</html>
