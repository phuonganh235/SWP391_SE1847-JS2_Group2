<%@page import="dal.ProductDAO"%>
<%@page import="model.OrderDetail"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
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
            <h2>Thông tin chi tiết đơn hàng của bạn</h2>
            <p>Thông tin đầy đủ về đơn hàng</p>
            <a href="/HappyBeautySystem/ManagerOrder?service=managerOrder&option=1" class="btn btn-success">Đã đặt hàng</a>
            <a href="/HappyBeautySystem/ManagerOrder?service=managerOrder&option=2" class="btn btn-danger">Đã xác nhận</a>
            <a href="/HappyBeautySystem/ManagerOrder?service=managerOrder&option=3" class="btn btn-info">Đang vận chuyển</a>
            <a href="/HappyBeautySystem/ManagerOrder?service=managerOrder&option=4" class="btn btn-warning">Hoàn thành</a>
        </div>
        <!--        hh-->
        <!-- Order List Section Begin -->
        <div class="container">
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
                        <td class="text-center"><%= orderDetail.getPrice() * orderDetail.getQuantity()%></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="3" class="text-center">Không có thông tin</td>
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
        </div>
        <!-- Order List Section End -->
        <!-- Footer Section Begin -->
        <footer class="footer">
            <jsp:include page="footer.jsp"/>
        </footer>
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
