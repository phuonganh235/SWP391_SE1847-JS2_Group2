
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
                <jsp:include page="navbarAdmin.jsp"/>
                <!-- Navbar End -->

                <!-- Product Management Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Category Management</h6>
                            <!--   Seach Form    -->
                            <form class="d-none d-md-flex ms-4" action="managercategory?service=search" method="post">
                                <input type="hidden" name="service" value="search">
                                <input class="form-control border-0" type="search" placeholder="Search" name="txt">
                                <button style="color: black; background-color: #99ccff; border-radius: 40px;" 
                                        type="submit" class="btn btn-secondary btn-number"><i class="fa fa-search"></i></button>
                            </form>
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addProductModal">Add Category</button>
                        </div>
                        <!-- Load product Product -->
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                        <th scope="col">ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">IsActive</th>
                                        <th scope="col">Create Date</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listCat}" var="cat">
                                        <tr>
                                            <td><input class="form-check-input" type="checkbox"></td>
                                            <td>${cat.categoryId}</td>
                                            <td>${cat.categoryName}</td>
                                            <td>${cat.categoryImageUrl}</td>
                                            <td>${cat.isActive}</td>
                                            <td>${cat.createDate}</td>
                                            <td>
                                                <a class="btn btn-sm btn-primary" href="managercategory?service=update&id=${cat.categoryId}">Update</a>
                                                <a class="btn btn-sm btn-danger" href="managercategory?service=delete&id=${cat.categoryId}">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Add Category -->
                        <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addProductModalLabel">Add Category</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addCategoryForm" action="managercategory?service=add" method="post" onsubmit="return validateForm()">
                                            <input type="hidden" id="categoryId" name="categoryId" value="0">
                                            <div class="mb-3">
                                                <label for="categoryName" class="form-label">Category Name</label>
                                                <input type="text" class="form-control" id="categoryName" name="categoryName" required>
                                                <span id="nameError" style="color: red;"></span>
                                            </div>
                                            <div class="mb-3">
                                                <label for="categoryImageUrl" class="form-label">Category ImageUrl</label>
                                                <textarea class="form-control" id="categoryImageUrl" name="categoryImageUrl" required></textarea>
                                                <span id="urlError" style="color: red;"></span>
                                            </div>

                                            <div class="mb-3">
                                                <label for="isActive" class="form-label">Is Active</label>
                                                <input type="checkbox" class="form-check-input" id="isActive" name="isActive">
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

                                                document.getElementById("categoryName").oninput = function () {
                                                    var name = this.value; // Không cần loại bỏ dấu cách ở đây
                                                    this.value = name;
                                                    if (name === "") {
                                                        document.getElementById("nameError").innerHTML = "Category name must not be empty.";
                                                    } else if (/^\s/.test(name)) {
                                                        document.getElementById("nameError").innerHTML = "Category name should not start with a space.";
                                                    } else {
                                                        document.getElementById("nameError").innerHTML = "";
                                                    }
                                                };
                                                document.getElementById("categoryImageUrl").oninput = function () {
                                                    var name = this.value;
                                                    this.value = name;
                                                    if (name === "") {
                                                        document.getElementById("urlError").innerHTML = "Category Image Url name must not be empty.";
                                                    } else if (/^\s/.test(name)) {
                                                        document.getElementById("urlError").innerHTML = "Category Image Url should not start with a space.";
                                                    } else {
                                                        document.getElementById("urlError").innerHTML = "";
                                                    }
                                                };
                                            });


        </script>
    </body>

</html>
