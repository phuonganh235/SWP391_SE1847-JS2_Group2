<%-- 
    Document   : createAccountStaff
    Created on : May 26, 2024, 11:56:47 PM
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
                <jsp:include page="navbar.jsp"/>
                <!-- Navbar End -->

                <!-- Table Start -->
                <div id="editProductModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="manageAccountAdmin" method="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Create account staff</h4>
                                </div>

                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="namestaf">Name</label>
                                        <input type="text" class="form-control" id="namestaf" name="name" value="">
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="text" class="form-control" id="email" name="email" value="" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">phone</label>
                                        <input type="text" class="form-control" id="phone" name="phone" value="" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">password</label>
                                         <input type="text" class="form-control" id="pasword" name="password" value="" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="gender"> Gender</label>
                                            <input type="text" class="form-control" id="gender" name="gender" value="" required>
                                    </div>
                                    <div class="form-group">
                                            <label for="roleid"> RoleId</label>
                                            <input type="text" class="form-control" id="roleid" name="roleid" value="" required>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-success" value="Create">
                                    <input type="hidden" name="service" value="insertStaff"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Table End -->
                <!-- Footer Start -->

                <!-- Footer End -->
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
        <script src="ViewAdmin/js/manager.js" type="text/javascript"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>
