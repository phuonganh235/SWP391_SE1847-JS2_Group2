
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
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">

            <!-- Sidebar Start -->
            <jsp:include page="sidebar.jsp"/>
            <!-- Sidebar End -->

            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                    <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                    </a>
                    <a href="#" class="sidebar-toggler flex-shrink-0">
                        <i class="fa fa-bars"></i>
                    </a>
                    <form class="d-none d-md-flex ms-4" action="manager?service=search" method="post">
                        <input type="hidden" name="service" value="search">
                        <input class="form-control border-0" type="search" placeholder="Search" name="txt">
                        <button type="submit" class="btn btn-primary ms-2">Search</button>
                    </form>
                    <div class="navbar-nav align-items-center ms-auto">
                        <!-- Message Dropdown -->
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-envelope me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Message</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <!-- Message Items -->
                            </div>
                        </div>
                        <!-- Notification Dropdown -->
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-bell me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Notification</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <!-- Notification Items -->
                            </div>
                        </div>
                        <!-- User Dropdown -->
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex">John Doe</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">My Profile</a>
                                <a href="#" class="dropdown-item">Settings</a>
                                <a href="#" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->

                <!-- Product Management Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Product Management</h6>
                            <a href="manager">Show All</a>
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addProductModal">Add Product</button>
                        </div>
                        <!-- Load Product -->
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                        <th scope="col">ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">ShortDes</th>
                                        <th scope="col">LongDes</th>
                                        <th scope="col">AddDes</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">CompName</th>
                                        <th scope="col">CategoryID</th>
                                        <th scope="col">SubCategoryID</th>
                                        <th scope="col">Sold</th>
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
                                            <td>${product.isActive}</td>
                                            <td>${product.createDate}</td>
                                            <td>${product.pathImage}</td>
                                            <td>
                                                <a class="btn btn-sm btn-primary" href="manager?service=update&id=${product.productId}">Update</a>
                                                <a class="btn btn-sm btn-danger" href="manager?service=delete&id=${product.productId}">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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
                                                <label for="isActive" class="form-label">Is Active</label>
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

                    </div>
                </div>
                <!-- Product Management End -->

            </div>
            <!-- Content End -->

            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

        numberFields.forEach(function(fieldId) {
            var field = document.getElementById(fieldId);
            field.addEventListener("input", function() {
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
