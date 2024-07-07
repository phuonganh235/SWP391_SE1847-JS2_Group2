<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    String check = (String) request.getAttribute("check");
    Cookie[] cookies = request.getCookies();
    String rememberedUsername = "";
    String rememberedPassword = "";
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("username".equals(cookie.getName())) {
                rememberedUsername = cookie.getValue();
            }
            if ("password".equals(cookie.getName())) {
                rememberedPassword = cookie.getValue();
            }
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login</title>
        <!-- Font Icon -->
        <link rel="stylesheet" href="ViewUser/fonts/authen/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="ViewUser/css/authen/style.css">
        <style>
            .error-message {
                color: red;
                font-size: 0.9em;
                margin-top: 5px;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <!-- Sign in Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">

                        <div class="signin-image">
                            <figure><img src="ViewUser/img/authen/logo1.png" alt="sign up image"></figure>
                            <a href="home" class="signup-image-link">Back home</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Login</h2>
                            <form action="login" method="post" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="username">
                                        <i class="zmdi zmdi-account material-icons-name"></i>
                                    </label>
                                    <input type="text" name="username" id="username" placeholder="UserName" value="<%= rememberedUsername%>"/>
                                    <div id="usernameError" class="error-message"></div>
                                </div>
                                <div class="form-group">
                                    <label for="password">
                                        <i class="zmdi zmdi-lock"></i>
                                    </label>
                                    <input type="password" name="password" id="password" placeholder="**********" value="<%= rememberedPassword%>"/>
                                    <div id="passwordError" class="error-message"></div>
                                </div>
                                <input type="hidden" name="service" value="login">

                                <div class="form-group">
                                    <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" <%= !rememberedUsername.isEmpty() ? "checked" : ""%> />
                                    <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                                </div>
                                <c:choose>
                                    <c:when test="${check.equals('success')}">
                                        <c:redirect url="home"/>
                                        <br />
                                    </c:when>
                                    <c:when test="${check.equals('fail')}">
                                        <span class="error-message">Invalid Username or Password</span>
                                        <br/>
                                    </c:when>
                                    <c:otherwise>
                                        <br />
                                    </c:otherwise>
                                </c:choose>
                                <div class="form-group form-button">
                                    <input type="submit" name="submit" id="login" class="form-submit" value="Log in"/>
                                    <a href="register" style="margin-top: 20px" class="signup-image-link">Create an account</a>
                                    <a href="forgotpass" style="margin-top: 20px" class="signup-image-link">Forgot Password</a>
                                </div>
                            </form>
                            <div class="social-login">
                                <span class="social-label">Or login with</span>
                                <ul class="socials">
                                    <li><a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/HappyBeautySystem/LoginGoogle&response_type=code&client_id=476100370923-o65hi8ub2g7m0nn9iqkk4gguhv1h80nk.apps.googleusercontent.com&approval_prompt=force"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script src="ViewUser/vendor/jquery/jquery.min.js"></script>
        <script src="ViewUser/js/authen/main.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var usernameInput = document.getElementById("username");
                var passwordInput = document.getElementById("password");

                var usernameError = document.getElementById("usernameError");
                var passwordError = document.getElementById("passwordError");

                function validateUsername() {
                    var username = usernameInput.value.trim();
                    if (username === "") {
                        usernameError.textContent = "Username must not be empty.";
                        return false;
                    } else if (username.length < 3 || username.length > 20) {
                        usernameError.textContent = "Username must be between 3 and 20 characters.";
                        return false;
                    } else {
                        usernameError.textContent = "";
                        return true;
                    }
                }

                function validatePassword() {
                    var password = passwordInput.value;
                    if (password === "") {
                        passwordError.textContent = "Password must not be empty.";
                        return false;
                    } else if (password.length < 8) {
                        passwordError.textContent = "Password must be at least 8 characters.";
                        return false;
                    } else {
                        passwordError.textContent = "";
                        return true;
                    }
                }

                usernameInput.addEventListener("input", validateUsername);
                passwordInput.addEventListener("input", validatePassword);

                var form = document.getElementById("login-form");
                form.addEventListener("submit", function (event) {
                    var isUsernameValid = validateUsername();
                    var isPasswordValid = validatePassword();

                    if (!isUsernameValid || !isPasswordValid) {
                        event.preventDefault();
                    }
                });
            });
        </script>
    </body>
</html>
