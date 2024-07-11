
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
                                <h6 class="mb-0">Product Management</h6>
                                <form class="d-none d-md-flex ms-4" action="manager?service=search" method="post">
                                    <input type="hidden" name="service" value="search">
                                    <input class="form-control border-0" type="search" placeholder="Search" name="txt">
                                    <button style="color: black; background-color: #99ccff; border-radius: 40px;" 
                                            type="submit" class="btn btn-secondary btn-number"><i class="fa fa-search"></i></button>
                                </form>
                                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addProductModal">Add Product</button>
                            </div>
                            <table class="table text-start align-middle table-bordered table-hover mb-0" id="productTable">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                        <th scope="col">ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Short Description</th>
                                        <th scope="col">Long Description</th>
                                        <th scope="col">Address Description</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">CompName</th>
                                        <th scope="col">CategoryID</th>
                                        <th scope="col">SubCategoryID</th>
                                        <th scope="col">In Stock</th>
                                        <th scope="col">IsCustomized</th>
                                        <th scope="col">IsActive</th>
                                        <th scope="col">CreateDate</th>
                                        <th scope="col">PathImage</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listP}" var="product">

                                        <tr>
                                            <td><input class="form-check-input" type="checkbox"></td>
                                            <td>${product.productId}</td>
                                            <td>${product.productName}</td>
                                            <td>${product.shortDes}</td>
                                            <td>${product.longDes}</td>
                                            <td>${product.addDes}</td>
                                            <td>${product.price}</td>
                                            <td>${product.quantity}</td>
                                            <td>${product.companyName}</td>
                                            <td>${product.cateId}</td>
                                            <td>${product.subCateId}</td>
                                            <td>${product.sold}</td>
                                            <td>${product.isCustomized}</td>
                                            <c:choose>
                                                <c:when test="${product.isActive == true}">
                                                    <td>Active</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>NonActive</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td>${product.createDate}</td>
                                            <td>${product.pathImage}</td>
                                            <td>

                                                <form action="manager?service=update" method="post" >
                                                    <input type="hidden" name="id" value="${product.productId}"/>
                                                    <button type="submit" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#updateProductModal" >
                                                        <i class="fas fa-user-edit"></i>
                                                    </button>
                                                </form>
                                                <a class="btn btn-sm btn-danger" href="manager?service=delete&id=${product.productId}"><i class="fas fa-trash-alt"></i></a>
                                                <c:choose>
                                                    <c:when test="${product.isActive == true}">
                                                    <td><a class="btn btn-sm btn-danger" href="manager?service=delete&id=${product.productId}"><i class="fas fa-trash-alt"></i></a></td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td><button class="btn btn-sm btn-danger" disabled>   <i class="fas fa-trash-alt"></i></button></td>
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
                                    <h5 class="modal-title" id="addProductModalLabel">Add Product</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="addProductForm" action="manager?service=add" method="post" onsubmit="return validateForm()">
                                        <input type="hidden" id="productId" name="productId" value="0">
                                        <div class="mb-3">
                                            <label for="productName" class="form-label">Product Name</label>
                                            <input type="text" class="form-control" id="productName" name="productName" required>
                                            <span id="nameError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="shortDes" class="form-label">Short Description</label>
                                            <textarea class="form-control" id="shortDes" name="shortDes" required></textarea>
                                            <span id="shortDesError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="longDes" class="form-label">Long Description</label>
                                            <textarea class="form-control" id="longDes" name="longDes" required></textarea>
                                            <span id="longDesError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="addDes" class="form-label">Add Description</label>
                                            <input type="text" class="form-control" id="addDes" name="addDes" required>
                                            <span id="addDesError" style="color: red;"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="price" class="form-label">Price</label>
                                            <input type="number" class="form-control" id="price" name="price" min="0" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="quantity" class="form-label">Quantity</label>
                                            <input type="number" class="form-control" id="quantity" name="quantity" min="0" required>
                                        </div>
                                        <input type="hidden" id="size" name="size" value="0">
                                        <input type="hidden" id="color" name="color" value="0">
                                        <div class="mb-3">
                                            <label for="companyName" class="form-label">Company Name</label>
                                            <input type="text" class="form-control" id="companyName" name="companyName" required>
                                            <span id="companyNameError" style="color: red;"></span>
                                        </div>

                                        <div class="mb-3">
                                            <label for="cateId" class="form-label">Category</label>
                                            <select class="form-select" id="categId" name="cateId" required>
                                                <c:forEach items="${listCat}" var="cat">
                                                    <option value="${cat.categoryId}">${cat.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="subCateId" class="form-label">SubCategory</label>
                                            <input type="number" class="form-control" id="subCateId" name="subCateId" min="0" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="sold" class="form-label">Sold</label>
                                            <input type="number" class="form-control" id="sold" name="sold" min="0" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="isCustomized" class="form-label">Is Customized</label>
                                            <input type="checkbox" class="form-check-input" id="isCustomized" name="isCustomized">
                                        </div>
                                        <div class="mb-3">
                                            <label for="isActive" class="form-label">Active</label>
                                            <input type="checkbox" class="form-check-input" id="isActive" name="isActive">
                                        </div>

                                        <div class="mb-3">
                                            <label for="pathImage" class="form-label">PathImage</label>
                                            <input type="text" class="form-control" id="pathImage" name="pathImage" required>
                                            <span id="pathImageError" style="color: red;"></span>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- update Product Modal -->
                    <div class="modal fade" id="updateProductModal" tabindex="-1" aria-labelledby="UpdateModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="manager?service=edit" method="post">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Update Product</h4>
                                         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">

                                        <div class="form-group">
                                            <label for="productId">Product ID</label>
                                            <input type="number" class="form-control" id="productId" name="productId" value="${product.productId}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="productName">Product Name</label>
                                            <input type="text" class="form-control" id="productName" name="productName" value="${product.productName}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="shortDes">Short Description</label>
                                            <textarea class="form-control" id="shortDes" name="shortDes" required>${product.shortDes}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="longDes">Long Description</label>
                                            <textarea class="form-control" id="longDes" name="longDes" required>${product.longDes}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="addDes">Address Description</label>
                                            <input type="text" class="form-control" id="addDes" name="addDes" value="${product.addDes}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="price">Price</label>
                                            <input type="number" class="form-control" id="price" name="price" value="${product.price}" min="0" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="quantity">Quantity</label>
                                            <input type="number" class="form-control" id="quantity" name="quantity" value="${product.quantity}" min="0" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="size">Size</label>
                                            <input type="text" class="form-control" id="size" name="size" value="${product.size}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="color">Color</label>
                                            <input type="text" class="form-control" id="color" name="color" value="${product.color}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="companyName">Company Name</label>
                                            <input type="text" class="form-control" id="companyName" name="companyName" value="${product.companyName}" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="cateId" class="form-label">Category</label>
                                            <select class="form-select" id="cateId" name="cateId" required>
                                                <c:forEach items="${listCat}" var="cat">
                                                    <option value="${cat.categoryId}" ${cat.categoryId == product.cateId ? 'selected' : ''}>${cat.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="subCateId">SubCategory</label>
                                            <input type="number" class="form-control" id="subCateId" name="subCateId" value="${product.subCateId}" min="0" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="sold">In Stock</label>
                                            <input type="number" class="form-control" id="sold" name="sold" value="${product.sold}" min="0" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="isCustomized">Is Customized</label>
                                            <input type="checkbox" class="form-check-input" id="isCustomized" name="isCustomized" <c:if test="${product.isCustomized}">checked</c:if>>
                                            </div>
                                            <div class="form-group">
                                                <label for="isActive">Active</label>
                                                <input type="checkbox" class="form-check-input" id="isActive" name="isActive" <c:if test="${product.isActive}">checked</c:if>>
                                            </div>
                                            <div class="form-group">
                                                <label for="createDate">Create Date</label>
                                                <input type="text" class="form-control" id="createDate" name="createDate" value="${product.createDate}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="pathImage">PathImage</label>
                                            <input type="text" class="form-control" id="pathImage" name="pathImage" value="${product.pathImage}" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-success" value="Update">
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
                                                    {"orderable": false, "targets": 17}
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
                    document.getElementById("nameError").innerHTML = "Product name must not be empty.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("nameError").innerHTML = "Product name should not start with a space.";
                } else {
                    document.getElementById("nameError").innerHTML = "";
                }
            };
            document.getElementById("shortDes").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("shortDesError").innerHTML = "Short Description name must not be empty.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("shortDesError").innerHTML = "Short Description should not start with a space.";
                } else {
                    document.getElementById("shortDesError").innerHTML = "";
                }
            };
            document.getElementById("longDes").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("longDesError").innerHTML = "Long Description name must not be empty.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("longDesError").innerHTML = "Long Description should not start with a space.";
                } else {
                    document.getElementById("longDesError").innerHTML = "";
                }
            };
            document.getElementById("addDes").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("addDesError").innerHTML = "Address Description name must not be empty.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("addDesError").innerHTML = "Address Description should not start with a space.";
                } else {
                    document.getElementById("addDesError").innerHTML = "";
                }
            };
            document.getElementById("companyName").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("companyNameError").innerHTML = "Company name must not be empty.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("companyNameError").innerHTML = "Company name should not start with a space.";
                } else {
                    document.getElementById("companyNameError").innerHTML = "";
                }
            };
            document.getElementById("pathImage").oninput = function () {
                var name = this.value;
                this.value = name;
                if (name === "") {
                    document.getElementById("pathImageError").innerHTML = "PathImage must not be empty.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("pathImageError").innerHTML = "PathImage should not start with a space.";
                } else {
                    document.getElementById("pathImageError").innerHTML = "";
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
            var pathImage = document.getElementById("pathImage").value;

            name = name.trim().replace(/\s+/g, ' ');
            document.getElementById("productName").value = name;

            if (name === "" || /^\s/.test(name)) {
                document.getElementById("nameError").innerHTML = "Product name should not start with a space and must not be empty.";
                isValid = false;
            }
            if (shortDes === "" || /^\s/.test(shortDes)) {
                document.getElementById("shortDesError").innerHTML = "Short Description should not start with a space and must not be empty.";
                isValid = false;
            }
            if (longDes === "" || /^\s/.test(longDes)) {
                document.getElementById("longDesError").innerHTML = "Long Description should not start with a space and must not be empty.";
                isValid = false;
            }
            if (addDes === "" || /^\s/.test(addDes)) {
                document.getElementById("addDesError").innerHTML = "Address Description should not start with a space and must not be empty.";
                isValid = false;
            }
            if (companyName === "" || /^\s/.test(companyName)) {
                document.getElementById("companyNameError").innerHTML = "Company name should not start with a space and must not be empty.";
                isValid = false;
            }
            if (pathImage === "" || /^\s/.test(pathImage)) {
                document.getElementById("pathImageError").innerHTML = "PathImage should not start with a space and must not be empty.";
                isValid = false;
            }

            return isValid;
        }


    </script>




</body>

</html>
