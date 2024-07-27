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
                        <div class="chart-explanation">Biểu đồ này hiển thị doanh thu theo tháng, tuần, năm và theo ngày của hệ thống. Nó cho phép quản trị viên theo dõi và phân tích sự biến động của doanh thu theo thời gian.
                        </div>
                        <!--Filter by date-->
                        <div class="filterBox">
                            <a href="chart?service=listDay">Ngày</a>
                            <a href="chart?service=listWeek">Tuần</a>
                            <a href="chart?service=listMonth">Tháng</a>
                            <a href="chart?service=listYear">Năm</a>
<!--                            <label for="startDate">Bắt đầu:</label>
                            <input type="date" id="startDate">
                            <label for="endDate">Kết thúc:</label>
                            <input type="date" id="endDate">
                            <button onclick="applyDateFilter()">Áp dụng</button>-->
                        </div>

                        <c:if test="${chartType == 'month'}">
                            <div class="col-sm-12 col-xl-12">
                                <div class="bg-light rounded h-100 p-4">
                                    <h6 class="mb-4">Biểu đồ doanh thu theo tháng</h6>
                                    <canvas id="line-chart"></canvas>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${chartType == 'day'}">
                            <div class="col-sm-12 col-xl-12">
                                <div class="bg-light rounded h-100 p-4">
                                    <h6 class="mb-4">Biểu đồ doanh thu theo ngày</h6>
                                    <canvas id="bar-chart"></canvas>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${chartType == 'week'}">
                            <div class="col-sm-12 col-xl-12">
                                <div class="bg-light rounded h-100 p-4">
                                    <h6 class="mb-4">Biểu đồ doanh thu theo tuần</h6>
                                    <canvas id="week-chart"></canvas>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${chartType == 'year'}">
                            <div class="col-sm-12 col-xl-12">
                                <div class="bg-light rounded h-100 p-4">
                                    <h6 class="mb-4">Biểu đồ doanh thu theo năm</h6>
                                    <canvas id="year-chart"></canvas>
                                </div>
                            </div>
                        </c:if>
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
                                // Initialize the data for the charts
                                var monthlyData = [
            <c:forEach var="revenue" items="${revenueList}">
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

            <c:if test="${chartType == 'month'}">
                                var ctx1 = $("#line-chart").get(0).getContext("2d");
                                new Chart(ctx1, {
                                    type: "bar",
                                    data: {
                                        labels: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
                                        datasets: [{
                                                label: "Doanh thu",
                                                fill: false,
                                                backgroundColor: "rgba(0, 156, 255, .3)",
                                                data: monthlyData
                                            }]
                                    },
                                    options: {
                                        responsive: true
                                    }
                                });
            </c:if>

            <c:if test="${chartType == 'day'}">
                                var ctx2 = $("#bar-chart").get(0).getContext("2d");
                                var dates = [
                <c:forEach var="date" items="${dateList}">
                                    '${date}',
                </c:forEach>
                                ];
                                new Chart(ctx2, {
                                    type: "bar",
                                    data: {
                                        labels: dates,
                                        datasets: [{
                                                label: "Doanh thu",
                                                fill: false,
                                                backgroundColor: "rgba(0, 156, 255, .3)",
                                                data: dailyData
                                            }]
                                    },
                                    options: {
                                        responsive: true
                                    }
                                });
            </c:if>

            <c:if test="${chartType == 'week'}">
                                var ctx3 = $("#week-chart").get(0).getContext("2d");
                                var weeks = [
                <c:forEach var="week" items="${weekList}">
                                    '${week}',
                </c:forEach>
                                ];
                                new Chart(ctx3, {
                                    type: "bar",
                                    data: {
                                        labels: weeks,
                                        datasets: [{
                                                label: "Doanh thu",
                                                fill: false,
                                                backgroundColor: "rgba(0, 156, 255, .3)",
                                                data: weeklyData
                                            }]
                                    },
                                    options: {
                                        responsive: true
                                    }
                                });
            </c:if>

            <c:if test="${chartType == 'year'}">
                                var ctx4 = $("#year-chart").get(0).getContext("2d");
                                var years = [
                <c:forEach var="year" items="${yearList}">
                                    '${year}',
                </c:forEach>
                                ];
                                new Chart(ctx4, {
                                    type: "bar",
                                    data: {
                                        labels: years,
                                        datasets: [{
                                                label: "Doanh thu",
                                                fill: false,
                                                backgroundColor: "rgba(0, 156, 255, .3)",
                                                data: yearlyData
                                            }]
                                    },
                                    options: {
                                        responsive: true
                                    }
                                });
            </c:if>

                                function applyDateFilter() {
                                    var startDate = document.getElementById('startDate').value;
                                    var endDate = document.getElementById('endDate').value;

                                    // Filter for monthly chart
            <c:if test="${chartType == 'month'}">
                                    var startMonth = startDate ? new Date(startDate).getMonth() + 1 : 1;
                                    var endMonth = endDate ? new Date(endDate).getMonth() + 1 : 12;

                                    var filteredData = monthlyData.slice(startMonth - 1, endMonth);

                                    var labels = Array.from({length: endMonth - startMonth + 1}, (v, i) => (i + startMonth).toString());
                                    myChart1.data.labels = labels;
                                    myChart1.data.datasets[0].data = filteredData;
                                    myChart1.update();
            </c:if>

                                    // Filter for daily chart
            <c:if test="${chartType == 'day'}">
                                    var filteredDates = [];
                                    var filteredData2 = [];

                                    if (startDate && endDate) {
                                        var startDateObj = new Date(startDate);
                                        var endDateObj = new Date(endDate);

                                        for (var i = 0; i < dates.length; i++) {
                                            var currentDate = new Date(dates[i]);
                                            if (currentDate >= startDateObj && currentDate <= endDateObj) {
                                                filteredDates.push(dates[i]);
                                                filteredData2.push(dailyData[i]);
                                            }
                                        }
                                    } else {
                                        filteredDates = dates;
                                        filteredData2 = dailyData;
                                    }

                                    myChart2.data.labels = filteredDates;
                                    myChart2.data.datasets[0].data = filteredData2;
                                    myChart2.update();
            </c:if>

                                    // Filter for weekly chart
            <c:if test="${chartType == 'week'}">
                                    var filteredWeeks = [];
                                    var filteredData3 = [];

                                    if (startDate && endDate) {
                                        var startDateObj = new Date(startDate);
                                        var endDateObj = new Date(endDate);

                                        for (var i = 0; i < weeks.length; i++) {
                                            var week = weeks[i];
                                            var weekStartDate = new Date(week.split(" of ")[1] + "-01-01");
                                            weekStartDate.setDate(weekStartDate.getDate() + (parseInt(week.split("Week ")[1]) - 1) * 7);
                                            var weekEndDate = new Date(weekStartDate);
                                            weekEndDate.setDate(weekEndDate.getDate() + 6);

                                            if (weekStartDate >= startDateObj && weekEndDate <= endDateObj) {
                                                filteredWeeks.push(week);
                                                filteredData3.push(weeklyData[i]);
                                            }
                                        }
                                    } else {
                                        filteredWeeks = weeks;
                                        filteredData3 = weeklyData;
                                    }

                                    myChart3.data.labels = filteredWeeks;
                                    myChart3.data.datasets[0].data = filteredData3;
                                    myChart3.update();
            </c:if>

                                    // Filter for yearly chart
            <c:if test="${chartType == 'year'}">
                                    var filteredYears = [];
                                    var filteredData4 = [];

                                    if (startDate && endDate) {
                                        var startYear = new Date(startDate).getFullYear();
                                        var endYear = new Date(endDate).getFullYear();

                                        for (var i = 0; i < years.length; i++) {
                                            var year = parseInt(years[i]);
                                            if (year >= startYear && year <= endYear) {
                                                filteredYears.push(years[i]);
                                                filteredData4.push(yearlyData[i]);
                                            }
                                        }
                                    } else {
                                        filteredYears = years;
                                        filteredData4 = yearlyData;
                                    }

                                    myChart4.data.labels = filteredYears;
                                    myChart4.data.datasets[0].data = filteredData4;
                                    myChart4.update();
            </c:if>
                                }
        </script>
    </body>

</html>
