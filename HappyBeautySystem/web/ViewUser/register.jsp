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
                    name = name.trim().replace(/\s+/g, ' '); // Loại bỏ dấu cách thừa và thay thế bằng một dấu cách duy nhất giữa các từ
                    return name;
                }




                document.getElementById("name").oninput = function () {
                    var name = this.value; // Không cần loại bỏ dấu cách ở đây
                    this.value = name;
                    if (name === "") {
                        document.getElementById("nameError").innerHTML = "Full name must not be empty.";
                    } else if (/^\s/.test(name)) {
                        document.getElementById("nameError").innerHTML = "Full name should not start with a space.";
                    } else {
                        document.getElementById("nameError").innerHTML = "";
                    }
                };





                document.getElementById("username").oninput = function () {
                    var username = this.value;
                    if (/\s/.test(username)) {
                        document.getElementById("usernameError").innerHTML = "Username should not contain spaces.";
                    } else {
                        document.getElementById("usernameError").innerHTML = "";
                    }
                };

                document.getElementById("email").oninput = function () {
                    var email = this.value;
                    if (!emailPattern.test(email)) {
                        document.getElementById("emailError").innerHTML = "Please enter a valid email address.";
                    } else {
                        document.getElementById("emailError").innerHTML = "";
                    }
                };

                document.getElementById("mobile").oninput = function () {
                    var mobile = this.value;
                    if (!mobilePattern.test(mobile)) {
                        document.getElementById("mobileError").innerHTML = "Please enter a valid Vietnam mobile number.";
                    } else {
                        document.getElementById("mobileError").innerHTML = "";
                    }
                };

                document.getElementById("pass").oninput = function () {
                    var password = this.value;
                    if (!passwordPattern.test(password)) {
                        document.getElementById("passwordError").innerHTML = "Password must be at least 8 characters long and include at least one letter, one number, and one special character.";
                    } else {
                        document.getElementById("passwordError").innerHTML = "";
                    }
                };

                document.getElementById("re_pass").oninput = function () {
                    var password = document.getElementById("pass").value;
                    var re_password = this.value;
                    if (password !== re_password) {
                        document.getElementById("rePasswordError").innerHTML = "Passwords do not match.";
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
                var mobile = document.getElementById("mobile").value;
                var password = document.getElementById("pass").value;
                var re_password = document.getElementById("re_pass").value;

                var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                var mobilePattern = /^(?:\+84|0)(3|5|7|8|9)[0-9]{8}$/;
                var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

                name = name.trim().replace(/\s+/g, ' ');
                document.getElementById("name").value = name;

                if (name === "" || /^\s/.test(name)) {
                    document.getElementById("nameError").innerHTML = "Full name should not start with a space and must not be empty.";
                    isValid = false;
                }
                if (/\s/.test(username)) {
                    document.getElementById("usernameError").innerHTML = "Username should not contain spaces.";
                    isValid = false;
                }
                if (!emailPattern.test(email)) {
                    document.getElementById("emailError").innerHTML = "Please enter a valid email address.";
                    isValid = false;
                }
                if (!mobilePattern.test(mobile)) {
                    document.getElementById("mobileError").innerHTML = "Please enter a valid Vietnam mobile number.";
                    isValid = false;
                }
                if (!passwordPattern.test(password)) {
                    document.getElementById("passwordError").innerHTML = "Password must be at least 8 characters long and include at least one letter, one number, and one special character.";
                    isValid = false;
                }
                if (password !== re_password) {
                    document.getElementById("rePasswordError").innerHTML = "Passwords do not match.";
                    isValid = false;
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
                            <h2 class="form-title">Sign up</h2>

                            <form action="register" method="POST" class="register-form" id="register-form" onsubmit="return validateForm()">
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="name" id="name" placeholder="Full Name" required/>
                                    <span id="nameError" style="color: red;"></span>
                                </div>

                                <div class="form-group">
                                    <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="username" id="username" placeholder="UserName" required/>
                                    <span id="usernameError" style="color: red;"></span>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Your Email" required/>
                                    <span id="emailError" style="color: red;"></span>
                                </div>
                                <div class="form-group">
                                    <label for="address"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="address" id="address" placeholder="Address" required/>
                                    <span id="addressError" style="color: red;"></span>
                                </div>
                                <div class="form-group">
                                    <label for="mobile"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="mobile" id="mobile" placeholder="Mobile" required/>
                                    <span id="mobileError" style="color: red;"></span>
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="pass" placeholder="Password" required/>
                                    <span id="passwordError" style="color: red;"></span>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="re_password" id="re_pass" placeholder="Repeat your password" required/>
                                    <span id="rePasswordError" style="color: red;"></span>
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required />
                                    <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in <a href="#" class="term-service">Terms of service</a></label>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="ViewUser/img/authen/logo1.png" alt="sing up image"></figure>
                            <a href="login" class="signup-image-link">I am already member</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script src="ViewUser/vendor/jquery/jquery.min.js"></script>
        <script src="ViewUser/js/authen/main.js"></script>
    </body>
</html>
