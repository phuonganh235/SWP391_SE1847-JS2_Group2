<%-- 
    Document   : manageCoupons
    Created on : Jun 16, 2024, 9:17:01 PM
    Author     : phuan
--%>
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
        <!-- datatable -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
        <style>
            .circle {
                height: 10px;
                width: 10px;
                border-radius: 50%;
            }
            #couponTable {
                width: 100% !important;
                margin-bottom: 1rem;
                color: #212529;
                border-collapse: collapse;
            }
            #couponTable th,
            #couponTable td {
                padding: 0.75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }
            #couponTable thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
                background-color: #f8f9fa;
            }
            #couponTable tbody tr:nth-of-type(odd) {
                background-color: rgba(0, 0, 0, 0.05);
            }
            #couponTable tbody tr:hover {
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
                    <div class="bg-light text-center rounded p-4">

                        <!-- Load account staff -->
                        <div class="table-responsive">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCouponModal">
                                   Thêm mã giảm giá
                                </button>
                                <div class="d-flex" style="margin-top: 10px">
                                    <input class="form-control border-0 me-2" id="searchInput" type="text" placeholder="Tìm kiếm">
                                    <button style="color: black; background-color: #99ccff; border-radius: 40px;" id="searchButton" class="btn btn-outline-secondary" ><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <table class="table text-start align-middle table-bordered table-hover mb-0 " id="couponTable">
                                <thead>
                                    <tr class="text-dark">
                                        <th>Mã phiếu giảm giá</th>
                                        <th>Mã giảm giá</th>
                                        <th>Miêu tả</th>
                                        <th>Giá trị</th>
                                        <th>Ngày bắt đầu</th>
                                        <th>Ngày kết thúc</th>
                                        <th>Số lượng</th>
                                        <th>Trạng thái</th>
                                        <th >Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.couponList}" var="co">
                                        <tr class="text-center">
                                            <td scope="row">${co.couponsId}</td>
                                            <td>${co.code}</td>        
                                            <td>${co.description}</td>                                      
                                            <td>${co.discountAmount}%</td>                                      
                                            <td>${co.startDate}</td>                                 
                                            <td>${co.endDate}</td>
                                            <td>${co.quantity}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${co.isActive == 1}">
                                                        <img class="circle" src="ViewAdmin/img/active.png" alt="Active">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="circle" src="ViewAdmin/img/inactive.png" alt="Inactive">
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td style="display: flex">
                                                <form action="manageCoupons?service=update" method="post" >

                                                    <input type="hidden" name="id" value="${co.couponsId}"/>
                                                    <button type="submit" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#updateCouponModal" >
                                                        <i class="fas fa-user-edit"></i>
                                                    </button>

                                                </form>
                                                <a class="btn btn-danger"  onclick="doDeleteCoupon('${co.couponsId}')" role="button" style='font-size:10px'>
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

        <!-- Add Coupons Modal -->
        <div class="modal fade" id="addCouponModal" tabindex="-1" aria-labelledby="addCouponModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addCouponModalLabel">Thêm mã giảm giá</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="updateCouponForm" action="manageCoupons?service=insert" method="post">
                            <div class="mb-3">
                                <label for="couponCode" class="form-label">Mã giảm giá</label>
                                <input type="text" class="form-control" id="couponCode" name="couponCode" >
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Miêu tả</label>
                                <input type="text" class="form-control" id="description" name="description" required>
                                <div id="descriptionError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3">
                                <label for="discountAmount" class="form-label">Giá trị</label>
                                <input type="number" class="form-control" id="discountAmount" name="discountAmount" required>
                                <div id="discountAmountError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3">
                                <label for="startDate" class="form-label">Ngày bắt đầu</label>
                                <input type="datetime-local" class="form-control" id="startDate" name="startDate" required>
                                <div id="startDateError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3">
                                <label for="endDate" class="form-label">Ngày kết thúc</label>
                                <input type="datetime-local" class="form-control" id="endDate" name="endDate" required>
                                <div id="endDateError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3 ">
                                <label class="form-label" for="quantity">Số lượng</label>
                                <input type="number" class="form-control"  id="quantity" name="quantity" min="0"/>
                                <div id="quantityError" class="form-text text-danger fst-italic"></div>
                            </div>

                            <button type="submit" class="btn btn-primary">Thêm</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- update Coupons Modal -->
        <div class="modal fade" id="updateCouponModal" tabindex="-1" aria-labelledby="CouponModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateCouponModal">Sửa mã giảm giá</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <c:set value="${requestScope.CouponIdUpdate}" var="couponUpdate"/>
                        <form id="updateCouponForm" action="manageCoupons?service=edit" method="post">
                            <div class="mb-3">
    
                                <label for="couponid" class="form-label">Mã phiếu giảm giá</label>
                                <input type="text" class="form-control" id="couponid" name="couponid" value="${couponUpdate.couponsId}">
                            </div>
                            <div class="mb-3">
                                <label for="updateCouponCode" class="form-label">Mã giảm giá</label>
                                <input type="text" class="form-control" id="updateCouponCode" name="couponCode" value="${couponUpdate.code}">
                            </div>
                            <div class="mb-3">
                                <label for="updateDescription" class="form-label">Miêu tả</label>
                                <input type="text" class="form-control" id="updateDescription" name="description" value="${couponUpdate.description}" required>
                                <div id="updateDescriptionError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3">
                                <label for="updateDiscountAmount" class="form-label">Giá trị</label>
                                <input type="number" class="form-control" id="updateDiscountAmount" name="discountAmount" value="${couponUpdate.discountAmount}"  required>
                                <div id="updateDiscountAmountError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3">
                                <label for="updateStartDate" class="form-label">Ngày bắt đầu</label>
                                <input type="datetime-local" class="form-control" id="updateStartDate" name="startDate" value="${couponUpdate.startDate}"  required>
                                <div id="updateStartDateError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3">
                                <label for="updateEndDate" class="form-label">Ngày kết thúc</label>
                                <input type="datetime-local" class="form-control" id="updateEndDate" name="endDate" value="${couponUpdate.endDate}"  required>
                                <div id="updateEndDateError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="updateQuantity">Số lượng</label>
                                <input type="number" class="form-control"  id="updateQuantity" name="quantity" value="${couponUpdate.quantity}" min="0" >
                                <div id="updateQuantityError" class="form-text text-danger fst-italic"></div>
                            </div>

                            <button type="submit" class="btn btn-primary">Sửa</button>
                        </form>
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
                                                        var table = $('#couponTable').DataTable({
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

            //function delete
            function doDeleteCoupon(couponsId) {
                if (confirm("bạn có chắc chắn muốn xóa mã phiếu giảm giá là= " + couponsId)) {
                    window.location = "manageCoupons?service=delete&id=" + couponsId;
                }
            }

            $(document).ready(function () {
                // Update
            <c:if test="${not empty requestScope.CouponIdUpdate}">
                $('#updateCouponModal').modal('show');
            </c:if>
            });
            document.addEventListener("DOMContentLoaded", function () {

                function validateDescription() {
                    var description = document.getElementById("description").value;
                    if (/^\s*$/.test(description)) {
                        document.getElementById("descriptionError").innerHTML = "Mô tả không được chỉ chứa toàn khoảng trắng";
                        return false;
                    } else {
                        document.getElementById("descriptionError").innerHTML = "";
                        return true;
                    }
                }

                function validateDiscountAmount() {
                    var discountAmount = parseFloat(document.getElementById("discountAmount").value);
                    if (isNaN(discountAmount) || discountAmount <= 0) {
                        document.getElementById("discountAmountError").innerHTML = "giá trị giảm giá phải là số dương.";
                        return false;
                    } else {
                        document.getElementById("discountAmountError").innerHTML = "";
                        return true;
                    }
                }
                function validateQuantity() {
                    var quantity = parseFloat(document.getElementById("quantity").value);
                    if (isNaN(quantity) || quantity <= 0) {
                        document.getElementById("quantityError").innerHTML = "Số lượng  giảm giá phải là số dương.";
                        return false;
                    } else {
                        document.getElementById("quantityError").innerHTML = "";
                        return true;
                    }
                }

                function validateStartDate() {
                    var startDate = document.getElementById("startDate").value;
                    if (!startDate) {
                        document.getElementById("startDateError").innerHTML = "Ngày bắt đầu không được để trống.";
                        return false;
                    } else {
                        document.getElementById("startDateError").innerHTML = "";
                        return true;
                    }
                }

                function validateEndDate() {
                    var startDate = document.getElementById("startDate").value;
                    var endDate = document.getElementById("endDate").value;
                    if (!endDate) {
                        document.getElementById("endDateError").innerHTML = "Ngày kết thúc không được để trống.";
                        return false;
                    } else if (startDate && endDate && new Date(endDate) < new Date(startDate)) {
                        document.getElementById("endDateError").innerHTML = "Ngày kết thúc không được trước ngày bắt đầu.";
                        return false;
                    } else {
                        document.getElementById("endDateError").innerHTML = "";
                        return true;
                    }
                }

                document.getElementById("description").oninput = validateDescription;

                document.getElementById("discountAmount").oninput = validateDiscountAmount;
                document.getElementById("startDate").oninput = function () {
                    validateStartDate();
                    validateEndDate();
                };
                document.getElementById("endDate").oninput = validateEndDate;
                document.getElementById("quantity").oninput = validateQuantity;
                document.getElementById("couponForm").onsubmit = function (event) {
                    if (!validateDescription() || !validateDiscountAmount() || !validateStartDate() || !validateEndDate() || !validateQuantity()) {
                        event.preventDefault();
                    }
                };
            });
        </script>
        
         <script>
                 document.addEventListener("DOMContentLoaded", function () {
                function validateDescription() {
                    var description = document.getElementById("updateDescription").value;
                    if (/^\s*$/.test(description)) {
                        document.getElementById("updateDescriptionError").innerHTML = "Mô tả không được chỉ chứa toàn khoảng trắng.";
                        return false;
                    } else {
                        document.getElementById("updateDescriptionError").innerHTML = "";
                        return true;
                    }
                }

                function validateDiscountAmount() {
                    var discountAmount = parseFloat(document.getElementById("updateDiscountAmount").value);
                    if (isNaN(discountAmount) || discountAmount <= 0) {
                        document.getElementById("updateDiscountAmountError").innerHTML = "giá trị giảm giá phải là số dương.";
                        return false;
                    } else {
                        document.getElementById("updateDiscountAmountError").innerHTML = "";
                        return true;
                    }
                }
                function validateQuantity() {
                    var quantity = parseFloat(document.getElementById("updateQuantity").value);
                    if (isNaN(quantity) || quantity < 0) {
                        document.getElementById("updateQuantityError").innerHTML = "Số lượng  giảm giá phải là số dương.";
                        return false;
                    } else {
                        document.getElementById("updateQuantityError").innerHTML = "";
                        return true;
                    }
                }

                function validateStartDate() {
                    var startDate = document.getElementById("updateStartDate").value;
                    if (!startDate) {
                        document.getElementById("updateStartDateError").innerHTML = "Ngày bắt đầu không được để trống.";
                        return false;
                    } else {
                        document.getElementById("updateStartDateError").innerHTML = "";
                        return true;
                    }
                }

                function validateEndDate() {
                    var startDate = document.getElementById("updateStartDate").value;
                    var endDate = document.getElementById("updateEndDate").value;
                    if (!endDate) {
                        document.getElementById("updateEndDateError").innerHTML = "Ngày kết thúc không được để trống.";
                        return false;
                    } else if (startDate && endDate && new Date(endDate) < new Date(startDate)) {
                        document.getElementById("updateEndDateError").innerHTML = "Ngày kết thúc không được trước ngày bắt đầu.";
                        return false;
                    } else {
                        document.getElementById("updateEndDateError").innerHTML = "";
                        return true;
                    }
                }

                document.getElementById("updateDescription").oninput = validateDescription;

                document.getElementById("updateDiscountAmount").oninput = validateDiscountAmount;
                document.getElementById("updateStartDate").oninput = function () {
                    validateStartDate();
                    validateEndDate();
                };
                document.getElementById("updateEndDate").oninput = validateEndDate;
                document.getElementById("updateQuantity").oninput = validateQuantity;
                document.getElementById("updateCouponForm").onsubmit = function (event) {
                    if (!validateDescription() || !validateDiscountAmount() || !validateStartDate() || !validateEndDate() || !validateQuantity()) {
                        event.preventDefault();
                    }
                };
            });
    </script>
    </body>

</html>