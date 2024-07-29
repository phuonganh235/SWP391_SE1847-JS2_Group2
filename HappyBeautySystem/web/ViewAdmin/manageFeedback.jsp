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
                            <h6 class="mb-0">Quản lý phản hồi</h6>
                            <a href="managefeedback">Show All</a>
                        </div>
                        <!-- Load Product -->
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0" id="abouttable">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">ID</th>
                                        <th scope="col">Sản phẩm</th>
                                        <th scope="col">Nhận xét</th>
                                        <th scope="col">Độ hài lòng</th>  
                                        <th scope="col">Ngày tạo</th>  
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="feedback" items="${requestScope.feedback}">
                                        <tr>
                                            <td>${feedback.feedbackId}</td>
                                            <td>${feedback.productId}</td>
                                            <td>${feedback.comment}</td>
                                            <td>${feedback.rating}</td>
                                            <td>${feedback.createdAt}</td>

<!--                                            <td>
                                                <a class="btn btn-sm btn-primary" href="manageabout?service=update&id=${about.aboutId}">Update</a>
                                                <a class="btn btn-sm btn-danger" href="manageabout?service=delete&id=${about.aboutId}">Delete</a>
                                                <form action="manageabout?service=update" method="post" style="display: inline;">
                                                    <input type="hidden" name="id" value="${about.aboutId}"/>
                                                    <button type="submit" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#updateCategoryModal">
                                                        <i class="fas fa-user-edit"></i>
                                                    </button>
                                                </form>
                                                <a class="btn btn-sm btn-danger" href="manageabout?service=delete&id=${about.aboutId}" onclick="confirmDelete(${about.aboutId})"><i class="fas fa-trash-alt"></i></a>
                                            </td>-->
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
                <!-- Feedback Management End -->
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
