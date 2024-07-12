<%-- 
    Document   : viewAccountShipper
    Created on : May 27, 2024, 4:17:18 PM
    Author     : phuan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Bootstrap Admin Template</title>
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
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <!-- datatable -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
        <style>
            .circle {
                height: 10px;
                width: 10px;
                border-radius: 50%;
            }
            #tableShipper {
                width: 100% !important;
                margin-bottom: 1rem;
                color: #212529;
                border-collapse: collapse;
            }
            #tableShipper th,
            #tableShipper td {
                padding: 0.75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }
            #tableShipper thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
                background-color: #f8f9fa;
            }
            #tableShipper tbody tr:nth-of-type(odd) {
                background-color: rgba(0, 0, 0, 0.05);
            }
            #tableShipper tbody tr:hover {
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

                <!-- list all staff Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addAccountShipperModal">Tạo tài khoản  Shipper</button>
                            <h6 class="mb-0 text-center"> Quản lý tải khoản Shipper</h6>

                            <div class="d-flex" style="margin-top: 10px">
                                <input class="form-control border-0 me-2" id="searchInput" type="text" placeholder="Tìm kiếm">
                                <button style="color: black; background-color: #99ccff; border-radius: 40px;" id="searchButton" class="btn btn-outline-secondary" ><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                        <!-- Load account Shipper -->
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0" id="tableShipper">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">ID</th>
                                        <th scope="col">Họ và Tên</th>
                                        <th scope="col">Số điện thoại</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Địa chỉ</th>                                       
                                        <th scope="col">Ngày tạo</th>
                                        <th scope="col">Sinh nhật</th>
                                        <th scope="col">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.dataShipper}" var="dataShipper">
                                        <tr>

                                            <td>${dataShipper.userId}</td>
                                            <td>${dataShipper.name}</td>
                                            <td>${dataShipper.mobile}</td>
                                            <td>${dataShipper.email}</td>
                                            <td>${dataShipper.address}</td>
                                            <td>${dataShipper.createDate}</td> 
                                            <td>${dataShipper.dateofbirth}</td>
                                            <td>
                                                <form action="manageAccountAdmin" method="post" style="display:inline;">
                                                    <input type="hidden" name="service" value="updateShipper"/>
                                                    <input type="hidden" name="id" value="${dataShipper.userId}"/>
                                                    <button type="submit" class="btn btn-sm btn-primary">
                                                        <i class="fas fa-user-edit"></i>
                                                    </button>
                                                </form>
                                                <a href="#" onclick="doDeleteShipper('${dataShipper.userId}')"> <i class="fas fa-trash-alt"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Add Account -->
                        <div class="modal fade" id="addAccountShipperModal" tabindex="-1" aria-labelledby="addAccountShipperModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addAccountShipperModal">Tạo tài khoản  Shipper</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="redirectToListAllShipper()"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addShipperForm" action="manageAccountAdmin?service=insertShipper" method="post">
                                            <div class="mb-3">
                                                <label for="name" class="form-label">Họ và Tên</label>
                                                <input type="text" class="form-control" id="name" name="name" value="${not empty param.name ? param.name : ''}" required>
                                                <div id="nameError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="username" class="form-label">Tài khoản</label>
                                                <input type="text" class="form-control" id="username" name="username" value="${not empty param.username ? param.username : ''}"required>
                                                <div id="usernameError" class="form-text text-danger fst-italic"></div>
                                                <c:if test="${not empty requestScope.errorUsrNameExit}">
                                                    <div class="alert alert-danger" role="alert">
                                                        ${requestScope.errorUsrNameExit}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="mb-3">
                                                <label for="email" class="form-label">Email</label>
                                                <input type="email" class="form-control" id="email" name="email" value="${not empty param.email ? param.email : ''}" required>
                                                <div id="emailError" class="form-text text-danger fst-italic"></div>
                                                <c:if test="${not empty requestScope.errorEmailExit}">
                                                    <div class="alert alert-danger" role="alert">
                                                        ${requestScope.errorEmailExit}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="mb-3">
                                                <label for="mobile" class="form-label">Số điện thoại</label>
                                                <input type="tel" class="form-control" id="mobile" name="mobile" value="${not empty param.mobile ? param.mobile : ''}" required>
                                                <div id="mobileError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="address" class="form-label">Địa chỉ</label>
                                                <input type="text" class="form-control" id="address" name="address" value="${not empty param.address ? param.address : ''}" required>
                                                <div id="addressError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="birth" class="form-label">Sinh nhật</label>
                                                <input type="date" class="form-control" id="birth" name="birth" value="${not empty param.birth ? param.birth : ''}" required>
                                                <div id="addressError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="password" class="form-label">Mật khẩu</label>
                                                <input type="password" class="form-control" id="password" name="password" value="${not empty param.password ? param.password : ''}" required>
                                                <div id="passwordError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Tạo</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- update account Shipper -->
                        <div class="modal fade" id="updateAccountShipperModal" tabindex="-1" aria-labelledby="updateAccountShipperModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="updateAccountShipperModal">Chỉnh sửa tài khoản Shipper</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="redirectToListAllShipper()"></button>
                                    </div>
                                    <div class="modal-body">
                                        <c:set value="${requestScope.dataShipperUpdate}" var="dataShipper"/>
                                        <form id="formShipperUpdate" action="manageAccountAdmin?service=eiditShipper" method="post">
                                            <div class="mb-3">
                                                <label for="id">ID</label>
                                                <input type="text" class="form-control" id="id" name="staffId" value="${dataShipper.userId}" readonly="">
                                            </div>
                                            <div class="mb-3">
                                                <label for="updateName" class="form-label">Họ và Tên</label>
                                                <input type="text" class="form-control" id="updateName" name="name" value="${not empty param.name ? param.name : dataShipper.name}" required>
                                                <div id="updateNameError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="updateUsername" class="form-label">Tài khoản</label>
                                                <input type="text" class="form-control" id="updateUsername" name="username" value="${not empty param.username ? param.username : dataShipper.username}"required>
                                                <div id="updateUsernameError" class="form-text text-danger fst-italic"></div>
                                                <c:if test="${not empty requestScope.errorUsrNameExit}">
                                                    <div class="alert alert-danger" role="alert">
                                                        ${requestScope.errorUsrNameExit}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="mb-3">
                                                <label for="updateEmail" class="form-label">Email</label>
                                                <input type="email" class="form-control" id="updateEmail" name="email" value="${not empty param.email ? param.email : dataShipper.email}" required>
                                                <div id="updateEmailError" class="form-text text-danger fst-italic"></div>
                                                <c:if test="${not empty requestScope.errorEmailExit}">
                                                    <div class="alert alert-danger" role="alert">
                                                        ${requestScope.errorEmailExit}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="mb-3">
                                                <label for="updateMobile" class="form-label">Số điện thoại</label>
                                                <input type="number" class="form-control" id="updateMobile" name="mobile" value="${not empty param.mobile ? param.mobile : dataShipper.mobile}" required>
                                                <div id="updateMobileError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="updateAddress" class="form-label">Địa chỉ</label>
                                                <input type="text" class="form-control" id="updateAddress" name="address" value="${not empty param.address ? param.address : dataShipper.address}" required>
                                                <div id="updateAddressError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="birth" class="form-label">Sinh nhật</label>
                                                <input type="date" class="form-control" id="birth" name="birth" value="${not empty param.birth ? param.birth : dataShipper.dateofbirth}" required>
                                                <div id="addressError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="updatePassword" class="form-label">Mật khẩu</label>
                                                <input type="password" class="form-control" id="updatePassword" name="password" value="${not empty param.password ? param.password : dataShipper.password}"  required>
                                                <div id="updatePasswordError" class="form-text text-danger fst-italic"></div>
                                            </div>              
                                            <div class="modal-footer">
                                                <input type="submit" class="btn btn-success" value="Sửa">
                                            </div>
                                        </form>
                                    </div>
                                </div>
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
        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
        <!-- Template Javascript -->
        <script src="js/main.js"></script>

        <script>
                                            $(document).ready(function () {
                                                var table = $('#tableShipper').DataTable({
                                                    "pageLength": 5,
                                                    "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                                                    "order": [[0, "asc"]],
                                                    "columnDefs": [
                                                        {"orderable": false, "targets": 7}
                                                    ],
                                                    "dom": '<"top"l>rt<"bottom"ip><"clear">', // Ẩn thanh tìm kiếm mặc định
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

                                                // Kết nối thanh tìm kiếm tùy chỉnh với DataTable
                                                $('#searchInput').on('keyup', function () {
                                                    table.search(this.value).draw();
                                                });

                                                // Xử lý tìm kiếm khi nhấn nút tìm kiếm
                                                $('#searchButton').on('click', function () {
                                                    table.search($('#searchInput').val()).draw();
                                                });

                                                // Xử lý tìm kiếm khi nhấn Enter trong ô tìm kiếm
                                                $('#searchInput').on('keypress', function (e) {
                                                    if (e.which == 13) {  // 13 là mã phím cho Enter
                                                        table.search(this.value).draw();
                                                    }
                                                });
                                            });
        </script>

        <script>function doDeleteShipper(userId) {
                if (confirm("Bạn có muốn xóa tài khoản Shipper với ID là : " + userId)) {
                    window.location = "manageAccountAdmin?service=deleteShipper&idShipper=" + userId;
                }
            }

            $(document).ready(function () {
                // Insert
            <c:if test="${not empty requestScope.errorUsrNameExit || not empty requestScope.errorEmailExit}">
                $('#addAccountShipperModal').modal('show');
            </c:if>
                // Update
            <c:if test="${not empty requestScope.dataShipperUpdate}">
                $('#updateAccountShipperModal').modal('show');
            </c:if>
            });

            function redirectToListAllShipper() {
                window.location.href = 'manageAccountAdmin?service=ListAllShipper';
            }


// validate form
            document.addEventListener('DOMContentLoaded', function () {
                var formShipperAdd = document.getElementById('addShipperForm');
                var formShipperUpdate = document.getElementById('formShipperUpdate');

                var nameAdd = document.getElementById('name');
                var usernameAdd = document.getElementById('username');
                var emailAdd = document.getElementById('email');
                var mobileAdd = document.getElementById('mobile');
                var addressAdd = document.getElementById('address');
                var passwordAdd = document.getElementById('password');

                var nameUpdate = document.getElementById('updateName');
                var usernameUpdate = document.getElementById('updateUsername');
                var emailUpdate = document.getElementById('updateEmail');
                var mobileUpdate = document.getElementById('updateMobile');
                var addressUpdate = document.getElementById('updateAddress');
                var passwordUpdate = document.getElementById('updatePassword');

                var nameAddError = document.getElementById('nameError');
                var usernameAddError = document.getElementById('usernameError');
                var emailAddError = document.getElementById('emailError');
                var mobileAddError = document.getElementById('mobileError');
                var addressAddError = document.getElementById('addressError');
                var passwordAddError = document.getElementById('passwordError');

                var nameUpdateError = document.getElementById('updateNameError');
                var usernameUpdateError = document.getElementById('updateUsernameError');
                var emailUpdateError = document.getElementById('updateEmailError');
                var mobileUpdateError = document.getElementById('updateMobileError');
                var addressUpdateError = document.getElementById('updateAddressError');
                var passwordUpdateError = document.getElementById('updatePasswordError');

                var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                var mobilePattern = /^(?:\+84|0)(3|5|7|8|9)[0-9]{8}$/;
                var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

                function validateField(field, errorElement, pattern, errorMessage) {
                    var value = field.value.trim();
                    if (value === '' || value.replace(/\s/g, '').length === 0) {
                        errorElement.innerHTML = 'Trường này không được để trống hoặc chỉ chứa khoảng trắng.';
                        return false;
                    } else if (pattern && !pattern.test(value)) {
                        errorElement.innerHTML = errorMessage;
                        return false;
                    } else {
                        errorElement.innerHTML = '';
                        return true;
                    }
                }

                function validateForm(form, nameField, usernameField, emailField, mobileField, addressField, passwordField,
                        nameError, usernameError, emailError, mobileError, addressError, passwordError) {
                    let isValid = true;
                    isValid = validateField(nameField, nameError) && isValid;
                    isValid = validateField(usernameField, usernameError) && isValid;
                    isValid = validateField(emailField, emailError, emailPattern, 'Email không hợp lệ.Email có dạng ***@gamil.com') && isValid;
                    isValid = validateField(mobileField, mobileError, mobilePattern, 'Số điện thoại không hợp lệ.số điện thoại là các số điện thoại ở VN vd: 03, 09....') && isValid;
                    isValid = validateField(addressField, addressError) && isValid;
                    isValid = validateField(passwordField, passwordError, passwordPattern, 'Mật khẩu phải dài ít nhất 8 ký tự và bao gồm ít nhất một chữ cái, một số và một ký tự đặc biệt.') && isValid;
                    return isValid;
                }

                if (formShipperAdd) {
                    [nameAdd, usernameAdd, emailAdd, mobileAdd, addressAdd, passwordAdd].forEach(field => {
                        field.addEventListener('input', function () {
                            validateField(this, document.getElementById(this.id + 'Error'),
                                    this.id === 'email' ? emailPattern :
                                    this.id === 'mobile' ? mobilePattern :
                                    this.id === 'password' ? passwordPattern : null,
                                    this.id === 'email' ? 'Email không hợp lệ.Email có dạng ***@gamil.com' :
                                    this.id === 'mobile' ? 'Số điện thoại không hợp lệ.số điện thoại là các số điện thoại ở VN vd: 03, 09....' :
                                    this.id === 'password' ? 'Mật khẩu phải dài ít nhất 8 ký tự và bao gồm ít nhất một chữ cái, một số và một ký tự đặc biệt.' : '');
                        });
                    });

                    formShipperAdd.addEventListener('submit', function (e) {
                        if (!validateForm(this, nameAdd, usernameAdd, emailAdd, mobileAdd, addressAdd, passwordAdd,
                                nameAddError, usernameAddError, emailAddError, mobileAddError, addressAddError, passwordAddError)) {
                            e.preventDefault();
                        }
                    });
                }

                if (formShipperUpdate) {
                    [nameUpdate, usernameUpdate, emailUpdate, mobileUpdate, addressUpdate, passwordUpdate].forEach(field => {
                        field.addEventListener('input', function () {
                            validateField(this, document.getElementById(this.id + 'Error'),
                                    this.id === 'updateEmail' ? emailPattern :
                                    this.id === 'updateMobile' ? mobilePattern :
                                    this.id === 'updatePassword' ? passwordPattern : null,
                                    this.id === 'updateEmail' ? 'Email không hợp lệ.' :
                                    this.id === 'updateMobile' ? 'Số điện thoại không hợp lệ.' :
                                    this.id === 'updatePassword' ? 'Mật khẩu phải dài ít nhất 8 ký tự và bao gồm ít nhất một chữ cái, một số và một ký tự đặc biệt.' : '');
                        });
                    });

                    formShipperUpdate.addEventListener('submit', function (e) {
                        if (!validateForm(this, nameUpdate, usernameUpdate, emailUpdate, mobileUpdate, addressUpdate, passwordUpdate,
                                nameUpdateError, usernameUpdateError, emailUpdateError, mobileUpdateError, addressUpdateError, passwordUpdateError)) {
                            e.preventDefault();
                        }
                    });
                }
            });

        </script>


    </body>

</html>
