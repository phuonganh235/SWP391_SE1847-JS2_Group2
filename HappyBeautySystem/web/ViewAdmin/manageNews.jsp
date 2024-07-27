<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet" %>
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
        <!-- datatable -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
        <style>
            .circle {
                height: 10px;
                width: 10px;
                border-radius: 50%;
            }
            #categorytable {
                width: 100% !important;
                margin-bottom: 1rem;
                color: #212529;
                border-collapse: collapse;
            }
            #categorytable th,
            #categorytable td {
                padding: 0.75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }
            #categorytable thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
                background-color: #f8f9fa;
            }
            #categorytable tbody tr:nth-of-type(odd) {
                background-color: rgba(0, 0, 0, 0.05);
            }
            #categorytable tbody tr:hover {
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
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Quản lý bài viết</h6>
                            <!--   Seach Form    -->
                            <form class="d-none d-md-flex ms-4" action="managercategory?service=search" method="post">
                                <input type="hidden" name="service" value="search">
                                <input class="form-control border-0" type="search" placeholder="Search" name="txt">
                                <button style="color: black; background-color: #99ccff; border-radius: 40px;" 
                                        type="submit" class="btn btn-secondary btn-number"><i class="fa fa-search"></i></button>
                            </form>
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addProductModal">Thêm bài viết</button>
                        </div>
                        <!-- Load product Product -->
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0" id="categorytable">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                        <th scope="col">ID</th>
                                        <th scope="col">Tiêu đề</th>
                                        <th scope="col">Nội dung</th>
                                        <th scope="col">Ảnh</th>
                                        <th scope="col">Danh mục</th>
                                        <th scope="col">Ngày tạo</th>
                                        <th scope="col">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="news" items="${newsList}">
                                        <c:if test="${news.isActive}">
                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                            <div class="blog__item">
                                                <div class="blog__item__pic large__item">
                                                    <img src="${news.imgUrl}" alt="${news.title}">
                                                </div>
                                                <div class="blog__item__text">
                                                    <h6><a href="newsdetail?service=viewNewsDetail&newsID=${news.newsId}">${news.title}</a></h6>
                                                    <ul>
                                                        <li>${news.createTime}</li>
                                                        <li>Category: ${news.categoryID}</li>
                                                        <li>Updated: ${news.updateTime}</li>
                                                        <li>Active: ${news.isActive}</li>
                                                        <li>Confirmed: ${news.isConfirm}</li>
                                                    </ul>
                                                    <p>${news.content}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Add Category -->
                        <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addnews">Thêm bài viết</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addNewsForm" action="managenews?service=addnews" method="post">
                                            <input type="hidden" id="NewsID" name="NewsID" value="0">
                                            <div class="mb-3">
                                                <label for="title" class="form-label">Tiêu đề</label>
                                                <input type="text" class="form-control" id="title" name="title" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="content" class="form-label">Nội dung</label>
                                                <textarea class="form-control" id="content" name="content" required></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label for="ImageURL" class="form-label">Ảnh URL</label>
                                                <input type="text" class="form-control" id="ImageURL" name="ImageURL" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="CategoryID" class="form-label">Danh mục</label>
                                                <select class="form-control" name="CategoryID" id="CategoryID">
                                                    <c:forEach var="category" items="${categories}">
                                                        <option value="${category.categoryId}">${category.categoryName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="isActive" class="form-label">Kích hoạt</label>
                                                <input type="checkbox" class="form-check-input" id="isActive" name="isActive">
                                            </div>
                                            <button type="submit" class="btn btn-primary">Lưu</button>
                                            <button type="reset" class="btn btn-secondary">Đặt lại</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- update-->
                        <div class="modal fade" id="updateCategoryModal" tabindex="-1" aria-labelledby="UpdateModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="managercategory?service=edit" method="post">
                                        <div class="modal-header">						
                                            <h4 class="modal-title">Cập nhật danh mục</h4>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <c:set value="${requestScope.cat}" var="cat"/>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="categoryId">ID</label>
                                                <input type="number" class="form-control" id="categoryId" name="categoryId" value="${cat.categoryId}" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label for="categoryName">Tên</label>
                                                <input type="text" class="form-control" id="categoryName" name="categoryName" value="${cat.categoryName}" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="categoryImageUrl">Ảnh</label>
                                                <input type="text" class="form-control" id="categoryImageUrl" name="categoryImageUrl" value="${cat.categoryImageUrl}" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="isActive">Trạng thái</label>
                                                <input type="checkbox" class="form-check-input" id="isActive" name="isActive" <c:if test="${cat.isActive}">checked</c:if>>
                                                </div>
                                                <div class="form-group">
                                                    <label for="createDate">Ngày tạo</label>
                                                    <input type="text" class="form-control" id="createDate" name="createDate" value="${cat.createDate}" readonly>
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
        <script src="ViewAdmin/js/main.js"></script>
        <!--Mở modal update-->

        <script>
            $(document).ready(function () {
                var table = $('#categorytable').DataTable({
                    "pageLength": 5,
                    "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                    "order": [[1, "asc"]],
                    "columnDefs": [
                        {"orderable": false, "targets": 5}
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
            $(document).ready(function () {
                // Update
            <c:if test="${not empty requestScope.cat}">
                $('#updateCategoryModal').modal('show');
            </c:if>
            });
        </script>
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
