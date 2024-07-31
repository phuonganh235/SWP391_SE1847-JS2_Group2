<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Manage Promotion</title>
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
            #productTable {
                width: 100% !important;
                margin-bottom: 1rem;
                color: #212529;
                border-collapse: collapse;
            }
            #productTable th,
            #productTable td {
                padding: 0.75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }
            #productTable thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
                background-color: #f8f9fa;
            }
            #productTable tbody tr:nth-of-type(odd) {
                background-color: rgba(0, 0, 0, 0.05);
            }
            #productTable tbody tr:hover {
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
            .loadImage {
                width: 100%;
                height: auto;
                max-width: 300px;
                display: block;
                margin: 10px auto;
                border: 1px solid #ddd;
                padding: 5px;
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

                        <div class="table-responsive">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Quản lý chương trình khuyến mãi</h6>
                                <form class="d-none d-md-flex ms-4" action="managepromotion?service=search" method="post">
                                    <input type="hidden" name="service" value="search">
                                    <input class="form-control border-0" type="search" placeholder="Tìm kiếm" name="txt">
                                    <button style="color: black; background-color: #99ccff; border-radius: 40px;" 
                                            type="submit" class="btn btn-secondary btn-number"><i class="fa fa-search"></i></button>
                                </form>
                                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addPromotionModal">Thêm Chương Trình</button>
                            </div>
                            <table class="table text-start align-middle table-bordered table-hover mb-0" id="productTable">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">Mã khuyến mãi</th>
                                        <th scope="col">Tên khuyến mãi</th>
                                        <th scope="col">Ngày bắt đầu</th>
                                        <th scope="col">Ngày kết thúc</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Mô tả</th>
                                        <th scope="col">Giá trị KM</th>
                                        <th scope="col">Đơn tối thiểu</th>
                                        <th scope="col">Hành động</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${listP}" var="product">
                                        <tr>
                                            <td>${product.promoCode}</td>
                                            <td>${product.promoName}</td>
                                            <td>${product.startDate}</td>
                                            <td>${product.endDate}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${product.status == 1}">
                                                        <img class="circle" src="ViewAdmin/img/active.png" alt="Active">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="circle" src="ViewAdmin/img/inactive.png" alt="Inactive">
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${product.description}</td>
                                            <td>${product.discountAmount}00 VNĐ</td>
                                            <td>${product.condition}00 VNĐ</td>
                                            <td style="display: flex">
                                                <form action="managepromotion?service=update" method="post" >

                                                    <input type="hidden" name="id" value="${product.promoId}"/>
                                                    <button type="submit" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#updateCouponModal" >
                                                        <i class="fas fa-user-edit"></i>
                                                    </button>

                                                </form>
                                                <a class="btn btn-sm btn-danger" href="#" onclick="confirmDelete('${product.promoCode}')"> <i class="fas fa-trash-alt" style="float: right"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                        <!-- Add Promotion -->
                        <div class="modal fade" id="addPromotionModal" tabindex="-1" aria-labelledby="addPromotionModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addPromotionModalLabel">Thêm Chương Trình KM</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addPromotionForm" action="managepromotion?service=add" method="post">
                                            <div class="mb-3">
                                                <label for="promoId" class="form-label">ID</label>
                                                <input type="number" class="form-control" id="promoId" name="promoId" required>
                                                <!--<span id="promoIdError" style="color: red;"></span>-->
                                            </div>
                                            <div class="mb-3">
                                                <label for="promoCode" class="form-label">Mã Khuyến Mãi</label>
                                                <input type="text" class="form-control" id="promoCode" name="promoCode" required>
                                                <!--<span id="promoCodeError" style="color: red;"></span>-->
                                            </div>
                                            <div class="mb-3">
                                                <label for="promoName" class="form-label">Tên khuyến mãi</label>
                                                <input type="text" class="form-control" id="promoName" name="promoName" required>
                                                <!--<span id="promoNameError" style="color: red;"></span>-->
                                            </div>
                                            <div class="mb-3">
                                                <label for="start" class="form-label">Ngày bắt đầu</label>
                                                <input type="datetime-local" class="form-control" id="start" name="start" required>
                                                <!--<span id="startError" style="color: red;"></span>-->
                                            </div>
                                            <div class="mb-3">
                                                <label for="end" class="form-label">Ngày kết thúc</label>
                                                <input type="datetime-local" class="form-control" id="end" name="end" required>
                                                <!--<span id="endError" style="color: red;"></span>-->
                                            </div>
                                            <div class="mb-3">
                                                <label for="isActive" class="form-label">Trạng thái</label>
                                                <input type="checkbox" class="form-check-input" id="isActive" name="isActive">
                                            </div>
                                            <div class="mb-3">
                                                <label for="description" class="form-label">Mô tả</label>
                                                <input type="text" class="form-control" id="description" name="description" required>
                                                <!--<span id="descriptionError" style="color: red;"></span>-->
                                            </div>
                                            <div class="mb-3">
                                                <label for="discountAmount" class="form-label">Giá trị KM</label>
                                                <input type="number" class="form-control" id="discountAmount" name="discountAmount" min="0" required>
                                                <!--<span id="discountAmountError" style="color: red;"></span>-->
                                            </div>
                                            <div class="mb-3">
                                                <label for="condition" class="form-label">Đơn tối thiểu</label>
                                                <input type="number" class="form-control" id="condition" name="condition" min="0" required>
                                                <!--<span id="conditionError" style="color: red;"></span>-->
                                            </div>
                                            <button type="submit" class="btn btn-primary">Lưu</button>
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
                                        <h5 class="modal-title" id="updateCouponModal"></h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <c:set value="${requestScope.PromotionIdUpdate}" var="couponUpdate"/>
                                        <form id="updateCouponForm" action="managepromotion?service=edit" method="post">
                                            <div class="mb-3">
                                                <label for="couponid" class="form-label">ID</label>
                                                <input type="text" class="form-control" id="couponid" name="couponid" readonly value="${couponUpdate.promoId}">
                                            </div>
                                            <div class="mb-3">
                                                <label for="couponid" class="form-label">Mã Khuyến Mãi</label>
                                                <input type="text" class="form-control" id="couponcode" name="couponcode" value="${couponUpdate.promoCode}">
                                            </div>
                                            <div class="mb-3">
                                                <label for="updateCouponCode" class="form-label">Tên khuyến mãi</label>
                                                <input type="text" class="form-control" id="updateCouponCode" name="couponname" value="${couponUpdate.promoName}">
                                            </div>
                                            <div class="mb-3">
                                                <label for="updateStartDate" class="form-label">Ngày bắt đầu</label>
                                                <input type="datetime-local" class="form-control" id="updateStartDate" name="startDate" value="${couponUpdate.startDate}"  required>
                                                <!--<div id="updateStartDateError" class="form-text text-danger fst-italic"></div>-->
                                            </div>
                                            <div class="mb-3">
                                                <label for="updateEndDate" class="form-label">Ngày kết thúc</label>
                                                <input type="datetime-local" class="form-control" id="updateEndDate" name="endDate" value="${couponUpdate.endDate}"  required>
                                                <!--<div id="updateEndDateError" class="form-text text-danger fst-italic"></div>-->
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="updateQuantity">Trạng thái</label>
                                                <input type="checkbox" class="form-control" id="updateQuantity" name="status" <c:if test="${couponUpdate.status}">checked</c:if>>
                                                <!--<div id="updateQuantityError" class="form-text text-danger fst-italic"></div>-->
                                            </div> 
                                            <div class="mb-3">
                                                <label for="updateDescription" class="form-label">Mô tả</label>
                                                <input type="text" class="form-control" id="updateDescription" name="description" value="${couponUpdate.description}" required>
                                                <!--<div id="updateDescriptionError" class="form-text text-danger fst-italic"></div>-->
                                            </div>
                                            <div class="mb-3">
                                                <label for="updateDiscountAmount" class="form-label">Giá trị KM</label>
                                                <input type="number" min="0" class="form-control" id="updateDiscountAmount" name="discountAmount" value="${couponUpdate.discountAmount}"  required>
                                                <!--<div id="updateDiscountAmountError" class="form-text text-danger fst-italic"></div>-->
                                            </div>
                                            <div class="mb-3">
                                                <label for="updateDiscount" class="form-label">Đơn tối thiểu</label>
                                                <input type="number" min="0" class="form-control" id="updateDiscount" name="condition" value="${couponUpdate.condition}"  required>
                                                <!--<div id="updateDiscountAmountError" class="form-text text-danger fst-italic"></div>-->
                                            </div>

                                            <button type="submit" class="btn btn-primary">Sửa</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
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
    <!--        xử lý datatable-->
    <script>
                                                    $(document).ready(function () {
                                                        var table = $('#productTable').DataTable({
                                                            "pageLength": 5,
                                                            "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                                                            "order": [[1, "asc"]],
                                                            "columnDefs": [
                                                                {"orderable": false, "targets": 7}
                                                            ],
                                                            "dom": '<"top"l>rt<"bottom"ip><"clear">',
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

                                                    });
    </script>
    <script>
        function confirmDelete(code) {
            if (confirm("Bạn có chắc chắn muốn xóa khuyến mãi này không?")) {
                window.location = "managepromotion?service=delete&id=" + code;
            }
        }
        $(document).ready(function () {
                // Update
            <c:if test="${not empty requestScope.PromotionIdUpdate}">
                $('#updateCouponModal').modal('show');
            </c:if>
            });
    </script>
</body>

</html>
