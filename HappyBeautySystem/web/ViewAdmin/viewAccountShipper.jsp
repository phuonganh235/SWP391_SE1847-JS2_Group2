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
                    <form class="d-none d-md-flex ms-4" action="manageAccountAdmin?service=searchShipper" method="post" >
                        <input class="form-control border-0" type="search" placeholder="Search by name" name="search" value="${requestScope.valueSearchShipper}">
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
                            <h6 class="mb-0 text-center"> Management account Shipper</h6>
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addAccountShipperModal">Add Account Shipper</button>
                        </div>
                        <!-- Load account Shipper -->
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Password</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.dataShipper}" var="dataShipper">
                                        <tr>

                                            <td>${dataShipper.shipperId}</td>
                                            <td>${dataShipper.name}</td>
                                            <td>${dataShipper.email}</td>
                                            <td>${dataShipper.phone}</td>
                                            <td>${dataShipper.gender}</td>
                                            <td>   <div class="password-container">
                                                    <input type="password" class="form-control d-inline-block" id="password${dataShipper.shipperId}" value="${dataShipper.password}" readonly style="width: 85%; display: inline-block;">
                                                    <button type="button" class="btn btn-sm btn-secondary" onclick="togglePassword('${dataShipper.shipperId}')">
                                                        <i class="fas fa-eye"></i>
                                                    </button>
                                                </div></td>

                                            <td>
                                                <form action="manageAccountAdmin" method="post" style="display:inline;">
                                                    <input type="hidden" name="service" value="updateShipper"/>
                                                    <input type="hidden" name="id" value="${dataShipper.shipperId}"/>
                                                    <button type="submit" class="btn btn-sm btn-primary">
                                                        <i class="fas fa-user-edit"></i>
                                                    </button>
                                                </form>
                                                <a href="#" onclick="doDeleteShipper('${dataShipper.shipperId}')"> <i class="fas fa-trash-alt"></i></a>
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
                                        <h5 class="modal-title" id="addAccountShipperModal">Add Account Shipper</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="redirectToListAllShipper()"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addCategoryForm" action="manageAccountAdmin?service=insertShipper" method="post">

                                            <div class="mb-3">
                                                <label for="nameStaff" class="form-label">Full Name</label>
                                                <input type="text" class="form-control" id="nameStaff" name="name"value="${not empty param.name ? param.name : ''}" required>
                                                <c:if test="${not empty errorName}">
                                                    <div class="text-danger">${errorName}</div>
                                                </c:if>
                                            </div>
                                            <div class="mb-3">
                                                <label for="email" class="form-label">Email</label>
                                                <input class="form-control" id="email" name="email" value="${not empty param.email ? param.email : ''}" required>
                                                <c:if test="${not empty errorEmail}">
                                                    <div class="text-danger">${errorEmail}</div>
                                                </c:if>
                                                <c:if test="${not empty errorEmailExit}">
                                                    <div class="text-danger">${errorEmailExit}</div>
                                                </c:if>
                                            </div>
                                            <div class="mb-3">
                                                <label for="phone" class="form-label">Phone</label>
                                                <input class="form-control" id="phone" name="phone" value="${not empty param.phone ? param.phone : ''}" required>
                                                <c:if test="${not empty errorPhone}">
                                                    <div class="text-danger">${errorPhone}</div>
                                                </c:if>
                                            </div>
                                            <div class="mb-3">
                                                <label for="gender" class="form-label">Gender</label>
                                                <input class="form-control" id="gender" name="gender" value="${not empty param.gender ? param.gender : ''}" required>
                                                <c:if test="${not empty errorGender}">
                                                    <div class="text-danger">${errorGender}</div>
                                                </c:if>
                                            </div>
                                            <div class="mb-3">
                                                <label for="password" class="form-label">Password</label>
                                                <input type="password" class="form-control" id="password" name="password" value="${not empty param.password ? param.password : ''}" required>

                                                <c:if test="${not empty errorPassword}">
                                                    <div class="text-danger">${errorPassword}</div>
                                                </c:if>
                                                <c:if test="${not empty errorPasswordExit}">
                                                    <div class="text-danger">${errorPasswordExit}</div>
                                                </c:if>
                                            </div>


                                            <button type="submit" class="btn btn-primary">Add</button>
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
                                        <h5 class="modal-title" id="updateAccountShipperModal">Update Account Staff</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="redirectToListAllShipper()"></button>
                                    </div>
                                    <div class="modal-body">
                                        <c:set value="${requestScope.dataShipperUpdate}" var="dataShipper"/>
                                        <form id="updateShipperForm" action="manageAccountAdmin?service=eiditShipper" method="post">
                                            <div class="form-group">
                                                <label for="id">ID</label>
                                                <input type="text" class="form-control" id="id" name="shipperId" value="${dataShipper.shipperId}" readonly="">
                                            </div>
                                            <div class="form-group">
                                                <label for="updateNameStaff">Full Name</label>
                                                <input type="text" class="form-control" id="updateNameStaff" name="name" value="${param.name != null ? param.name : dataShipper.name}" required>
                                                <c:if test="${not emptyerrorNameUpdateShipper}">
                                                    <div class="text-danger">${errorNameUpdateShipper}</div>
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="updateEmail">Email</label>
                                                <input type="email" class="form-control" id="updateEmail" name="email" value="${param.email != null ? param.email : dataShipper.email}" required>
                                                <c:if test="${not empty errorEmailUpdateShipper}">
                                                    <div class="text-danger">${errorEmailUpdateShipper}</div>
                                                </c:if>
                                                     <c:if test="${not empty errorEmailExitUpdateShipper}">
                                                    <div class="text-danger">${errorEmailExitUpdateShipper}</div>
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="updatePhone">Phone</label>
                                                <input type="text" class="form-control" id="updatePhone" name="phone" value="${param.phone != null ? param.phone : dataShipper.phone}" required>
                                                <c:if test="${not empty errorPhoneUpdateShipper}">
                                                    <div class="text-danger">${errorPhoneUpdateShipper}</div>
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="updateGender">Gender</label>
                                                <input type="text" class="form-control" id="updateGender" name="gender" value="${param.gender != null ? param.gender : dataShipper.gender}" required>
                                                <c:if test="${not empty errorGenderUpdateShipper}">
                                                    <div class="text-danger">${errorGenderUpdateShipper}</div>
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="updatePassword">Password</label>
                                                <input type="password" class="form-control" id="updatePassword" name="password" value="${param.password != null ? param.password : dataShipper.password}" required>
                                                <c:if test="${not empty errorPasswordUpdateShipper}">
                                                    <div class="text-danger">${errorPasswordUpdateShipper}</div>
                                                </c:if>
                                                     <c:if test="${not empty errorPasswordExitUpdateShipper}">
                                                    <div class="text-danger">${errorPasswordExitUpdateShipper}</div>
                                                </c:if>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Update</button>

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
        <script>function doDeleteShipper(shipperId) {
                                                if (confirm("are you sure to delete ShipperId = " + shipperId)) {
                                                    window.location = "manageAccountAdmin?service=deleteShipper&idShipper=" + shipperId;
                                                }
                                            }

                                            $(document).ready(function () {
                                                // Insert
            <c:if test="${not empty error}">
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

                                            function togglePassword(id) {
                                                var passwordField = document.getElementById('password' + id);
                                                var passwordType = passwordField.getAttribute('type');
                                                if (passwordType === 'password') {
                                                    passwordField.setAttribute('type', 'text');
                                                } else {
                                                    passwordField.setAttribute('type', 'password');
                                                }
                                            }
        </script>



    </body>

</html>
