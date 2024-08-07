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
        <jsp:include page="footer.jsp"/>
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
