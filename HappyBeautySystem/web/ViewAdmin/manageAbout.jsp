<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            #abouttable {
                width: 100% !important;
                margin-bottom: 1rem;
                color: #212529;
                border-collapse: collapse;
            }
            #abouttable th,
            #abouttable td {
                padding: 0.75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }
            #abouttable thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
                background-color: #f8f9fa;
            }
            #abouttable tbody tr:nth-of-type(odd) {
                background-color: rgba(0, 0, 0, 0.05);
            }
            #abouttable tbody tr:hover {
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

                <!-- Product Management Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Quản lý giới thiệu</h6>
                            <a href="manageabout">Show All</a>
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addProductModal">Thêm giới thiệu</button>
                        </div>
                        <!-- Load Product -->
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0" id="abouttable">
                                <thead>
                                    <tr class="text-dark">

                                        <th scope="col">ID</th>
                                        <th scope="col">Tiêu đề</th>
                                        <th scope="col">Nội dung</th>

                                        <th scope="col">Chức năng</th>  
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="about" items="${requestScope.about}">
                                        <tr>
                                            <td>${about.aboutId}</td>
                                            <td>${about.title}</td>
                                            <td>${about.content}</td>

                                            <td>
<!--                                                <a class="btn btn-sm btn-primary" href="manageabout?service=update&id=${about.aboutId}">Update</a>
                                                <a class="btn btn-sm btn-danger" href="manageabout?service=delete&id=${about.aboutId}">Delete</a>-->
                                                <form action="manageabout?service=update" method="post" style="display: inline;">
                                                    <input type="hidden" name="id" value="${about.aboutId}"/>
                                                    <button type="submit" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#updateCategoryModal">
                                                        <i class="fas fa-user-edit"></i>
                                                    </button>
                                                </form>
                                                <a class="btn btn-sm btn-danger" href="manageabout?service=delete&id=${about.aboutId}" onclick="confirmDelete(${about.aboutId})"><i class="fas fa-trash-alt"></i></a>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- Add About -->
                        <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addProductModalLabel">Thêm giới thiệu</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addCategoryForm" action="manageabout?service=add" method="post" onsubmit="return validateForm()">
                                            <input type="hidden" id="aboutId" name="aboutId" value="0">
                                            <div class="mb-3">
                                                <label for="title" class="form-label">Tiêu đề</label>
                                                <input type="text" class="form-control" id="title" name="title" required>
                                                <span id="titleError" style="color: red;"></span>
                                            </div>
                                            <div class="mb-3">
                                                <label for="content" class="form-label">Nội dung</label>
                                                <input type="text" class="form-control" id="content" name="content" required>
                                                <span id="contentError" style="color: red;"></span>
                                            </div>
                                            <div class="mb-3">
                                                <input type="file" class="form-control" id="imageURL" name="imageURL" onchange="loadImg(this, event)" required>
                                                <span id="pathImageError" style="color: red;"></span>
                                                <img src=""  alt="Lỗi ảnh" class="loadImage"/> 
                                                <input type="hidden" name="srcImg" class="srcImg"/>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Lưu</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Update About Modal -->
                        <div class="modal fade" id="updateCategoryModal" tabindex="-1" aria-labelledby="UpdateModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="manageabout?service=edit" method="post" onsubmit="return validateUpdateForm()">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Cập nhật giới thiệu</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <c:set value="${requestScope.aboutUpdate}" var="about" />
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="aboutId">ID</label>
                                                <input type="number" class="form-control" id="aboutId" name="aboutId" value="${about.aboutId}" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label for="updateTitle">Tiêu đề</label>
                                                <input type="text" class="form-control" id="updateTitle" name="title" value="${about.title}" required>
                                                <span id="titleUpdateError" style="color: red;"></span>
                                            </div>
                                            <div class="form-group">
                                                <label for="updateContent">Nội dung</label>
                                                <input type="text" class="form-control" id="updateContent" name="content" value="${about.content}" required>
                                                <span id="contentUpdateError" style="color: red;"></span>
                                            </div>
                                            <div class="form-group">
                                                <label for="updateImageURL" class="form-label">Ảnh</label>
                                                <img src="${about.imageURL}" alt="Lỗi ảnh" class="loadImage"/>
                                                <input type="file" class="form-control" onchange="loadImg(this, event)">
                                                <input type="hidden" name="imageURL" class="srcImg" value="${about.imageURL}"/>
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
                <!-- About Management End -->

            </div>
            <!-- Content End -->

            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>
        <!--
               Update About -->




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
        <script>
                                                    $(document).ready(function () {
                                                        var table = $('#abouttable').DataTable({
                                                            "pageLength": 5,
                                                            "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                                                            "order": [[1, "asc"]],
                                                            "columnDefs": [
                                                                {"orderable": false, "targets": 3}
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
                        console.log(target.parentNode.querySelector(".srcImg").value);
                    }
                    reader.readAsDataURL(file);
                }
            }

        </script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                function formatFullName(name) {
                    name = name.trim().replace(/\s+/g, ' ');
                    return name;
                }

                document.getElementById("title").oninput = function () {
                    var name = this.value;
                    this.value = name;
                    if (name === "") {
                        document.getElementById("titleError").innerHTML = "Tiêu đề không được để trống.";
                    } else if (/^\s/.test(name)) {
                        document.getElementById("titleError").innerHTML = "Tiêu đề không được bắt đầu bằng dấu cách.";
                    } else {
                        document.getElementById("titleError").innerHTML = "";
                    }
                };
                document.getElementById("content").oninput = function () {
                    var name = this.value;
                    this.value = name;
                    if (name === "") {
                        document.getElementById("contentError").innerHTML = "Nội dung không được để trống.";
                    } else if (/^\s/.test(name)) {
                        document.getElementById("contentError").innerHTML = "Nội dung không được bắt đầu bằng dấu cách.";
                    } else {
                        document.getElementById("contentError").innerHTML = "";
                    }
                };
            });

            // Update form validation
            document.getElementById("updateTitle").oninput = function () {
                var name = this.value;
                this.value = name.trim();
                if (name === "") {
                    document.getElementById("titleUpdateError").innerHTML = "Tiêu đề không được để trống.";
                } else if (/^\s/.test(name)) {
                    document.getElementById("titleUpdateError").innerHTML = "Tiêu đề không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("titleUpdateError").innerHTML = "";
                }
            };

            document.getElementById("updateContent").oninput = function () {
                var content = this.value;
                this.value = content.trim();
                if (content === "") {
                    document.getElementById("contentUpdateError").innerHTML = "Nội dung không được để trống.";
                } else if (/^\s/.test(content)) {
                    document.getElementById("contentUpdateError").innerHTML = "Nội dung không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("contentUpdateError").innerHTML = "";
                }
            };
            function confirmDelete(id) {
                if (confirm("Bạn có chắc chắn muốn xóa không?")) {
                    window.location.href = `manageabout?service=delete&id=${id}`;
                }
            }
        </script>

        <script>
            $(document).ready(function () {
                // Update
            <c:if test="${not empty requestScope.aboutUpdate}">
                $('#updateCategoryModal').modal('show');
            </c:if>
            });
        </script>
    </body>

</html>
