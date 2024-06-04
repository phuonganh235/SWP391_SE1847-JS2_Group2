

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    String check = (String) request.getAttribute("check");
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
    </head>
    <body>
        <div class="main">
            <!-- Sing in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content"> 

                        <div class="signin-image">
                            <figure><img src="ViewUser/img/authen/logo1.png" alt="sing up image"></figure>

                            <a href="home" class="signup-image-link">Back home</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Login</h2>
                            <form action="login" method="post" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="username">
                                        <i class="zmdi zmdi-account material-icons-name"></i>
                                        <span>Username</span>
                                    </label>
                                    <input type="text" name="username" id="username" placeholder="UserName"/>
                                </div>
                                <div class="form-group">
                                    <label for="password">
                                        <i class="zmdi zmdi-lock"></i>
                                        <span>Password</span>
                                    </label>
                                    <input type="password" name="password" id="password" placeholder="**********"/>
                                </div>
                                <input type="hidden" name="service" value="login">

                                <div class="form-group">
                                    <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                    <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                                </div>
                                <c:choose>
                                    <c:when test="${check.equals('success')}">
                                        ${'Success'}
                                        <c:redirect url="home"/>
                                        <br />
                                    </c:when>
                                    <c:when test="${check.equals('fail')}">
                                        ${'<span class="badge badge-danger">Invalid Username or Password</span> <br/>'}
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
                                    <!--                                    <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                                                        <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>-->
                                    <li><a href="#" ><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script src="ViewUser/vendor/jquery/jquery.min.js"></script>
        <script src="ViewUser/js/authen/main.js"></script>
    </body>
</html>
