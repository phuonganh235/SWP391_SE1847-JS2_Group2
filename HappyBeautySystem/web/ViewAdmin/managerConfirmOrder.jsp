
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="ViewAdmin/css/style.css" rel="stylesheet">
        <!-- DataTables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

        <style>
            .circle {
                height: 10px;
                width: 10px;
                border-radius: 50%;
            }
            #tableOrderConfirm {
                width: 100% !important;
                margin-bottom: 1rem;
                color: #212529;
                border-collapse: collapse;
            }
            #tableOrderConfirm th,
            #tableOrderConfirm td {
                padding: 0.75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }
            #tableOrderConfirm thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
                background-color: #f8f9fa;
            }
            #tableOrderConfirm tbody tr:nth-of-type(odd) {
                background-color: rgba(0, 0, 0, 0.05);
            }
            #tableOrderConfirm tbody tr:hover {
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

                <!-- Product Management Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">

                        <!-- Load account staff -->
                        <div class="table-responsive">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                  <h6 class="mb-0">Danh sách đơn hàng đã xác nhận</h6>
                                <div class="d-flex" style="margin-top: 10px">
                                    <input class="form-control border-0 me-2" id="searchInput" type="text" placeholder="Tìm kiếm">
                                    <button style="color: black; background-color: #99ccff; border-radius: 40px;" id="searchButton" class="btn btn-outline-secondary" ><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <table class="table text-start align-middle table-bordered table-hover mb-0" id="tableOrderConfirm">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                        <th scope="col">Tên khách hàng</th>
                                        <th scope="col">Địa chỉ</th>
                                        <th scope="col">Số ĐIện thoại</th>
                                        <th scope="col">Ngày mua hàng</th>
                                        <th scope="col">Hành động </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listAllOrder}" var="order">
                                        <tr>
                                            <td><input class="form-check-input" type="checkbox"></td>
                                            <td>${order.getCustomerName()}</td>
                                            <td>${order.getCustomerAddress()}</td>
                                            <td>${order.getCustomerPhoneNumber()}</td>

                                            <td>${order.getOrderDate()}</td>
                                            <td>
                                                <a class="btn btn-sm btn-primary" href="managerOrder?service=viewDetailShipping&orderID=${order.getOrderId()}&CustomerID=${order.getUserId()}">Chi tiết</a>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
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
        <script>
            $(document).ready(function () {
                var table = $('#tableOrderConfirm').DataTable({
                    "pageLength": 5,
                    "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    "order": [[1, "asc"]],
                    "columnDefs": [
                        {"orderable": false, "targets": 5}
                    ],
                    "dom": '<"top"l>rt<"bottom"ip><"clear">', // Ẩn thanh tìm kiếm mặc định
                    "language": {
                        "lengthMenu": "Show _MENU_ entries",
                        "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                        "paginate": {
                            "first": "First",
                            "last": "Last",
                            "next": "Next",
                            "previous": "Previous"
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
