
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Product"%>
<%@page import="model.OrderDetail"%>
<%@page import="java.util.List"%>
<%@page import="dal.ProductDAO"%>
<%@page import="dal.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Khởi tạo DecimalFormat với định dạng hai chữ số thập phân
    DecimalFormat df = new DecimalFormat("#.00");
%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Manage Product - Bootstrap Admin Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="ViewAdmin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="ViewAdmin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="ViewAdmin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="../ViewAdmin/css/style.css" rel="stylesheet">

        <link href="ViewAdmin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../ViewAdmin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../ViewAdmin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="../ViewAdmin/css/style.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">

            <!-- Sidebar Start -->
            <jsp:include page="sidebar.jsp"/>
            <!-- Sidebar End -->

            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                    <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                    </a>
                    <a href="#" class="sidebar-toggler flex-shrink-0">
                        <i class="fa fa-bars"></i>
                    </a>
                    <form class="d-none d-md-flex ms-4" action="manager?service=search" method="post">
                        <input type="hidden" name="service" value="search">
                        <input class="form-control border-0" type="search" placeholder="Search" name="txt">
                        <button type="submit" class="btn btn-primary ms-2">Search</button>
                    </form>
                    <div class="navbar-nav align-items-center ms-auto">
                        <!-- Message Dropdown -->
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-envelope me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Message</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <!-- Message Items -->
                            </div>
                        </div>
                        <!-- Notification Dropdown -->
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-bell me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Notification</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <!-- Notification Items -->
                            </div>
                        </div>
                        <!-- User Dropdown -->
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex">John Doe</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">My Profile</a>
                                <a href="#" class="dropdown-item">Settings</a>
                                <a href="#" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->

                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Trang chi tiết đơn hàng của khách hàng</h6>
                        </div>

                        <!-- Order Confirmation Form -->
                        <form action="managerOrder?service=confirm" method="post">

                            <div class="bg-white rounded p-4 mb-4">
                                <h6 class="mb-3">Thông tin khách hàng</h6>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="customerName">Họ và Tên</label>
                                            <input type="text" id="customerName" name="customerName" class="form-control" value="${requestScope.customerInfor.name}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="customerAddress">Địa chỉ</label>
                                            <input type="text" id="customerAddress" name="customerAddress" class="form-control" value="${requestScope.customerInfor.address}" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="customerPhoneNumber">Số điện thoại</label>
                                            <input type="text" id="customerPhoneNumber" name="customerPhoneNumber" class="form-control" value="${requestScope.customerInfor.mobile}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="orderDate">Ngày mua</label>
                                            <input type="text" id="orderDate" name="orderDate" class="form-control" value="${requestScope.customerInfor.createDate}" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="deliveryPerson">Chọn người giao hàng</label>
                                    <select id="deliveryPerson" name="ShipperID" class="form-control">
                                        <c:forEach items="${listShipper}" var="user">
                                            <option value="${user.userId}">${user.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <!-- Load Product -->
                            <div class="table-responsive">

                                <table class="table text-start align-middle table-bordered table-hover mb-0">
                                    <thead>
                                        <tr class="text-dark">
                                            <th scope="col" class="text-center">Tên sản phẩm</th>
                                            <th scope="col" class="text-center">Số lượng</th>
                                            <th scope="col" class="text-center">Tổng giá</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ProductDAO dao = new ProductDAO();
                                            List<OrderDetail> listOrderDetail = (List<OrderDetail>) request.getAttribute("listOrderDetail");
                                            double granTotal = 0;
                                            if (listOrderDetail != null && !listOrderDetail.isEmpty()) {
                                        %>

                                    <input type="hidden" name="OrderID" value="<%= listOrderDetail.get(0).getOrderID()%>" /> 

                                    <%
                                        for (OrderDetail orderDetail : listOrderDetail) {
                                            Product product = dao.getProductById(orderDetail.getProductID());
                                    %>
                                    <tr>
                                        <td class="text-center"><%= product.getProductName()%></td>
                                        <td class="text-center"><%= orderDetail.getQuantity()%></td>
                                        <td class="text-center"><%= df.format(orderDetail.getPrice() * orderDetail.getQuantity())%></td>

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

                            <!-- Submit Button -->
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-primary">Xác Nhận</button>
                            </div>
                        </form>
                    </div>
                </div>


            </div>
        </div>
        <!-- Product Management End -->

    </div>
    <!-- Content End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="ViewAdmin/lib/chart/chart.min.js"></script>
<script src="ViewAdmin/lib/easing/easing.min.js"></script>
<script src="ViewAdmin/lib/waypoints/waypoints.min.js"></script>
<script src="ViewAdmin/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="ViewAdmin/lib/tempusdominus/js/moment.min.js"></script>
<script src="ViewAdmin/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="ViewAdmin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="ViewAdmin/js/main.js"></script>

</body>

</html>
