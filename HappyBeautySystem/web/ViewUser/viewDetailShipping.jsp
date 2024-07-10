<%@page import="dal.ProductDAO"%>
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
        <style>
            .form-group {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px; /* Khoảng cách từ phần tử trên cùng xuống form */
            }

            .form-group > div {
                text-align: left; /* Căn chỉnh nội dung văn bản sang trái */
                max-width: 600px; /* Độ rộng tối đa của phần tử */
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            .form-group p {
                margin-bottom: 10px; /* Khoảng cách giữa các đoạn văn bản */
            }

            .form-group strong {
                color: seagreen; /* Màu xanh lá cây cho văn bản in đậm */
            }
        </style>




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


        <!-- Success Message Section Begin -->
        <!-- Success Message Section Begin -->
        <div class="container status-container">
            <h2>Danh Sách Đơn Nhiệm Vụ Của Shipper</h2>
            <p>Mọi nhiệm vụ của ship được giao tại đây</p>
            <a href="/HappyBeautySystem/managerShipper?service=ListTask&option=2" class="btn btn-success">Đơn được giao</a>
            <a href="/HappyBeautySystem/managerShipper?service=ListTask&option=3" class="btn btn-danger">Đơn nhận giao</a>
            <a href="/HappyBeautySystem/managerShipper?service=ListTask&option=4" class="btn btn-info">Hoàn thành</a>
            <a href="/HappyBeautySystem/managerShipper?service=ListTask&option=5" class="btn btn-warning">Giao lại</a>
            <a href="/HappyBeautySystem/managerShipper?service=ListTask&option=6" class="btn btn-danger">Bị bom</a>
        </div>
        <!--        hh-->
        <!-- Order List Section Begin -->
        <div class="container">
            <div class="form-group text-center  ">
                <div class="d-flex justify-content-center align-items-center">

                    <div>
                        <h2><font color="red">CHI TIẾT -  YÊU CẦU</h2>
                        <p>Tên khách hàng : <strong>${customerInfor.name}</strong></p>
                        <p>Địa chỉ : <strong>${requestScope.informationOrder.getCustomerAddress()}  </strong></p>
                        <p>Số điện thoại :  <strong>${customerInfor.mobile}</strong></p>
                        <p>Yêu cầu của khách hàng :  <strong> ${requestScope.inforOrderDetail.getNote()}</strong></p>
                        <p>Thời gian hẹn nhận : <strong> Từ ${requestScope.inforOrderDetail.getFrom()} đến ${requestScope.inforOrderDetail.getTo()} </strong></p>
                        <p>Ngày hẹn nhận : <strong>${requestScope.inforOrderDetail.getDateOrder()}  </strong></p>
                    </div>
                </div>
            </div>

            <table class="order-list">
                <thead>
                    <tr >
                        <th class="text-center">Tên sản phẩm</th>
                        <th class="text-center">Số lượng</th>
                        <th class="text-center">Tổng tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ProductDAO dao = new ProductDAO();
                        List<OrderDetail> listOrderDetail = (List<OrderDetail>) request.getAttribute("listDetail");
                        double granTotal = 0;
                        if (listOrderDetail != null && !listOrderDetail.isEmpty()) {
                            for (OrderDetail orderDetail : listOrderDetail) {
                                Product product = dao.getProductById(orderDetail.getProductID());
                                String productName = (product != null) ? product.getProductName() : "Product not found";
                    %>
                    <tr>
                        <td class="text-center"><%= productName%></td>
                        <td class="text-center"><%= orderDetail.getQuantity()%></td>
                        <td class="text-center"><%= String.format("%.2f", orderDetail.getPrice() * orderDetail.getQuantity())%></td>

                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="3" class="text-center">Không có thông tin ở đây</td>
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
            <!--            <button type="button" class="btn btn-primary" onclick="window.location.href = '#'">Xác nhận đơn hàng </button>-->

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
        <script>
                                        function formatTime(time) {
                                            if (time && time.length > 8) { // Assuming time format HH:mm:ss.SSSSSSS
                                                return time.substring(0, 8); // Extracts HH:mm:ss
                                            }
                                            return time;
                                        }

                                        // Lấy giá trị thời gian từ phần tử input
                                        var noteValue = document.getElementById('note').value;

                                        // Loại bỏ millisecond từ giá trị thời gian
                                        var formattedNote = noteValue.replace(/(\d{2}:\d{2}:\d{2})\.\d{7}/g, '$1');

                                        // Gán giá trị đã xử lý vào phần tử input
                                        document.getElementById('note').value = formattedNote;
        </script>

    </body>

</html>
