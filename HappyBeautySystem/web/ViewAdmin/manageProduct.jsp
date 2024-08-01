
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
                                <h6 class="mb-0">Quản lý sản phẩm</h6>
                                <form class="d-none d-md-flex ms-4" action="manager?service=search" method="post">
                                    <input type="hidden" name="service" value="search">
                                    <input class="form-control border-0" type="search" placeholder="Tìm kiếm" name="txt">
                                    <button style="color: black; background-color: #99ccff; border-radius: 40px;" 
                                            type="submit" class="btn btn-secondary btn-number"><i class="fa fa-search"></i></button>
                                </form>
                                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addProductModal">Thêm Sản Phẩm</button>
                            </div>
                            <table class="table text-start align-middle table-bordered table-hover mb-0" id="productTable">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">ID</th>
                                        <th scope="col">Tên</th>
                                        <th scope="col">Giá</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Phân loại</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Ngày tạo</th>
                                        <th scope="col">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listP}" var="product">
                                        <tr>
                                            <td>${product.productId}</td>
                                            <td>${product.productName}</td>
                                            <td>${product.price}</td>
                                            <td>${product.quantity}</td>
                                            <td>
                                                <c:forEach items="${listCat}" var="category">
                                                    <c:if test="${category.categoryId == product.cateId}">
                                                        ${category.categoryName}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${product.isActive == true}">
                                                        Active
                                                    </c:when>
                                                    <c:otherwise>
                                                        NonActive
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${product.createDate}</td>
                                            <td>
                                                <form action="manager?service=update" method="post" style="display: inline;">
                                                    <input type="hidden" name="id" value="${product.productId}"/>
                                                    <button type="submit" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#updateProductModal">
                                                        <i class="fas fa-user-edit"></i>
                                                    </button>
                                                </form>
                                                <c:choose>
                                                    <c:when test="${product.isActive == true}">
                                                        <a class="btn btn-sm btn-danger" href="manager?service=delete&id=${product.productId}"><i class="fas fa-trash-alt"></i></a>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <button class="btn btn-sm btn-danger" disabled><i class="fas fa-trash-alt"></i></button>
                                                        </c:otherwise>
                                                    </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>


                            </table>
                        </div>
                    </div>

                    <!-- Add Product -->
                    <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addProductModalLabel">Thêm sản phẩm</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="addProductForm" action="manager?service=add" method="post" onsubmit="return validateForm()">
                                        <input type="hidden" id="productId" name="productId" value="0">
                                        <div class="mb-3">
                                            <label for="productName" class="form-label">Tên</label>
                                            <input type="text" class="form-control" id="productName" name="productName" required>
                                            <span id="nameError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="shortDes" class="form-label">Mô tả ngắn</label>
                                            <textarea class="form-control" id="shortDes" name="shortDes" required></textarea>
                                            <span id="shortDesError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="longDes" class="form-label">Mô tả chi tiết</label>
                                            <textarea class="form-control" id="longDes" name="longDes" ></textarea>
                                            <span id="longDesError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="addDes" class="form-label">Nguồn gốc</label>
                                            <input type="text" class="form-control" id="addDes" name="addDes" required>
                                            <span id="addDesError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="price" class="form-label">Giá</label>
                                            <input type="number" class="form-control" id="price" name="price" min="0" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="quantity" class="form-label">Số lượng</label>
                                            <input type="number" class="form-control" id="quantity" name="quantity" min="0" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="size" class="form-label">Kích thước</label>
                                            <input type="text" class="form-control" id="size" name="size" required>
                                            <span id="sizeError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="color" class="form-label">Màu</label>
                                            <input type="text" class="form-control" id="color" name="color" required>
                                            <span id="colorError" style="color: red;"></span>
                                        </div>

                                        <div class="mb-3">
                                            <label for="companyName" class="form-label">Tên công ty</label>
                                            <input type="text" class="form-control" id="companyName" name="companyName" required>
                                            <span id="companyNameError" style="color: red;"></span>
                                        </div>

                                        <div class="mb-3">
                                            <label for="cateId" class="form-label">Phân loại</label>
                                            <select class="form-select" id="categId" name="cateId" required>
                                                <c:forEach items="${listCat}" var="cat">
                                                    <option value="${cat.categoryId}">${cat.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <input type="hidden" class="form-control" id="subCateId" name="subCateId" value="0" required>
                                        <input type="hidden" class="form-control" id="sold" name="sold" value="0" required>
                                        <input type="hidden" class="form-check-input" id="isCustomized" name="isCustomized" value="0">
                                        <div class="mb-3">
                                            <label for="isActive" class="form-label">Trạng thái</label>
                                            <input type="checkbox" class="form-check-input" id="isActive" name="isActive">
                                        </div>

                                        <div class="mb-3">
                                            <label for="pathImage" class="form-label">Ảnh</label>
                                            <input type="file" class="form-control" id="pathImage" name="pathImage" onchange="loadImg1(this, event)" required>
                                            <span id="pathImageError" style="color: red;"></span>
                                            <img src="" alt="lỗi ảnh" class="loadImage"/> 
                                            <input type="hidden" name="srcImg" class="srcImg"/>
                                        </div>

                                        <script>
                                            function loadImg1(input, event) {
                                                var file = input.files[0];
                                                var pathImageError = document.getElementById('pathImageError');
                                                var loadImage = document.querySelector('.loadImage');

                                                if (file) {
                                                    var fileName = file.name;
                                                    var fileExtension = fileName.split('.').pop().toLowerCase();

                                                    if (['jpg', 'jpeg', 'png', 'gif'].includes(fileExtension)) {
                                                        var reader = new FileReader();

                                                        reader.onload = function (e) {
                                                            loadImage.src = e.target.result;
                                                        }

                                                        reader.readAsDataURL(file);
                                                        pathImageError.textContent = ''; // Clear error message if file is valid
                                                    } else {
                                                        pathImageError.textContent = 'Chỉ được tải lên các tệp hình ảnh (jpg, jpeg, png, gif).';
                                                        input.value = ''; // Clear the input value to prevent form submission with invalid file
                                                        loadImage.src = ''; // Clear the image preview
                                                    }
                                                } else {
                                                    pathImageError.textContent = 'Vui lòng chọn một tệp hình ảnh.';
                                                    loadImage.src = ''; // Clear the image preview
                                                }
                                            }
                                        </script>


                                        <button type="submit" class="btn btn-primary">Lưu</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>



                    <!-- update Product Modal -->
                    <div class="modal fade" id="updateProductModal" tabindex="-1" aria-labelledby="UpdateModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form id="updateProductForm" action="manager?service=edit" method="post" onsubmit="return validateForm('update')">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Cập nhật sản phẩm</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <c:set value="${requestScope.product}" var="product"/>
                                    <div class="modal-body">
                                        <input type="hidden" id="productId" name="productId" value="${product.productId}" readonly>
                                        <div class="mb-3">
                                            <label for="updateProductName" class="form-label">Tên</label>
                                            <input type="text" class="form-control" id="updateProductName" name="productName" value="${product.productName}" required>
                                            <span id="updateNameError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="updateShortDes" class="form-label">Mô tả ngắn</label>
                                            <textarea class="form-control" id="updateShortDes" name="shortDes" required>${product.shortDes}</textarea>
                                            <span id="updateShortDesError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="updateLongDes" class="form-label">Mô tả chi tiết</label>
                                            <textarea class="form-control" id="updateLongDes" name="longDes" required>${product.longDes}</textarea>
                                            <span id="updateLongDesError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="updateAddDes" class="form-label">Nguồn gốc</label>
                                            <input type="text" class="form-control" id="updateAddDes" name="addDes" value="${product.addDes}" required>
                                            <span id="updateAddDesError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="updatePrice" class="form-label">Giá</label>
                                            <input type="number" class="form-control" id="updatePrice" name="price" value="${product.price}" min="0" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="updateQuantity" class="form-label">Số lượng</label>
                                            <input type="number" class="form-control" id="updateQuantity" name="quantity" value="${product.quantity}" min="0" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="updateSize" class="form-label">Kích thước</label>
                                            <input type="text" class="form-control" id="updateSize" name="size" value="${product.size}" required>
                                            <span id="updateSizeError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="updateColor" class="form-label">Màu</label>
                                            <input type="text" class="form-control" id="updateColor" name="color" value="${product.color}" required>
                                            <span id="updateColorError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="updateCompanyName" class="form-label">Tên công ty</label>
                                            <input type="text" class="form-control" id="updateCompanyName" name="companyName" value="${product.companyName}" required>
                                            <span id="updateCompanyNameError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="updateCateId" class="form-label">Phân loại</label>
                                            <select class="form-select" id="updateCateId" name="cateId" required>
                                                <c:forEach items="${listCat}" var="cat">
                                                    <option value="${cat.categoryId}" ${cat.categoryId == product.cateId ? 'selected' : ''}>${cat.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <input type="hidden" class="form-control" id="updateSubCateId" name="subCateId" value="${product.subCateId}" required>
                                        <input type="hidden" class="form-control" id="updateSold" name="sold" value="${product.sold}" required>
                                        <input type="hidden" class="form-check-input" id="updateIsCustomized" name="isCustomized" value="${product.isCustomized}">
                                        <div class="mb-3">
                                            <label for="updateIsActive" class="form-label">Trạng thái</label>
                                            <input type="checkbox" class="form-check-input" id="updateIsActive" name="isActive" <c:if test="${product.isActive}">checked</c:if>>
                                            </div>
                                            <div class="mb-3">
                                                <label for="createDate" class="form-label">Ngày tạo</label>
                                                <input type="text" class="form-control" id="createDate" name="createDate" value="${product.createDate}" readonly>
                                        </div>
                                        <div class="mb-3">
                                            <label for="updatePathImage" class="form-label">Ảnh</label>
                                            <img src="${product.pathImage}" alt="Lỗi ảnh" class="loadImage"/>
                                            <input type="file" class="form-control" onchange="loadImgupdate(this, event)">
                                            <span id="updatePathImageError" style="color: red;"></span>
                                            <input type="hidden" name="pathImage" class="srcImg" value="${product.pathImage}"/>
                                        </div>

                                        <script>
                                            function loadImgupdate(input, event) {
                                                var file = input.files[0];
                                                var pathImageError = document.getElementById('updatePathImageError');
                                                var loadImage = document.querySelector('.loadImage');

                                                if (file) {
                                                    var fileName = file.name;
                                                    var fileExtension = fileName.split('.').pop().toLowerCase();

                                                    if (['jpg', 'jpeg', 'png', 'gif'].includes(fileExtension)) {
                                                        var reader = new FileReader();

                                                        reader.onload = function (e) {
                                                            loadImage.src = e.target.result;
                                                        }

                                                        reader.readAsDataURL(file);
                                                        pathImageError.textContent = ''; // Clear error message if file is valid
                                                    } else {
                                                        pathImageError.textContent = 'Chỉ được tải lên các tệp hình ảnh (jpg, jpeg, png, gif).';
                                                        input.value = ''; // Clear the input value to prevent form submission with invalid file
                                                        loadImage.src = ''; // Clear the image preview
                                                    }
                                                } else {
                                                    pathImageError.textContent = 'Vui lòng chọn một tệp hình ảnh.';
                                                    loadImage.src = ''; // Clear the image preview
                                                }
                                            }
                                        </script>

                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-success" value="Cập nhật">
                                    </div>
                                </form>
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
        function loadImg(target, e) {
            console.log(target);
            console.log(e.target.files[0]);
            let file = e.target.files[0];
            let img = target.parentNode.querySelector(".loadImage");
            if (file && file.type.match("image.*")) {
                let reader = new FileReader();
                reader.onload = function (e) {
                    img.src = e.target.result;
                    target.parentNode.querySelector(".srcImg").value = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        }

    </script>
    <!--Mở modal update-->
    <script>
        $(document).ready(function () {
            // Update
        <c:if test="${not empty requestScope.product}">
            $('#updateProductModal').modal('show');
        </c:if>
        });
    </script>


    <script>
        document.addEventListener("DOMContentLoaded", function () {
            function formatFullName(name) {
                name = name.trim().replace(/\s+/g, ' ');
                return name;
            }

            document.getElementById("productName").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("nameError").innerHTML = "Tên sản phẩm không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("nameError").innerHTML = "Tên sản phẩm không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("nameError").innerHTML = "";
                }
            };
            document.getElementById("shortDes").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("shortDesError").innerHTML = "Mô tả ngắn không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("shortDesError").innerHTML = "Mô tả ngắn không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("shortDesError").innerHTML = "";
                }
            };
            document.getElementById("longDes").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
//                    document.getElementById("longDesError").innerHTML = "Mô tả chi tiết không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("longDesError").innerHTML = "Mô tả chỉ tiết không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("longDesError").innerHTML = "";
                }
            };
            document.getElementById("addDes").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("addDesError").innerHTML = "Mô tả nguồn gốc không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("addDesError").innerHTML = "Mô tả nguồn gốc không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("addDesError").innerHTML = "";
                }
            };
            document.getElementById("size").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("sizeError").innerHTML = "Kích thước không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("sizeError").innerHTML = "Kích thước không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("sizeError").innerHTML = "";
                }
            };
            document.getElementById("color").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("colorError").innerHTML = "Màu không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("colorError").innerHTML = "Màu không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("colorError").innerHTML = "";
                }
            };
            document.getElementById("companyName").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("companyNameError").innerHTML = "Tên công ty không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("companyNameError").innerHTML = "Tên công ty không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("companyNameError").innerHTML = "";
                }
            };

        });


        var numberFields = ["price", "quantity", "subCateId", "sold"];

        numberFields.forEach(function (fieldId) {
            var field = document.getElementById(fieldId);
            field.addEventListener("input", function () {
                if (this.value < 0) {
                    this.value = 0;
                }
            });
        });

        function validateForm() {
            var isValid = true;

            var name = document.getElementById("productName").value;
            var shortDes = document.getElementById("shortDes").value;
            var longDes = document.getElementById("longDes").value;
            var addDes = document.getElementById("addDes").value;
            var companyName = document.getElementById("companyName").value;

            name = name.trim().replace(/\s+/g, ' ');
            document.getElementById("productName").value = name;

            if (name === "" || /^\s/.test(name)) {
                document.getElementById("nameError").innerHTML = "Tên sản phẩm không được bắt đầu bằng dấu cách và không được để trống.";
                isValid = false;
            }
            if (shortDes === "" || /^\s/.test(shortDes)) {
                document.getElementById("shortDesError").innerHTML = "Mô tả ngắn không được bắt đầu bằng dấu cách và không được để trống.";
                isValid = false;
            }
            if (longDes === "" || /^\s/.test(longDes)) {
                document.getElementById("longDesError").innerHTML = "Mô tả chi tiết không được bắt đầu bằng dấu cách và không được để trống.";
                isValid = false;
            }
            if (addDes === "" || /^\s/.test(addDes)) {
                document.getElementById("addDesError").innerHTML = "Mô tả nguồn gốc không được bắt đầu bằng dấu cách và không được để trống.";
                isValid = false;
            }
            if (companyName === "" || /^\s/.test(companyName)) {
                document.getElementById("companyNameError").innerHTML = "Tên công ty không được bắt đầu bằng dấu cách và không được để trống.";
                isValid = false;
            }


            return isValid;
        }
        document.addEventListener("DOMContentLoaded", function () {
            function validateUpdateForm() {
                var isValid = true;

                var name = document.getElementById("updateProductName").value;
                var shortDes = document.getElementById("updateShortDes").value;
                var longDes = document.getElementById("updateLongDes").value;
                var addDes = document.getElementById("updateAddDes").value;
                var companyName = document.getElementById("updateCompanyName").value;


                name = name.trim().replace(/\s+/g, ' ');
                document.getElementById("updateProductName").value = name;

                if (name === "" || /^\s/.test(name)) {
                    document.getElementById("updateNameError").innerHTML = "Tên sản phẩm không được bắt đầu bằng dấu cách và không được để trống.";
                    isValid = false;
                }
                if (shortDes === "" || /^\s/.test(shortDes)) {
                    document.getElementById("updateShortDesError").innerHTML = "Mô tả ngắn không được bắt đầu bằng dấu cách và không được để trống.";
                    isValid = false;
                }
                if (longDes === "" || /^\s/.test(longDes)) {
                    document.getElementById("updateLongDesError").innerHTML = "Mô tả chi tiết không được bắt đầu bằng dấu cách và không được để trống.";
                    isValid = false;
                }
                if (addDes === "" || /^\s/.test(addDes)) {
                    document.getElementById("updateAddDesError").innerHTML = "Mô tả nguồn gốc không được bắt đầu bằng dấu cách và không được để trống.";
                    isValid = false;
                }
                if (companyName === "" || /^\s/.test(companyName)) {
                    document.getElementById("updateCompanyNameError").innerHTML = "Tên công ty không được bắt đầu bằng dấu cách và không được để trống.";
                    isValid = false;
                }


                return isValid;
            }

            // Attach the validateUpdateForm function to the update form submission
            document.getElementById("updateProductForm").onsubmit = function () {
                return validateUpdateForm();
            };

            // Update form input validations
            document.getElementById("updateProductName").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("updateNameError").innerHTML = "Tên sản phẩm không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("updateNameError").innerHTML = "Tên sản phẩm không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("updateNameError").innerHTML = "";
                }
            };
            document.getElementById("updateShortDes").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("updateShortDesError").innerHTML = "Mô tả ngắn không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("updateShortDesError").innerHTML = "Mô tả ngắn không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("updateShortDesError").innerHTML = "";
                }
            };
            document.getElementById("updateLongDes").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("updateLongDesError").innerHTML = "Mô tả chi tiết không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("updateLongDesError").innerHTML = "Mô tả chi tiết không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("updateLongDesError").innerHTML = "";
                }
            };
            document.getElementById("updateAddDes").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("updateAddDesError").innerHTML = "Mô tả nguồn gốc không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("updateAddDesError").innerHTML = "Mô tả nguồn gốc không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("updateAddDesError").innerHTML = "";
                }
            };
            document.getElementById("updateSize").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("updateSizeError").innerHTML = "Kích thước không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("updateSizeError").innerHTML = "Kích thước được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("updateSizeError").innerHTML = "";
                }
            };
            document.getElementById("updateColor").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("updateColorError").innerHTML = "Màu không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("updateColorError").innerHTML = "Màu không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("updateColorError").innerHTML = "";
                }
            };
            document.getElementById("updateCompanyName").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("updateCompanyNameError").innerHTML = "Tên công ty không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("updateCompanyNameError").innerHTML = "Tên công ty không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("updateCompanyNameError").innerHTML = "";
                }
            };

        });

    </script>

</body>

</html>
