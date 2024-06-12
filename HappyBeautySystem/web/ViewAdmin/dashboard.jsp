
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
        <link href="ViewAdmin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="ViewAdmin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="ViewAdmin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="ViewAdmin/css/style.css" rel="stylesheet">
        <style>
            .container-fluid {
                padding-top: 40px;
                padding-left: 15px;
                padding-right: 15px;
            }

            /* Card styling */
            .bg-success, .bg-primary, .bg-warning, .bg-danger {
                border-radius: 15px;
                padding: 20px;
                display: flex;
                align-items: center;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.2s, box-shadow 0.2s;
            }

            .bg-success:hover, .bg-primary:hover, .bg-warning:hover, .bg-danger:hover {
                transform: scale(1.045);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            }

            /* Icon styling */
            .bg-success i, .bg-primary i, .bg-warning i, .bg-danger i {
                font-size: 2.5rem;
                width: 90px;
                height: 90px;
                line-height: 79px;
                text-align: center;
                border-radius: 50%;
                border: 4px solid white; /* White circular border */
                transition: transform 0.3s, color 0.3s, box-shadow 0.3s;
            }

            .bg-success:hover i, .bg-primary:hover i, .bg-warning:hover i, .bg-danger:hover i {
                animation: pulse 1s infinite;
                color: #ffd700; /* Gold color for the spin effect */
            }
            /* Text styling */
            .bg-success .ms-3, .bg-primary .ms-3, .bg-warning .ms-3, .bg-danger .ms-3 {
                margin-left: 20px;
                text-align: left;
            }

            .bg-success h5, .bg-primary h5, .bg-warning h5, .bg-danger h5 {
                margin-bottom: 10px;
            }

            .bg-success h5 a, .bg-primary h5 a {
                color: aquamarine;
                text-decoration: none;
            }

            .bg-primary h5 a {
                color: #e6f5ff;
            }

            .bg-warning h5, .bg-danger h5 {
                color: #fcf8e3;
            }

            .bg-warning h5 {
                color: #fcf8e3;
            }

            .bg-danger h5 {
                color: #f5c6cb;
            }

            .bg-success h6, .bg-primary h6, .bg-warning h6, .bg-danger h6 {
                color: white;
                font-weight: bold;
            }

            .bg-success span, .bg-primary span, .bg-warning span, .bg-danger span {
                font-size: 12px;
                display: block;
            }

            .bg-success span {
                color: aquamarine;
            }

            .bg-primary span {
                color: #e6f5ff;
            }

            .bg-warning span {
                color: #fcf8e3;
            }

            .bg-danger span {
                color: #f5c6cb;
            }

            /* Responsive styling */
            @media (max-width: 767px) {
                .col-md-6, .col-sm-6, .col-xl-6 {
                    margin-bottom: 20px;
                }
            }

            /* CSS for enhancing Font Awesome icons with animations */
            .fa {
                transition: transform 0.3s ease, color 0.3s ease;
            }

            .fa:hover {
                transform: scale(1.2);
                color: #ffeb3b; /* Change color on hover, you can choose any color you like */
            }

            .fa-users, .fa-database, .fa-shopping-bag, .fa-exclamation-triangle {
                color: #ffffff;
            }

            @keyframes pulse {
                0% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(1.1);
                }
                100% {
                    transform: scale(1);
                }
            }

            /* Assign animations to the icons */
            .bg-success .fa-users:hover {
                animation: pulse 1s infinite;
            }

            .bg-primary .fa-database:hover {
                animation: pulse 1s infinite;
            }

            .bg-warning .fa-shopping-bag:hover {
                animation: pulse 1s infinite;
            }

            .bg-danger .fa-exclamation-triangle:hover {
                animation: pulse 1s infinite;
            }

            /* Optional: Add some shadow effects */
            .fa {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .fa:hover {
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
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
                    <div class="navbar-nav align-items-center ms-auto">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-envelope me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Message</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="ViewAdmin/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="ViewAdmin/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="ViewAdmin/img/user.jpg" alt="" style="width: 40px; height: 40px;">
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
                                <img class="rounded-circle me-lg-2" src="ViewAdmin/img/user.jpg" alt="" style="width: 40px; height: 40px;">
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
                                <a href=""><i class="fa fa-users fa-3x text-white"></i></a>
                                <div class="ms-3" style="text-align: left">
                                    <h5 class="mb-3"><a href="#" style="color: aquamarine">Total Customers</a></h5>
                                    <h6 class="mb-0" style="color: white"><b>${requestScope.user} Customers</b></h6>
                                    <span style="color: aquamarine; font-size: 12px">Total number of managed customers.</span>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xl-6">
                            <div class="bg-primary rounded d-flex align-items-center p-3">
                                <a href="manager"><i class="fa fa-database fa-3x text-white"></i></a>
                                <div class="ms-3" style="text-align: left">
                                    <h5 class="mb-3"><a href="manager" style="color: #e6f5ff">Total Products</a></h5>
                                    <h6 class="mb-0" style="color: white"><b>${requestScope.product} Products</b></h6>
                                    <span style="color: #e6f5ff; font-size: 12px">Total number of products managed.</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xl-6">
                            <div class="bg-warning rounded d-flex align-items-center p-3">
                                <a href=""><i class="fa fa-shopping-bag fa-3x text-white"></i></a>
                                <div class="ms-3" style="text-align: left">
                                    <h5 class="mb-3" style="color: #fcf8e3">Total Orders</h5>
                                    <h6 class="mb-0" style="color: white"><b>${requestScope.order} Orders</b></h6>
                                    <span style="color: #fcf8e3; font-size: 12px">Total number of sales invoices for the month.</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xl-6">
                            <div class="bg-danger rounded d-flex align-items-center p-3">
                                <a href="manager?service=low"><i class="fa fa-exclamation-triangle fa-3x text-white"></i></a>
                                <div class="ms-3" style="text-align: left">
                                    <h5 class="mb-3" style="color: #f5c6cb">Low in stock</h5>
                                    <h6 class="mb-0" style="color: white"><b>${requestScope.low} Products</b></h6>
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
                                    <h6 class="mb-0">Revenue Chart</h6>
                                    <a href="chart">Show more</a>
                                </div>
                                <canvas id="line-chart"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Quantity</h6>
                                    <a href="chart">Show more</a>
                                </div>
                                <canvas id="bar-chart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sales Chart End -->


                <!-- Order today Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0" style="color: #03A9F4; text-align: center">Order today</h6>
                            <a href="managerOrder?service=listAllOrder&status=1">Show All</a>
                        </div>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
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
                                    <%--<c:forEach items="${billbyday}" var="b">--%>
                                    <!--<tr>-->
                                        <!--<td>${b.getOrderId()}</td>-->
<!--                                            <td>${b.getCustomerName()}</td>
                                        <td>(+84)${b.getCustomerPhoneNumber()}</td>
                                        <td>${b.getCustomerAddress()}</td>
                                        <td>${b.getOrderDate()}</td>
                                        <td>giá</td>
                                        <td>${b.getStatuss()}</td>
                                        <td><a style=" color: rgb(245 157 57);background-color: rgb(251 226 197); padding: 5px;border-radius: 5px;" href="#"><i class="fa"></i>Detail</a></td>
                                        <td><span class="badge bg-success">${b.payment}</span></td> -->
                                    <!--</tr>-->
                                    <%--</c:forEach>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Order today End -->


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
                                    <img class="rounded-circle flex-shrink-0" src="ViewAdmin/img/user.jpg" alt="" style="width: 40px; height: 40px;">
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
        <script src="ViewAdmin/lib/chart/chart.min.js"></script>
        <script src="ViewAdmin/lib/easing/easing.min.js"></script>
        <script src="ViewAdmin/lib/waypoints/waypoints.min.js"></script>
        <script src="ViewAdmin/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="ViewAdmin/lib/tempusdominus/js/moment.min.js"></script>
        <script src="ViewAdmin/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="ViewAdmin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="ViewAdmin/js/main.js"></script>
        <script  type="text/javascript">
            // Single Line Chart
            var ctx3 = $("#line-chart").get(0).getContext("2d");
            var myChart3 = new Chart(ctx3, {
                type: "line",
                data: {
                    labels: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
                    datasets: [{
                            label: "Revenue",
                            fill: false,
                            backgroundColor: "rgba(0, 156, 255, .3)",
                            data: [${requestScope.m1}, ${requestScope.m2}, ${requestScope.m3},
            ${requestScope.m4}, ${requestScope.m5}, ${requestScope.m6},
            ${requestScope.m7},${requestScope.m8},${requestScope.m9},
            ${requestScope.m10},${requestScope.m11},${requestScope.m12}]
                        }]
                },
                options: {
                    responsive: true
                }
            });

            // Single Bar Chart
            var ctx4 = $("#bar-chart").get(0).getContext("2d");
            var myChart4 = new Chart(ctx4, {
                type: "bar",
                data: {
                    labels: ["Skincare", "Makeup", "Haircare", "Fragrance", "Bath & Body", "Men's Grooming", "Beauty Tools",
                        "Oral Care", "Nail Care", "Sun Care"],
                    datasets: [{
                            label: "Quantity of Product",
                            backgroundColor: [
                                "rgba(0, 156, 255, .7)",
                                "rgba(0, 156, 255, .6)",
                                "rgba(0, 156, 255, .5)",
                                "rgba(0, 156, 255, .4)",
                                "rgba(0, 156, 255, .3)"
                            ],
                            data: [${requestScope.cat1}, ${requestScope.cat2}, ${requestScope.cat3},
            ${requestScope.cat4}, ${requestScope.cat5}, ${requestScope.cat6},
            ${requestScope.cat7},${requestScope.cat8},${requestScope.cat9},
            ${requestScope.cat10}]
                        }]
                },
                options: {
                    responsive: true
                }
            });
        </script>
    </body>

</html>
