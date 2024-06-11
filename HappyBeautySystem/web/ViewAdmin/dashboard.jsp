<%-- 
    Document   : dashboard
    Created on : 10 Jun 2024, 23:05:52
    Author     : phthh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Bootstrap Admin Template</title>
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
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            .chart-explanation {
                font-size: 16px;
                color: #333;
                margin-bottom: 20px;
                padding: 10px;
                border-left: 4px solid #007bff;
                background-color: #f8f9fa;
                border-radius: 4px;
            }
        </style>
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
                    <form class="d-none d-md-flex ms-4">
                        <input class="form-control border-0" type="search" placeholder="Search">
                    </form>
                    <div class="navbar-nav align-items-center ms-auto">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-envelope me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Message</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item text-center">See all message</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-bell me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Notificatin</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Profile updated</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">New user added</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Password changed</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item text-center">See all notifications</a>
                            </div>
                        </div>
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

                <!-- Product & Order Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-md-6 col-sm-6 col-xl-6">
                            <div class="bg-success rounded d-flex align-items-center p-3">
                                 <i class="fa fa-users fa-3x text-white"></i>
                                <div class="ms-3" style="text-align: left">
                                    <h5 class="mb-3"><a href="#" style="color: aquamarine">Total Customers</a></h5>
                                    <h6 class="mb-0" style="color: white"><b>${requestScope.user} Customers</b></h6>
                                    <span style="color: aquamarine; font-size: 12px">Total number of managed customers.</span>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xl-6">
                            <div class="bg-primary rounded d-flex align-items-center p-3">
                                <i class="fa fa-database fa-3x text-white"></i>
                                <div class="ms-3" style="text-align: left">
                                    <h5 class="mb-3"><a href="manager" style="color: #e6f5ff">Total Products</a></h5>
                                    <h6 class="mb-0" style="color: white"><b>${requestScope.product} Products</b></h6>
                                    <span style="color: #e6f5ff; font-size: 12px">Total number of products managed.</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xl-6">
                            <div class="bg-warning rounded d-flex align-items-center p-3">
                                <i class="fa fa-shopping-bag fa-3x text-white"></i>
                                <div class="ms-3" style="text-align: left">
                                    <h5 class="mb-3" style="color: #fcf8e3">Total Orders</h5>
                                    <h6 class="mb-0" style="color: white"><b>${requestScope.user} Orders</b></h6>
                                    <span style="color: #fcf8e3; font-size: 12px">Total number of sales invoices for the month.</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xl-">
                            <div class="bg-danger rounded d-flex align-items-center p-3">
                                <i class="fa fa-exclamation-triangle fa-3x text-white"></i>
                                <div class="ms-3" style="text-align: left">
                                    <h5 class="mb-3" style="color: #f5c6cb">Low in stock</h5>
                                    <h6 class="mb-0" style="color: white"><b>${requestScope.user} Products</b></h6>
                                    <span style="color: #f5c6cb; font-size: 12px">The warning number of products is out of stock and needs to be added.</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Product & Order End -->


                <!-- Sales Chart Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Worldwide Sales</h6>
                                    <a href="">Show All</a>
                                </div>
                                <canvas id="worldwide-sales"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Salse & Revenue</h6>
                                    <a href="">Show All</a>
                                </div>
                                <canvas id="salse-revenue"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sales Chart End -->

                <!-- Recent Sales Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Order today</h6>
                            <a href="manageProduct.jsp">Show All</a>
                        </div>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                        <th scope="col">ID Order</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Phone Number</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Order Date</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">View</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input class="form-check-input" type="checkbox"></td>
                                        <td>01 Jan 2045</td>
                                        <td>INV-0123</td>
                                        <td>Jhon Doe</td>
                                        <td>$123</td>
                                        <td>Paid</td>
                                        <td></td>
                                        <td></td>
                                        <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td><input class="form-check-input" type="checkbox"></td>
                                        <td>01 Jan 2045</td>
                                        <td>INV-0123</td>
                                        <td>Jhon Doe</td>
                                        <td>$123</td>
                                        <td>Paid</td>
                                        <td></td>
                                        <td></td>
                                        <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Recent Sales End -->

                <!-- Widgets Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-md-6 col-xl-4">
                            <div class="h-100 bg-light rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-2">
                                    <h6 class="mb-0">Messages</h6>
                                    <a href="">Show All</a>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-3">
                                    <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h6 class="mb-0">Jhon Doe</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                        <span>Short message goes here...</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-3">
                                    <img class="rounded-circle flex-shrink-0" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h6 class="mb-0">Jhon Doe</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                        <span>Short message goes here...</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-3">
                                    <img class="rounded-circle flex-shrink-0" src="ViewAdmin/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h6 class="mb-0">Jhon Doe</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                        <span>Short message goes here...</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center pt-3">
                                    <img class="rounded-circle flex-shrink-0" src="ViewAdmin/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h6 class="mb-0">Jhon Doe</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                        <span>Short message goes here...</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6 col-xl-4">
                            <div class="h-100 bg-light rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Calender</h6>
                                    <a href="">Show All</a>
                                </div>
                                <div id="calender"></div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6 col-xl-4">
                            <div class="h-100 bg-light rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">To Do List</h6>
                                    <a href="">Show All</a>
                                </div>
                                <div class="d-flex mb-2">
                                    <input class="form-control bg-transparent" type="text" placeholder="Enter task">
                                    <button type="button" class="btn btn-primary ms-2">Add</button>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-2">
                                    <input class="form-check-input m-0" type="checkbox">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span>Short task goes here...</span>
                                            <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-2">
                                    <input class="form-check-input m-0" type="checkbox">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span>Short task goes here...</span>
                                            <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-2">
                                    <input class="form-check-input m-0" type="checkbox" checked>
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span><del>Short task goes here...</del></span>
                                            <button class="btn btn-sm text-primary"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-2">
                                    <input class="form-check-input m-0" type="checkbox">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span>Short task goes here...</span>
                                            <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center pt-2">
                                    <input class="form-check-input m-0" type="checkbox">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span>Short task goes here...</span>
                                            <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Widgets End -->


                <!-- Footer Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light rounded-top p-4">
                        <div class="row">
                            <div class="col-12 col-sm-6 text-center text-sm-start">
                                <a href="#">HappyBeauty</a>
                            </div>
                            <div class="col-12 col-sm-6 text-center text-sm-end">
                                Designed By Group 2
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer End -->
            </div>
            <!-- Content End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

    </body>

</html>

