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
        function validateForm() {
            var username = document.getElementById("username").value;
            var email = document.getElementById("email").value;
            var mobile = document.getElementById("mobile").value;
            var password = document.getElementById("pass").value;
            var re_password = document.getElementById("re_pass").value;
            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            var mobilePattern = /^(?:\+84|0)(3|5|7|8|9)[0-9]{8}$/;
            var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

            if (/\s/.test(username)) {
                alert("Username should not contain spaces.");
                return false;
            }
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }
            if (!mobilePattern.test(mobile)) {
                alert("Please enter a valid Vietnam mobile number.");
                return false;
            }
            if (!passwordPattern.test(password)) {
                alert("Password must be at least 8 characters long and include at least one letter, one number, and one special character.");
                return false;
            }
            if (password !== re_password) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
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
                        
                        <!-- Display error message -->
                        <c:if test="${not empty sessionScope.error}">
                            <div style="color: red; font-weight: bold;">
                                ${sessionScope.error}
                            </div>
                        </c:if>
                        
                        <form action="register" method="POST" class="register-form" id="register-form" onsubmit="return validateForm()">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Full Name" required/>
                            </div>
                            <div class="form-group">
                                <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="username" id="username" placeholder="UserName" required/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email" required/>
                            </div>
                            <div class="form-group">
                                <label for="address"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="address" id="address" placeholder="Address" required/>
                            </div>
                            <div class="form-group">
                                <label for="mobile"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="mobile" id="mobile" placeholder="Mobile" required/>
                            </div>
                            <div class="form-group">
                                <label for="postCode"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="postCode" id="postCode" placeholder="PostCode" required/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="pass" placeholder="Password" required/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_password" id="re_pass" placeholder="Repeat your password" required/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
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
