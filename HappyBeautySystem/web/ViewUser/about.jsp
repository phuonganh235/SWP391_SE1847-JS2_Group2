<%@ page import="model.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>About Us - HappyBeauty</title>

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
        <style>
            /* style.css */

            /* General body styling */
            body {
                font-family: 'Montserrat', sans-serif;
                color: #333;
                line-height: 1.6;
                background-color: #f8f9fa;
            }

            /* About Us Section */
            .about-us {
                padding: 80px 0;
                background: #fff;
            }

            .about-us h1 {
                font-size: 48px;
                font-weight: 800;
                color: #333;
                text-align: center;
                margin-bottom: 20px;
            }

            .about-us h2 {
                font-size: 24px;
                font-weight: 600;
                color: #555;
                text-align: center;
                margin-bottom: 40px;
            }

            .about-us__image img {
                width: 100%;
                border-radius: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .about-us__text h3 {
                font-size: 28px;
                font-weight: 700;
                color: #222;
                margin-bottom: 15px;
            }

            .about-us__text p {
                font-size: 16px;
                color: #666;
                line-height: 1.8;
                margin-bottom: 20px;
            }
        </style>
    </head>

    <body>

        <!-- Header Section Begin -->
        <jsp:include page="navbar.jsp" />
        <!-- Header Section End --> 

        <!-- About Us Section Begin -->
        <section class="about-us spad">
            <div class="container">
                <h1 style="text-align: center;">ABOUT US</h1>
                <h2 style="text-align: center; margin-bottom: 60px;">Welcome to HappyBeautySystem!</h2>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="about-us__image">
                            <img src="${about2.imageURL}" alt="About Us Image" style="width: 100%; border-radius: 20px;">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <c:forEach var="about" items="${about}">
                            <div class="about-us__text">
                                <h3>${about.title}</h3>
                                <p>${about.content}</p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <h2 style="text-align: center;">HappyBeautySystem – Your Beauty, Our Passion.</h2>
            </div>
        </section>
        <!-- About Us Section End -->

        <!-- Services Section Begin -->
        <section class="services spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-car"></i>
                            <h6>Free Shipping</h6>
                            <p>For all orders over $99</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-money"></i>
                            <h6>Money Back Guarantee</h6>
                            <p>If goods have problems</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-support"></i>
                            <h6>Online Support 24/7</h6>
                            <p>Dedicated support</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="services__item">
                            <i class="fa fa-headphones"></i>
                            <h6>Payment Secure</h6>
                            <p>100% secure payment</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp" />
        <!-- Footer Section End -->

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
    </body> 

</html>
