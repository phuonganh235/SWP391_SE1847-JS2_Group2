<%@page import="model.OrderDetail"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dal.OrderDetailDAO"%>
<%@page import="model.NoteShip"%>

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
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/84a8258e0d.js" crossorigin="anonymous"></script>

        <!-- Custom CSS -->
        <style>
            .btn-action {
                margin-right: 10px; /* Spacing between buttons */
                margin-bottom: 5px; /* Vertical spacing between buttons */
            }

            .btn-action:hover {
                opacity: 0.8; /* Hover effect */
            }

            .btn-container {
                display: flex; /* Sử dụng flexbox để căn chỉnh các nút */
                flex-direction: column; /* Xếp các nút theo chiều dọc */
                align-items: flex-start; /* Căn nút về phía trái */
            }

            .status-container {
                margin-bottom: 20px; /* Bottom margin for container */
            }
            .design-button{
                min-width: 120px; /* Độ rộng tối thiểu của container */
                margin: 4px;
            }
            .content{
                margin-left: 380px;
            }

            .logout-button {
                position: absolute;
                top: 20px;
                right: 20px;
                padding: 10px 20px;
                background-color: red;
                color: #fff;
                border: none;
                border-radius: 15px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-right: 500px;
            }

            .logout-button:hover {
                background-color: #e84118;
            }
        </style>

        <!-- External CSS -->
        <link rel="stylesheet" href="ViewUser/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/style.css" type="text/css">
        <link href="ViewUser/css/style-order-successfull.css" rel="stylesheet" type="text/css" />
        <link href="ViewUser/css/style-order-manager.css" rel="stylesheet" type="text/css" />
        <link href="css/style-order-manager.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <!-- Logout Button -->
        <div class="logout-button" onclick="window.location.href = '/HappyBeautySystem/logoutForShipper'">
            Đăng xuất tài khoản
        </div>
        <!-- Success Message Section Begin -->
        <div class="container status-container">
            <h2>Danh Sách Nhiệm Vụ Của : <strong style="color:black">${sessionScope.inforUserLogin.name}</strong></h2>
            <p>Mọi nhiệm vụ của <strong>${sessionScope.inforUserLogin.name}</strong> được giao tại đây</p>
            <a href="/HappyBeautySystem/managerShipper?service=ListTask&option=2" class="btn btn-success">Đơn được giao</a>
            <a href="/HappyBeautySystem/managerShipper?service=ListTask&option=3" class="btn btn-danger">Đơn nhận giao</a>
            <a href="/HappyBeautySystem/managerShipper?service=ListTask&option=4" class="btn btn-info">Hoàn thành</a>
            <a href="/HappyBeautySystem/managerShipper?service=ListTask&option=5" class="btn btn-warning">Giao lại</a>
            <a href="/HappyBeautySystem/managerShipper?service=ListTask&option=6" class="btn btn-danger">Bị bom</a>
        </div>

        <!-- Order List Section Begin -->
        <div class="container">
            <c:if test="${not empty op and op != '0'}">
                <table class="order-list">
                    <thead>
                        <tr>
                            <th class="text-center">Mã đơn hàng</th>
                            <th class="text-center">Tên khách</th>
                            <th class="text-center">SĐT</th>
                            <th class="text-center">Địa chỉ</th>
                            <th class="text-center">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${option == '2'}">
                            <h2 class="content"><strong>Các đơn được giao</strong></h2>
                        </c:when>
                        <c:when test="${option == '3'}">
                            <h2 class="content"><strong>Các đơn đã nhận</strong></h2>
                        </c:when>
                        <c:when test="${option == '4'}">
                            <h2 class="content"><strong>Các đơn hoàn thành</strong></h2>
                        </c:when>
                        <c:when test="${option == '5'}">
                            <h2 class="content"><strong>Các đơn hàng giao lại</strong></h2>
                        </c:when>
                        <c:when test="${option == '6'}">
                            <h2 class="content"><strong>Các đơn hàng bị bom </strong></h2>
                        </c:when>
                        <c:otherwise>
                            <h2 class="content">Trạng thái đơn hàng không xác định</h2>
                        </c:otherwise>
                    </c:choose>
                    <%
                        List<Order> listOrder = (List<Order>) request.getAttribute("listOrder");
                        List<NoteShip> listContent = (List<NoteShip>) request.getAttribute("noteShip");
                        int optionINT = Integer.parseInt(request.getParameter("option"));
                        int i = 0;

                        if (listOrder != null && !listOrder.isEmpty()) {
                            for (Order order : listOrder) {
                    %>
                    <tr>
                        <td class="text-center align-middle"><%= order.getOrderId()%></td>
                        <td class="text-center align-middle"><%= order.getCustomerName()%></td>
                        <td class="text-center align-middle"><%= order.getCustomerPhoneNumber()%></td>
                        <td class="text-center align-middle"><%= order.getCustomerAddress()%></td>
                        <td class="text-center">
                            <% if (optionINT == 2) {%>
                            <div class="btn-container">
                                <button type="button" class="btn btn-success  design-button" onclick="window.location.href = '/HappyBeautySystem/managerShipper?service=updateStatusOrder&orderID=<%= order.getOrderId()%>&status=3'">Xác nhận</button>
                                <button type="button" class="btn btn-info  design-button" onclick="window.location.href = '/HappyBeautySystem/managerShipper?service=detailOrderShipping&orderid=<%= order.getOrderId()%>'">Chi tiết</button>
                            </div>
                            <% } %>
                            <% if (optionINT == 3) {%>
                            <div class="btn-container">
                                <button type="button" class="btn btn-success design-button" onclick="window.location.href = '/HappyBeautySystem/managerShipper?service=doneOrder&orderID=<%= order.getOrderId()%>&status=4'">Thành công</button>
                                <button type="button" class="btn btn-confirmed design-button" onclick="window.location.href = '/HappyBeautySystem/managerShipper?service=shipAgain&orderid=<%= order.getOrderId()%>'">Giao lại</button>
                                <button type="button" class="btn btn-primary design-button" onclick="window.location.href = '/HappyBeautySystem/managerShipper?service=updateStatusOrder&orderID=<%= order.getOrderId()%>&status=6'">Bom hàng</button>  
                                <button type="button" class="btn btn-info design-button" onclick="window.location.href = '/HappyBeautySystem/managerShipper?service=detailOrderShipping&orderid=<%= order.getOrderId()%>'">Chi tiết</button>
                            </div>
                            <% } %>
                            <% if (optionINT == 4) {%>
                            <div class="btn-container">
                                <button type="button" class="btn btn-primary" onclick="window.location.href = '/HappyBeautySystem/managerShipper?service=detailOrderShipping&orderid=<%= order.getOrderId()%>'">Chi tiết</button>
                            </div>
                            <% } %>
                            <% if (optionINT == 5) {%>
                            <div class="btn-container">
                                <button type="button" class="btn btn-primary design-button" onclick="window.location.href = '/HappyBeautySystem/managerShipper?service=updateStatusOrder&orderID=<%= order.getOrderId()%>&status=3'">Đi giao</button> 
                                <button type="button" class="btn btn-primary design-button" onclick="window.location.href = '/HappyBeautySystem/managerShipper?service=detailOrderShipping&orderid=<%= order.getOrderId()%>'">Chi tiết</button>
                            </div>
                            <% } %>
                            <% if (optionINT == 6) {%>
                            <div class="btn-container">
                                <button type="button" class="btn btn-primary" onclick="window.location.href = '/HappyBeautySystem/managerShipper?service=detailOrderShipping&orderid=<%= order.getOrderId()%>'">Chi tiết</button>
                            </div>
                            <% } %>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6" class="text-center">Không có đơn hàng nào ở đây</td>
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
