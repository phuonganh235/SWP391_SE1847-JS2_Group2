
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

            .bg-light:hover {
                transform: scale(1.03);
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
                <jsp:include page="navbarAdmin.jsp"/>
                <!-- Navbar End -->

                <!-- Product & Order Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-md-6 col-sm-6 col-xl-6">
                            <div class="bg-success rounded d-flex align-items-center p-3">
                                <a href=""><i class="fa fa-users fa-3x text-white"></i></a>
                                <div class="ms-3" style="text-align: left">
                                    <h5 class="mb-3"><a href="#" style="color: aquamarine">Tổng số khách hàng</a></h5>
                                    <h6 class="mb-0" style="color: white"><b>${requestScope.user} khách hàng</b></h6>
                                    <span style="color: aquamarine; font-size: 12px">Tổng số khách hàng được quản lý.</span>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xl-6">
                            <div class="bg-primary rounded d-flex align-items-center p-3">
                                <a href="manager"><i class="fa fa-database fa-3x text-white"></i></a>
                                <div class="ms-3" style="text-align: left">
                                    <h5 class="mb-3"><a href="manager" style="color: #e6f5ff">Tổng số sản phẩm</a></h5>
                                    <h6 class="mb-0" style="color: white"><b>${requestScope.product} sản phẩm</b></h6>
                                    <span style="color: #e6f5ff; font-size: 12px">Tổng số sản phẩm được quản lý.</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xl-6">
                            <div class="bg-warning rounded d-flex align-items-center p-3">
                                <a href=""><i class="fa fa-shopping-bag fa-3x text-white"></i></a>
                                <div class="ms-3" style="text-align: left">
                                    <h5 class="mb-3" style="color: #fcf8e3">Tổng số đơn hàng</h5>
                                    <h6 class="mb-0" style="color: white"><b>${requestScope.order} đơn hàng</b></h6>
                                    <span style="color: #fcf8e3; font-size: 12px">Tổng số hóa đơn bán hàng trong tháng.</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xl-6">
                            <div class="bg-danger rounded d-flex align-items-center p-3">
                                <a href="manager?service=low"><i class="fa fa-exclamation-triangle fa-3x text-white"></i></a>
                                <div class="ms-3" style="text-align: left">
                                    <h5 class="mb-3" style="color: #f5c6cb">Sắp hết hàng</h5>
                                    <h6 class="mb-0" style="color: white"><b>${requestScope.low} sản phẩm</b></h6>
                                    <span style="color: #f5c6cb; font-size: 12px">Cảnh báo sản phẩm sắp hết hàng cần bổ sung.</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Product & Order End -->

                <!-- Widgets Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Biểu đồ doanh thu</h6>
                                    <a href="chart">Chi tiết</a>
                                </div>
                                <canvas id="line-chart"></canvas>
                            </div>
                        </div>
                        <!--Top2 customer buy most start-->
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4" style="color: #ffd700; font-size: 20px; text-align: center">Top 2 khách hàng thân thiết</h6>
                                <div class="owl-carousel testimonial-carousel">
                                    <c:forEach items="${top3Customer}" var="t3">
                                        <div class="testimonial-item text-center">
                                            <img class="img-fluid rounded-circle mx-auto mb-4" src="ViewAdmin/img/topcustomer.png" style="width: 100px; height: 100px;">
                                            <h5 class="mb-1" style="color: #494f54">${t3.getCustomerName()}</h5>
                                            <p>ID: ${t3.getUserId()}</p>
                                            <p class="mb-0">Khách hàng thân thiết của cửa hàng</p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!--Top3 customer buy most end-->
                        
                    </div>
                </div>
                <!-- Widgets End -->

                <!-- Sales Chart Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Biểu đồ số lượng</h6>
                                    <a href="chart">Chi tiết</a>
                                </div>
                                <canvas id="bar-chart"></canvas>
                            </div>
                        </div>
                         <!--Calender start-->
                        <div class="col-sm-12 col-md-6 col-xl-6">
                            <div class="h-100 bg-light rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Lịch</h6>
                                    <a href="/HappyBeautySystem/managerOrder?service=viewOrderToday">Xem đơn hàng hôm nay</a>
                                </div>
                                <div id="calender"></div>
                            </div>
                        </div>
                        <!--Calender end-->
                    </div>
                </div>
                <!-- Sales Chart End -->

                <!-- Footer Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light rounded-top p-4">
                        <div class="row">
                            <div class="col-12 col-sm-6 text-center text-sm-start">
                                <a href="#">HappyBeauty</a>
                            </div>
                            <div class="col-12 col-sm-6 text-center text-sm-end">
                                Thiết kế bởi nhóm 2
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
