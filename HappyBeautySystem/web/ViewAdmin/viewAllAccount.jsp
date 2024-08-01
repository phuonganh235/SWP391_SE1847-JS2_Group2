<%@page import="java.util.ArrayList"%>
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
        <!-- datatable -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
        <style>
            .circle {
                height: 10px;
                width: 10px;
                border-radius: 50%;
            }
            #staffTable {
                width: 100% !important;
                margin-bottom: 1rem;
                color: #212529;
                border-collapse: collapse;
            }
            #staffTable th,
            #staffTable td {
                padding: 0.75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }
            #staffTable thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
                background-color: #f8f9fa;
            }
            #staffTable tbody tr:nth-of-type(odd) {
                background-color: rgba(0, 0, 0, 0.05);
            }
            #staffTable tbody tr:hover {
                background-color: rgba(0, 0, 0, 0.075);
            }
            .dataTables_wrapper .dataTables_paginate .paginate_button {
                padding: 0.5em 1em;
                margin-left: 2px;
                border: 1px solid #ddd;
                background-color: #f8f9fa;
            }
            .dataTables_wrapper .dataTables_paginate .paginate_button.current {
                background-color: #007bff;
                color: black !important;
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


                <!-- list all staff Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0 text-center"> Quản lý tải khoản</h6>

                            <div class="d-flex" style="margin-top: 10px">
                                <input class="form-control border-0 me-2" id="searchInput" type="text" placeholder="Tìm kiếm">
                                <button style="color: black; background-color: #99ccff; border-radius: 40px;" id="searchButton" class="btn btn-outline-secondary" ><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                        <!-- Load account -->
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0" id="staffTable">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">ID</th>
                                        <th scope="col">Họ và tên</th>
                                        <th scope="col">Vai trò</th>
                                        <th scope="col">Cập nhật vai trò</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listP}" var="data">
                                        <tr>

                                            <td>${data.userId}</td>
                                            <td>${data.name}</td>
                                            <td>${data.roleId}</td>
                                            <td>
                                                <form action="manageRole" method="post" style="display:inline;">
                                                    <input type="hidden" name="service" value="editRole"/>
                                                    <input type="hidden" name="id" value="${data.userId}"/>
                                                    <button type="submit" class="btn btn-sm btn-primary">
                                                        <i class="fas fa-user-edit"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
            <!-- Content End -->

            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
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
        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
        <!-- Template Javascript -->
        <script src="js/main.js"></script>

        <script>
                                            $(document).ready(function () {
                                                var table = $('#staffTable').DataTable({
                                                    "pageLength": 5,
                                                    "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                                                    "order": [[0, "asc"]],
                                                    "columnDefs": [
                                                        {"orderable": false, "targets": 7}
                                                    ],
                                                    "dom": '<"top"l>rt<"bottom"ip><"clear">', // Ẩn thanh tìm kiếm mặc định
                                                    "language": {
                                                        "lengthMenu": "Hiển thị _MENU_ mục",
                                                        "info": "Hiển thị _START_ đến _END_ trong số _TOTAL_ mục",
                                                        "paginate": {
                                                            "first": "Đầu",
                                                            "last": "Cuối",
                                                            "next": "Tiếp",
                                                            "previous": "Trở vể"
                                                        }
                                                    }
                                                });

                                                // Kết nối thanh tìm kiếm tùy chỉnh với DataTable
                                                $('#searchInput').on('keyup', function () {
                                                    table.search(this.value).draw();
                                                });

                                                // Xử lý tìm kiếm khi nhấn nút tìm kiếm
                                                $('#searchButton').on('click', function () {
                                                    table.search($('#searchInput').val()).draw();
                                                });

                                                // Xử lý tìm kiếm khi nhấn Enter trong ô tìm kiếm
                                                $('#searchInput').on('keypress', function (e) {
                                                    if (e.which == 13) {  // 13 là mã phím cho Enter
                                                        table.search(this.value).draw();
                                                    }
                                                });
                                            });
        </script>

    </body>

</html>
