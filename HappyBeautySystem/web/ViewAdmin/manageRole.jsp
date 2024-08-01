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
                            <h6 class="mb-0" style="text-align: center; font-size: 25px">Quản lý vai trò cho người dùng</h6>
                            <a href="manageRole">Tất cả</a>
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addRoleModal">Thêm mới vai trò</button>
                        </div>
                        <!-- Load Product -->
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0" id="abouttable">
                                <thead>
                                    <tr class="text-dark">
                                        <th></th>
                                        <th scope="col">Mã Vai Trò</th>
                                        <th scope="col">Tên Vai Trò</th>
                                        <th scope="col">Hành Động</th>  
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="about" items="${requestScope.about}">
                                        <tr>
                                            <td><input class="form-check-input" type="checkbox"></td>
                                            <td>${about.getRoleId()}</td>
                                            <td>${about.getRoleName()}</td>
                                            <td>
                                                <form action="manageRole?service=update" method="post" style="display: inline;">
                                                    <input type="hidden" name="id" value="${about.getRoleId()}"/>
                                                    <button type="submit" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#updateCategoryModal">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                </form>
                                                <a class="btn btn-sm btn-danger" href="#" onclick="confirmDelete('${about.getRoleId()}')"> <i class="fas fa-trash-alt" style="float: right"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- Add Role -->
                        <div class="modal fade" id="addRoleModal" tabindex="-1" aria-labelledby="addRoleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addRoleModalLabel">Thêm vai trò người dùng</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addCategoryForm" action="manageRole?service=add" method="post" onsubmit="return validateForm()">
                                            <!--<input type="hidden" id="aboutId" name="aboutId" value="0">-->
                                            <div class="mb-3">
                                                <label for="title" class="form-label">Mã vai trò</label>
                                                <input type="text" class="form-control" id="title" name="title" required>
                                                <span id="titleError" style="color: red;"></span>
                                            </div>
                                            <div class="mb-3">
                                                <label for="content" class="form-label">Tên vai trò</label>
                                                <input type="text" class="form-control" id="content" name="content" required>
                                                <span id="contentError" style="color: red;"></span>
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
                                    <form action="manageRole?service=edit" method="post" onsubmit="return validateUpdateForm()">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Cập nhật vai trò</h4>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <c:set value="${requestScope.aboutUpdate}" var="about" />
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label for="updateTitle">Mã vai trò</label>
                                                <input type="text" class="form-control" name="title" value="${about.getRoleId()}" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label for="updateContent">Tên vai trò</label>
                                                <input type="text" class="form-control" id="updateContent" name="content" value="${about.getRoleName()}" required>
                                                <span id="contentUpdateError" style="color: red;"></span>
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
            document.addEventListener("DOMContentLoaded", function () {
                function formatFullName(name) {
                    name = name.trim().replace(/\s+/g, ' ');
                    return name;
                }

                document.getElementById("title").oninput = function () {
                    var name = this.value;
                    this.value = name;
                    if (name === "") {
                        document.getElementById("titleError").innerHTML = "Mã không được để trống.";
                    } else if (/^\s/.test(name)) {
                        document.getElementById("titleError").innerHTML = "Mã không được bắt đầu bằng dấu cách.";
                    } else {
                        document.getElementById("titleError").innerHTML = "";
                    }
                };
                document.getElementById("content").oninput = function () {
                    var name = this.value;
                    this.value = name;
                    if (name === "") {
                        document.getElementById("contentError").innerHTML = "Tên không được để trống.";
                    } else if (/^\s/.test(name)) {
                        document.getElementById("contentError").innerHTML = "Tên không được bắt đầu bằng dấu cách.";
                    } else {
                        document.getElementById("contentError").innerHTML = "";
                    }
                };
            });

            // Update form validation
            document.getElementById("updateContent").oninput = function () {
                var content = this.value;
                this.value = content;
                if (content === "") {
                    document.getElementById("contentUpdateError").innerHTML = "Tên không được để trống.";
                } else if (/^\s/.test(content)) {
                    document.getElementById("contentUpdateError").innerHTML = "Tên không được bắt đầu bằng dấu cách.";
                } else {
                    document.getElementById("contentUpdateError").innerHTML = "";
                }
            };

            function confirmDelete(roleid) {
                if (confirm("Bạn có chắc chắn muốn xóa vai trò này không?")) {
                    window.location = "manageRole?service=delete&id=" + roleid;
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
