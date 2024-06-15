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
                    <!--                    search-->
                    <form class="d-none d-md-flex ms-4" action="manageAccountAdmin?service=search" method="post">
                        <input type="hidden" name="service" value="search">
                        <input class="form-control border-0" type="search" placeholder="Search by name" name="search" value="${requestScope.valueSearch}">
                        <button type="submit" class="btn btn-primary ms-2">Search</button>
                    </form>
                    <div class="navbar-nav align-items-center ms-auto">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-envelope me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Message</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item text-center">See all message</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-bell me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Notificatin</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Profile updated</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">New user added</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Password changed</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item text-center">See all notifications</a>
                            </div>
                        </div>
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



                <!-- list all staff Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0 text-center"> Management account staff</h6>
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addAccountStaffModal">Add Account Staff</button>
                        </div>
                        <!-- Load account staff -->
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">ID</th>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">CreateDate</th>
                                        <th scope="col">Birthday</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.dataStaff}" var="dataStaff">
                                        <tr>

                                            <td>${dataStaff.userId}</td>
                                            <td>${dataStaff.name}</td>
                                            <td>${dataStaff.mobile}</td>
                                            <td>${dataStaff.email}</td>
                                            <td>${dataStaff.address}</td>
                                            <td>${dataStaff.createDate}</td>
                                            <td>${dataStaff.dateofbirth}</td>
                                            <td>
                                                <form action="manageAccountAdmin" method="post" style="display:inline;">
                                                    <input type="hidden" name="service" value="update"/>
                                                    <input type="hidden" name="id" value="${dataStaff.userId}"/>
                                                    <button type="submit" class="btn btn-sm btn-primary">
                                                        <i class="fas fa-user-edit"></i>
                                                    </button>
                                                </form>
                                                <a href="#" onclick="doDeleteStaff('${dataStaff.userId}')"> <i class="fas fa-trash-alt"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Add Account -->
                        <div class="modal fade" id="addAccountStaffModal" tabindex="-1" aria-labelledby="addAccountStaffModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addAccountStaffModal">Add Account Staff</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="redirectToListAllStaff()"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addStaffForm" action="manageAccountAdmin?service=insertStaff" method="post" >
                                            <div class="mb-3">
                                                <label for="name" class="form-label">Full Name</label>
                                                <input type="text" class="form-control" id="name" name="name" value="${not empty param.name ? param.name : ''}" required>
                                                <div id="nameError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="username" class="form-label">User Name</label>
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
                                                <label for="mobile" class="form-label">Phone</label>
                                                <input type="tel" class="form-control" id="mobile" name="mobile" value="${not empty param.mobile ? param.mobile : ''}" required>
                                                <div id="mobileError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="address" class="form-label">Address</label>
                                                <input type="text" class="form-control" id="address" name="address" value="${not empty param.address ? param.address : ''}" required>
                                                <div id="addressError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="birth" class="form-label">Date of birth</label>
                                                <input type="date" class="form-control" id="birth" name="birth" value="${not empty param.birth ? param.birth : ''}" required>
                                                <div id="addressError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="password" class="form-label">Password</label>
                                                <input type="password" class="form-control" id="password" name="password" value="${not empty param.password ? param.password : ''}" required>
                                                <div id="passwordError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Add</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- update account Staff -->
                        <div class="modal fade" id="updateAccountStaffModal" tabindex="-1" aria-labelledby="updateAccountStaffModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="updateAccountStaffModal">Update Account Staff</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="redirectToListAllStaff()"></button>
                                    </div>
                                    <div class="modal-body">
                                        <c:set value="${requestScope.StaffidUpdate}" var="staff"/>
                                        <form id="updateStaffForm" action="manageAccountAdmin?service=edit" method="post">
                                            <div class="form-group">
                                                <label for="id">ID</label>
                                                <input type="text" class="form-control" id="id" name="staffId" value="${staff.userId}" readonly="">
                                            </div>

                                            <div class="mb-3">
                                                <label for="name" class="form-label">Full Name</label>
                                                <input type="text" class="form-control" id="name" name="name" value="${not empty param.name ? param.name : staff.name}" required>
                                                <div id="nameError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="username" class="form-label">User Name</label>
                                                <input type="text" class="form-control" id="username" name="username" value="${not empty param.username ? param.username : staff.username}"required>
                                                <div id="usernameError" class="form-text text-danger fst-italic"></div>
                                                <c:if test="${not empty requestScope.errorUsrNameExit}">
                                                    <div class="alert alert-danger" role="alert">
                                                        ${requestScope.errorUsrNameExit}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="mb-3">
                                                <label for="email" class="form-label">Email</label>
                                                <input type="email" class="form-control" id="email" name="email" value="${not empty param.email ? param.email : staff.email}" required>
                                                <div id="emailError" class="form-text text-danger fst-italic"></div>
                                                <c:if test="${not empty requestScope.errorEmailExit}">
                                                    <div class="alert alert-danger" role="alert">
                                                        ${requestScope.errorEmailExit}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="mb-3">
                                                <label for="mobile" class="form-label">Phone</label>
                                                <input type="tel" class="form-control" id="mobile" name="mobile" value="${not empty param.mobile ? param.mobile : staff.mobile}" required>
                                                <div id="mobileError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="address" class="form-label">Address</label>
                                                <input type="text" class="form-control" id="address" name="address" value="${not empty param.address ? param.address : staff.address}" required>
                                                <div id="addressError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="birth" class="form-label">Date of birth</label>
                                                <input type="date" class="form-control" id="birth" name="birth" value="${not empty param.birth ? param.birth : staff.dateofbirth}" required>
                                                <div id="addressError" class="form-text text-danger fst-italic"></div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="password" class="form-label">Password</label>
                                                <input type="password" class="form-control" id="password" name="password" value="${not empty param.password ? param.password : staff.password}"  required>
                                                <div id="passwordError" class="form-text text-danger fst-italic"></div>
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
                </div>
            </div>
            <!-- Content End -->

            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script>
                                            //function delete
                                            function doDeleteStaff(userId) {
                                                if (confirm("are you sure to delete StaffID = " + userId)) {
                                                    window.location = "manageAccountAdmin?service=delete&id=" + userId;
                                                }
                                            }


                                            $(document).ready(function () {
                                                // Insert
            <c:if test="${not empty requestScope.errorUsrNameExit || not empty requestScope.errorEmailExit}">
                                                $('#addAccountStaffModal').modal('show');
            </c:if>
                                                // Update
            <c:if test="${not empty requestScope.StaffidUpdate}">
                                                $('#updateAccountStaffModal').modal('show');
            </c:if>
                                            });

                                            function togglePassword(id) {
                                                var passwordField = document.getElementById('password' + id);
                                                var passwordType = passwordField.getAttribute('type');
                                                if (passwordType === 'password') {
                                                    passwordField.setAttribute('type', 'text');
                                                } else {
                                                    passwordField.setAttribute('type', 'password');
                                                }
                                            }

                                            function redirectToListAllStaff() {
                                                window.location.href = 'manageAccountAdmin?service=ListAllStaff';
                                            }
                                            //validate form
                                            document.addEventListener("DOMContentLoaded", function () {
                                                var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                                                var mobilePattern = /^(?:\+84|0)(3|5|7|8|9)[0-9]{8}$/;
                                                var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

                                                document.getElementById("name").oninput = function () {
                                                    var name = this.value;
                                                    this.value = name;
                                                    if (name === "") {
                                                        document.getElementById("nameError").innerHTML = "Full name must not be empty.";
                                                    } else if (/^\s/.test(name)) {
                                                        document.getElementById("nameError").innerHTML = "Full name should not start with a space.";
                                                    } else {
                                                        document.getElementById("nameError").innerHTML = "";
                                                    }
                                                };

                                                document.getElementById("username").oninput = function () {
                                                    var username = this.value;
                                                    if (/\s/.test(username)) {
                                                        document.getElementById("usernameError").innerHTML = "Username should not contain spaces.";
                                                    } else {
                                                        document.getElementById("usernameError").innerHTML = "";
                                                    }
                                                };

                                                document.getElementById("email").oninput = function () {
                                                    var email = this.value;
                                                    if (!emailPattern.test(email)) {
                                                        document.getElementById("emailError").innerHTML = "Please enter a valid email address.";
                                                    } else {
                                                        document.getElementById("emailError").innerHTML = "";
                                                    }
                                                };

                                                document.getElementById("address").oninput = function () {
                                                    var address = this.value;
                                                    this.value = address;
                                                    if (address === "") {
                                                        document.getElementById("addressError").innerHTML = "Address must not be empty.";
                                                    } else if (/^\s/.test(address)) {
                                                        document.getElementById("addressError").innerHTML = "Address should not start with a space.";
                                                    } else {
                                                        document.getElementById("addressError").innerHTML = "";
                                                    }
                                                };

                                                document.getElementById("mobile").oninput = function () {
                                                    var mobile = this.value;
                                                    if (!mobilePattern.test(mobile)) {
                                                        document.getElementById("mobileError").innerHTML = "Please enter a valid Vietnam mobile number.";
                                                    } else {
                                                        document.getElementById("mobileError").innerHTML = "";
                                                    }
                                                };

                                                document.getElementById("password").oninput = function () {
                                                    var password = this.value;
                                                    if (!passwordPattern.test(password)) {
                                                        document.getElementById("passwordError").innerHTML = "Password must be at least 8 characters long and include at least one letter, one number, and one special character.";
                                                    } else {
                                                        document.getElementById("passwordError").innerHTML = "";
                                                    }
                                                };
                                            });


        </script>
    </body>

</html>
