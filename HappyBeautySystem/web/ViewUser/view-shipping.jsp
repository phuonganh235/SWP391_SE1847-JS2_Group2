<%@page import="model.OrderDetail"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.OrderDetailDAO"%>
<%@ page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>HappyBeauty - Purchase Success</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <script
            src="https://kit.fontawesome.com/84a8258e0d.js"
            crossorigin="anonymous"
        ></script>

        <!-- Css Styles -->
        <link rel="stylesheet" href="ViewUser/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/style.css" type="text/css">
        <link href="ViewUser/css/style-order-successfull.css" rel="stylesheet" type="text/css"/>
        <link href="ViewUser/css/style-order-manager.css" rel="stylesheet" type="text/css"/>
        <link href="css/style-order-manager.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <jsp:include page="navbar.jsp"/>

        <!-- Success Message Section Begin -->
        <div class="container status-container">
            <h2>Manager Shipping</h2>
            <p>Page to manage your shipping tasks</p>
            <a href="/HappyBeautySystem/ManagerOrder?service=managerOrder&option=1" class="btn btn-success">Order Delivered</a>
            <a href="/HappyBeautySystem/ManagerOrder?service=managerOrder&option=2" class="btn btn-danger">Order Is Shipping</a>
            <a href="/HappyBeautySystem/ManagerOrder?service=managerOrder&option=3" class="btn btn-info">Shipping Completed</a>

        </div>
        <!--        hh-->
        <!-- Order List Section Begin -->
        <div class="container">
            <c:if test="${not empty op and op != '0'}">
                <table class="order-list">
                    <thead>
                        <tr >
                            <th class="text-center">Customer Name</th>
                            <th class="text-center">Phone Number</th>
                            <th class="text-center">Order Date</th>
                            <th class="text-center">Payment Method</th>
                            <th class="text-center">Delete</th>
                            <th class="text-center">Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Order> listOrder = (List<Order>) request.getAttribute("listOrder");
                            double granTotal = 0;
                            if (listOrder != null && !listOrder.isEmpty()) {
                                for (Order order : listOrder) {
                        %>
                        <tr>
                            <td class="text-center"><%= order.getCustomerName()%></td>
                            <td class="text-center"><%= order.getCustomerPhoneNumber()%></td>
                            <td class="text-center"><%= order.getOrderDate()%></td>
                            <td class="text-center">
                                <%
                                    int paymentId = order.getPaymentId();
                                    String paymentMethod = "";
                                    if (paymentId == 1) {
                                        paymentMethod = "Momo";
                                    } else if (paymentId == 2) {
                                        paymentMethod = "VNpay";
                                    } else {
                                        paymentMethod = "COD"; // Trường hợp phương thức thanh toán không xác định
                                    }
                                %>
                                <%= paymentMethod%>
                            </td>
                            <td class="text-center">
                                <%
                                    int status = order.getStatuss(); // Giả sử rằng thuộc tính status là một phần của đối tượng Order
                                    if (status == 1) {
                                %>
                                <!--                            Delete-->
                                <a href="/HappyBeautySystem/ManagerOrder?service=delete&orderid=<%= order.getOrderId()%>"><i class="fa-solid fa-trash fs-1"></i></a>
                                    <%
                                        }
                                    %>
                            </td>
                            <!--                        Detail-->
                            <td class="text-center"><a href="/HappyBeautySystem/ManagerOrder?service=orderDetail&orderid=<%= order.getOrderId()%>"><i class="fa fa-eye" aria-hidden="true"></i></a></td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="6" class="text-center">Your list is empty</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </c:if>
        </div>
        <!-- Order List Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-7">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="./index.html"><img src="img/logo.png" alt=""></a>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                cilisis.</p>
                            <div class="footer__payment">
                                <a href="#"><img src="img/payment/payment-1.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-2.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-3.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-4.png" alt=""></a>
                                <a href="#"><img src="img/payment/payment-5.png" alt=""></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-5">
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
                    <div class="col-lg-2 col-md-3 col-sm-4">
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
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <div class="footer__copyright__text">
                            <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                        </div>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->


        <!-- Search End -->

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
