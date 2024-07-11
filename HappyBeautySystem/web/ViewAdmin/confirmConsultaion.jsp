<%-- 
    Document   : manageCoupons
    Created on : Jun 16, 2024, 9:17:01 PM
    Author     : phuan
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            #consultationTable {
                width: 100% !important;
                margin-bottom: 1rem;
                color: #212529;
                border-collapse: collapse;
            }
            #consultationTable th,
            #consultationTable td {
                padding: 0.75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }
            #consultationTable thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
                background-color: #f8f9fa;
            }
            #consultationTable tbody tr:nth-of-type(odd) {
                background-color: rgba(0, 0, 0, 0.05);
            }
            #consultationTable tbody tr:hover {
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

                <div class="container-fluid pt-4 px-4">
                    <div class="page-buttons">
                        <a href="Consultation?service=listAll1" class="btn btn-primary btn-sm">Danh sách chờ xác nhận</a>
                        <a href="Consultation?service=listAll2" class="btn btn-primary btn-sm">Danh sách chờ tư vấn</a>
                        <a href="Consultation?service=listAll3" class="btn btn-primary btn-sm">Danh sách đã tư vấn</a>
                    </div>
                    <div class="bg-light text-center rounded p-4">

                        <div class="table-responsive">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4>Danh sách chờ tư vấn</h4>
                                <div class="d-flex " style="margin-top: 10px">
                                    <input class="form-control border-0 me-2" id="searchInput" type="text" placeholder="Tìm kiếm">
                                    <button style="color: black; background-color: #99ccff; border-radius: 40px;" id="searchButton" class="btn btn-outline-secondary" ><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <table class="table text-start align-middle table-bordered table-hover mb-0 " id="consultationTable2">
                                <thead>
                                    <tr class="text-dark">
                                        <th>Tên khách hàng</th>
                                        <th>Địa chỉ</th>
                                        <th>Số điện thoại</th>
                                        <th>Email</th>
                                        <th>Ngày Tư vấn</th>
                                        <th>Ghi chú</th>
                                        <th>Giờ bắt đầu</th>
                                        <th>Giờ kết thúc</th>
                                        <th>Trạng thái</th>
                                        <th >Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach items="${requestScope.listAll2}" var="consultaion">
                                        <tr class="text-center">
                                            <td>${consultaion.customerName}</td>
                                            <td>${consultaion.customerAddress}</td>        
                                            <td>${consultaion.customerPhone}</td>
                                            <td>${consultaion.email}</td> 
                                            <td>${consultaion.consultationDate}</td>                                      
                                            <td>${consultaion.note}</td>                                 
                                            <td> <fmt:parseDate value="${consultaion.startHour}" pattern="HH:mm:ss.SSS" var="parsedStartDate" type="time" />
                                                <fmt:formatDate value="${parsedStartDate}" pattern="HH:mm" />
                                            </td>
                                            <td> <fmt:parseDate value="${consultaion.endHour}" pattern="HH:mm:ss.SSS" var="parsedEndDate" type="time" />
                                                <fmt:formatDate value="${parsedEndDate}" pattern="HH:mm" /></td>

                                            <td>
                                                <c:if test="${consultaion.status == 2}">
                                                   chờ tư vấn
                                                </c:if>
                                            </td>
                                            <td style="display: flex">
                                                <a class="btn btn-success"  onclick="confirmConsultaion2('${consultaion.consultationId}', '${consultaion.customerName}')" role="button" style='font-size:10px'>
                                                    <i class="fas fa-check"></i>
                                                </a>
                                                <a class="btn btn-danger"  onclick="doDeleteConsultation('${consultaion.consultationId}', '${consultaion.customerName}',2)" role="button" style='font-size:10px'>
                                                    <i class="fas fa-trash-alt"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>


                </div>


            </div>
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
        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <!-- js datatable -->
        <script>
                                                    $(document).ready(function () {
                                                        var table = $('#consultationTable2').DataTable({
                                                            "pageLength": 5,
                                                            "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                                                            "order": [[0, "asc"]],
                                                            "columnDefs": [
                                                                {"orderable": false, "targets": 8}
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

        <script>
            function confirmConsultaion2(consultationId, customerName) {
                if (confirm("xác nhận đã tư vấn cho khách hàng  " + customerName + "?")) {
                    window.location = "Consultation?service=confirm2&idConfirm2=" + consultationId;
                }
            }
            
             function  doDeleteConsultation(consultationId, customerName, status){
                if (confirm("Bạn có muốn xóa lịch tư vấn của khác hàng  " + customerName + "?")) {
                    window.location = "Consultation?service=deleteconfirm&idConfirmdelete=" + consultationId + "&status=" + status;;
                }
            }
        </script>

    </body>

</html>