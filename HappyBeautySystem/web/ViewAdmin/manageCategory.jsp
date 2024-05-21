
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
                    <form class="d-none d-md-flex ms-4">
                        <input class="form-control border-0" type="search" placeholder="Search">
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
                            <h6 class="mb-0">Category Management</h6>
                            <a href="manageCategory">Show All</a>
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

                        <!-- Add Product -->
                        <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addProductModalLabel">Add Category</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="managercategory?service=add" method="post">
                                            <div class="mb-3">
                                                <label for="productId" class="form-label">Category ID</label>
                                                <input type="number" class="form-control" id="categoryId" name="categoryId" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="productName" class="form-label">Category Name</label>
                                                <input type="text" class="form-control" id="categoryName" name="categoryName" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="shortDes" class="form-label">Category ImageUrl</label>
                                                <textarea class="form-control" id="categoryImageUrl" name="categoryImageUrl" required></textarea>
                                            </div>
                                            
                                            <div class="mb-3">
                                                <label for="isActive" class="form-label">Is Active</label>
                                                <input type="checkbox" class="form-check-input" id="isActive" name="isActive">
                                            </div>
                                            <div class="mb-3">
                                                <label for="createDate" class="form-label">Create Date</label>
                                                <input type="date" class="form-control" id="createDate" name="createDate" required>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Add Category</button>
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
    </body>

</html>
