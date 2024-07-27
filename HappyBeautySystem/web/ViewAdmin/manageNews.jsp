<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Manage News - Bootstrap Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
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
    <!-- DataTable -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    <style>
        /* Your custom styles here */
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

            <!-- News Management Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Quản lý bài viết</h6>
                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addNewsModal">Thêm bài viết</button>
                    </div>

                    <c:if test="${not empty message}">
                        <div class="alert alert-info">${message}</div>
                    </c:if>

                    <!-- News Table -->
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0" id="newstable">
                            <thead>
                                <tr class="text-dark">
                                    <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                    <th scope="col">ID</th>
                                    <th scope="col">Tiêu đề</th>
                                    <th scope="col">Nội dung</th>
                                    <th scope="col">Ảnh</th>
                                    <th scope="col">Danh mục</th>
                                    <th scope="col">Ngày tạo</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col">Chức năng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="news" items="${newsList}">
                                    <tr>
                                        <td><input class="form-check-input" type="checkbox"></td>
                                        <td>${news.newsId}</td>
                                        <td>${news.title}</td>
                                        <td>${news.content}</td>
                                        <td><img src="${news.imgUrl}" alt="${news.title}" style="width: 50px; height: 50px;"></td>
                                        <td>${news.categoryName}</td>
                                        <td>${news.createTime}</td>
                                        <td>${news.isActive ? 'Hiện' : 'Ẩn'}</td>
                                        <td>
                                            <button onclick="openEditModal(${news.newsId})" class="btn btn-sm btn-primary">Sửa</button>
                                            <a href="managenews?service=hidenews&newsId=${news.newsId}" class="btn btn-sm btn-warning">${news.isActive ? 'Ẩn' : 'Hiện'}</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Edit News Modal -->
                    <div class="modal fade" id="editNewsModal" tabindex="-1" aria-labelledby="editNewsModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editNewsModalLabel">Sửa bài viết</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="editNewsForm" action="managenews?service=editnews" method="post">
                                        <input type="hidden" id="editNewsId" name="newsId">
                                        <div class="mb-3">
                                            <label for="editTitle" class="form-label">Tiêu đề</label>
                                            <input type="text" class="form-control" id="editTitle" name="title" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="editContent" class="form-label">Nội dung</label>
                                            <textarea class="form-control" id="editContent" name="content" required></textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label for="editImageURL" class="form-label">Ảnh URL</label>
                                            <input type="text" class="form-control" id="editImageURL" name="imgUrl" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="editCategoryID" class="form-label">Danh mục</label>
                                            <select class="form-control" name="categoryId" id="editCategoryID">
                                                <c:forEach var="category" items="${categories}">
                                                    <option value="${category.categoryId}">${category.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="editIsActive" class="form-label">Kích hoạt</label>
                                            <input type="checkbox" class="form-check-input" id="editIsActive" name="isActive">
                                        </div>
                                        <button type="submit" name="submit" class="btn btn-primary">Lưu</button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Add News Modal -->
            <div class="modal fade" id="addNewsModal" tabindex="-1" aria-labelledby="addNewsModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addNewsModalLabel">Thêm bài viết</h5>
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
                                    <input type="text" class="form-control" id="ImageURL" name="imgUrl" required>
                                </div>
                                <div class="mb-3">
                                    <label for="CategoryID" class="form-label">Danh mục</label>
                                    <select class="form-control" name="categoryId" id="CategoryID">
                                        <c:forEach var="category" items="${categories}">
                                            <option value="${category.categoryId}">${category.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="isActive" class="form-label">Kích hoạt</label>
                                    <input type="checkbox" class="form-check-input" id="isActive" name="isActive">
                                </div>
                                <button type="submit" name="submit" class="btn btn-primary">Lưu</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
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
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

    <!-- Template Javascript -->
    <script src="ViewAdmin/js/main.js"></script>

    <script>
        $(document).ready(function () {
            $('#newstable').DataTable({
                "pageLength": 10,
                "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                "order": [[1, "asc"]],
                "columnDefs": [
                    {"orderable": false, "targets": [0, 8]}
                ],
                "language": {
                    "lengthMenu": "Hiển thị _MENU_ mục",
                    "info": "Hiển thị _START_ đến _END_ trong số _TOTAL_ mục",
                    "paginate": {
                        "first": "Đầu",
                        "last": "Cuối",
                        "next": "Tiếp",
                        "previous": "Trước"
                    }
                }
            });
        });

        function openEditModal(newsId) {
            $.ajax({
                url: "managenews",
                type: "GET",
                data: {
                    service: "getNewsById",
                    newsId: newsId
                },
                success: function (data) {
                    console.log(data); // Check the data received
                    var news = JSON.parse(data);
                    $('#editNewsId').val(news.newsId);
                    $('#editTitle').val(news.title);
                    $('#editContent').val(news.content);
                    $('#editImageURL').val(news.imgUrl);
                    $('#editCategoryID').val(news.categoryId); // Ensure this matches the backend field name
                    $('#editIsActive').prop('checked', news.isActive);
                    $('#editNewsModal').modal('show');
                },
                error: function () {
                    alert('Failed to fetch news details.');
                }
            });
        }

        $('#editNewsForm').submit(function (e) {
            e.preventDefault();
            $.ajax({
                url: $(this).attr('action'),
                type: 'POST',
                data: $(this).serialize(),
                success: function (response) {
                    $('#editNewsModal').modal('hide');
                    location.reload();
                },
                error: function () {
                    alert('Failed to update news.');
                }
            });
        });
    </script>
</body>
</html>
