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
            .filterBox {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }

            .filterBox label {
                margin-right: 10px;
                font-weight: bold;
            }

            .filterBox input[type="date"],
            .filterBox a {
                margin-right: 10px;
            }
            .filterBox button {
                padding: 10px 20px; /* Kích thước padding để nút lớn hơn */
                background-color: #007bff;
                color: #fff;
                border: 1px solid #007bff;
                border-radius: 4px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .filterBox button:hover {
                background-color: #0056b3; /* Đổi màu nền khi hover */
            }
            .filterBox a {
                display: inline-block;
                padding: 8px 16px;
                margin-right: 10px;
                color: #007bff;
                text-decoration: none;
                border: 1px solid #007bff;
                border-radius: 4px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .filterBox a:hover {
                background-color: #007bff;
                color: #fff;
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

                <!-- Chart Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="chart-explanation">
                            Biểu đồ này hiển thị doanh thu theo tháng, tuần, năm và theo ngày của hệ thống. Nó cho phép quản trị viên theo dõi và phân tích sự biến động của doanh thu theo thời gian.
                        </div>
                        <!--Filter by date-->
                        <div class="filterBox">
                            <a href="chart?service=listDay">Ngày</a>
                            <a href="chart?service=listWeek">Tuần</a>
                            <a href="chart?service=listMonth">Tháng</a>
                            <a href="chart?service=listYear">Năm</a>
                        </div>

                        <div class="col-sm-6 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Biểu đồ doanh thu</h6>
                                </div>
                                <canvas id="revenue-chart"></canvas>
                            </div>
                        </div>

                        <div class="col-sm-6 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Biểu đồ số lượng sản phẩm đã bán theo danh mục</h6>
                                </div>
                                <canvas id="product-count-chart"></canvas>
                            </div>
                        </div>

                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Biểu đồ số lượng sản phẩm bán chạy nhất</h6>
                                </div>
                                <canvas id="top-selling-products-chart"></canvas>
                            </div>
                        </div>

                        <div class="col-sm-6 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Số lượng đơn hàng được theo ngày </h6>
                                </div>
                                <canvas id="orders-by-day-chart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Chart End -->

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
        <script type="text/javascript">

            var orderDates = [
            <c:forEach var="date" items="${last7Days}">
                '${date}',
            </c:forEach>
            ];

            var orderCounts = [
            <c:forEach var="count" items="${orderCountsByDay}">
                ${count},
            </c:forEach>
            ];

            var ctxOrdersByDay = document.getElementById("orders-by-day-chart").getContext("2d");
            var ordersByDayChart = new Chart(ctxOrdersByDay, {
                type: 'bar',
                data: {
                    labels: orderDates,
                    datasets: [{
                            label: 'Số lượng đơn hàng bán được',
                            backgroundColor: 'rgba(0, 156, 255, .3)',
                            borderColor:'rgba(0, 156, 255, .3)',
                            borderWidth: 1,
                            data: orderCounts
                        }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
            var productNames = [
            <c:forEach var="name" items="${productNames}">
                '${name}',
            </c:forEach>
            ];

            var productQuantities = [
            <c:forEach var="quantity" items="${productQuantities}">
                ${quantity},
            </c:forEach>
            ];

            var ctx3 = document.getElementById("top-selling-products-chart").getContext("2d");
            var topSellingProductsChart = new Chart(ctx3, {
                type: 'pie',
                data: {
                    labels: productNames,
                    datasets: [{
                            label: 'Số lượng sản phẩm bán chạy nhất',
                            backgroundColor: 'rgba(0, 156, 255, .3)',
                            data: productQuantities
                        }]
                },
                options: {
                    responsive: true
                }
            });
            // Initialize the data for the charts
            var monthlyData = [
            <c:forEach var="revenue" items="${revenueListByMonth}">
                ${revenue},
            </c:forEach>
            ];

            var dailyData = [
            <c:forEach var="revenue" items="${revenueListByDay}">
                ${revenue},
            </c:forEach>
            ];

            var weeklyData = [
            <c:forEach var="revenue" items="${revenueListByWeek}">
                ${revenue},
            </c:forEach>
            ];

            var yearlyData = [
            <c:forEach var="revenue" items="${revenueListByYear}">
                ${revenue},
            </c:forEach>
            ];

            var productCounts = [
            <c:forEach var="count" items="${productCounts}">
                ${count},
            </c:forEach>
            ];

            var categoryNames = [
            <c:forEach var="name" items="${categoryNames}">
                '${name}',
            </c:forEach>
            ];

            var dates = [
            <c:forEach var="date" items="${dateList}">
                '${date}',
            </c:forEach>
            ];

            var weeks = [
            <c:forEach var="week" items="${weekList}">
                '${week}',
            </c:forEach>
            ];

            var years = [
            <c:forEach var="year" items="${yearList}">
                ${year},
            </c:forEach>
            ];
            var months = [
            <c:forEach var="month" items="${monthList}">
                ${month},
            </c:forEach>
            ];

            var ctx = document.getElementById("revenue-chart").getContext("2d");
            var revenueChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: categoryNames,
                    datasets: [{
                            label: 'Doanh thu theo tháng',
                            backgroundColor: 'rgba(0, 156, 255, .3)',
                            data: monthlyData
                        }]
                },
                options: {
                    responsive: true
                }
            });

            var ctx2 = document.getElementById("product-count-chart").getContext("2d");
            var productCountChart = new Chart(ctx2, {
                type: 'bar',
                data: {
                    labels: categoryNames,
                    datasets: [{
                            label: 'Số lượng sản phẩm theo danh mục',
                            backgroundColor: 'rgba(0, 156, 255, .3)',
                            data: productCounts
                        }]
                },
                options: {
                    responsive: true
                }
            });

            // Add event listeners for the filter links
            document.querySelector(".filterBox").addEventListener("click", function (e) {
                if (e.target.tagName === "A") {
                    var service = e.target.getAttribute("href").split("=")[1];
                    switch (service) {
                        case "listDay":
                            revenueChart.data.labels = dates;
                            revenueChart.data.datasets[0].data = dailyData;
                            revenueChart.data.datasets[0].label = "Doanh thu theo ngày";
                            break;
                        case "listWeek":
                            revenueChart.data.labels = weeks;
                            revenueChart.data.datasets[0].data = weeklyData;
                            revenueChart.data.datasets[0].label = "Doanh thu theo tuần";
                            break;
                        case "listMonth":
                            revenueChart.data.labels = months;
                            revenueChart.data.datasets[0].data = monthlyData;
                            revenueChart.data.datasets[0].label = "Doanh thu theo tháng";
                            break;
                        case "listYear":
                            revenueChart.data.labels = years;
                            revenueChart.data.datasets[0].data = yearlyData;
                            revenueChart.data.datasets[0].label = "Doanh thu theo năm";
                            break;
                    }
                    revenueChart.update();
                    e.preventDefault();
                }
            });
        </script>
    </body>


</html>
