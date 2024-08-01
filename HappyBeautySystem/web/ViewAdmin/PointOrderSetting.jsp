<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!-- Thêm các style cụ thể của bạn ở đây -->
        <style>
            .bg-light {
                background-color: #f8f9fa !important;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            .form-label {
                font-weight: 600;
                color: #333;
            }

            .input-group {
                margin-bottom: 1rem;
            }

            .input-group-text {
                background-color: #e9ecef;
                border-color: #ced4da;
            }

            .form-control:focus {
                border-color: #80bdff;
                box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
            }

            .form-check {
                margin-bottom: 0.5rem;
            }

            .form-check-label {
                color: #495057;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }

            .mt-4 {
                text-align: right;
            }

            h6.mb-4 {
                color: #007bff;
                font-weight: 600;
                margin-bottom: 1.5rem;
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

                <!-- Main Content -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-12">
                            <h6 class="mb-4">Thiết lập tích điểm</h6>
                            <div class="bg-light rounded h-100 p-4">
                                <c:set value="${requestScope.PointConfigUpdate}" var="pointConfigUpdate"/>
                                <form action="SettingPoint?service=edit" method="post">
                                    <input type="hidden" name="id" value="${pointConfigUpdate.id}">
                                    <div class="mb-3">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="tichDiem" name="isEnabled" ${pointConfigUpdate.isEnabled == true ? 'checked' : ''} >
                                            <label class="form-check-label" for="tichDiem">Bật tích điểm</label>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="tyLeQuyDoi" class="form-label">Tỷ lệ quy đổi điểm thưởng</label>
                                        <div class="input-group">
                                            <input type="number" class="form-control" name="pointsPerAmount" id="tyLeQuyDoi" value="${pointConfigUpdate.pointsPerAmount}">
                                            <span class="input-group-text">VNĐ</span>
                                            <span class="input-group-text">=</span>
                                            <input type="number" class="form-control" name="pointsEarned" id="diemThuong" value="${pointConfigUpdate.pointsEarned}" >
                                            <span class="input-group-text">điểm thưởng</span>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-check-label" for="choPhepThanhToan">Thanh toán bằng điểm</label>
                                        <div class="input-group">
                                            <input type="number" class="form-control" name="pointsRedeemed" id="diemThanhToan" value="${pointConfigUpdate.pointsRedeemed}">
                                            <span class="input-group-text">điểm</span>
                                            <span class="input-group-text">=</span>
                                            <input type="number" class="form-control" name="redeemValue" id="giaTriThanhToan" value="${pointConfigUpdate.redeemValue}">
                                            <span class="input-group-text">%</span>
                                        </div>
                                    </div>
                                  
                                    <div class="mt-4 text-end">
                                        <button type="submit" class="btn btn-primary">Lưu</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Main Content End -->
            </div>
            <!-- Content End -->
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>