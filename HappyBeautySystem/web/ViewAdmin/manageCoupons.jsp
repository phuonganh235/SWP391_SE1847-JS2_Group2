<%-- 
    Document   : manageCoupons
    Created on : Jun 16, 2024, 9:17:01 PM
    Author     : phuan
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <style>
            .circle {
                height: 10px;
                width: 10px;
                border-radius: 50%;
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

                <div class="container-fluid rounded row align-items-center" style="margin-top: 1% !important; margin-bottom: 1% !important">
                    <div class="col-md-1">
                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addCouponModal">Add</button>
                    </div>
                    <div class="col-md-6">
                        <form action="sale-dashboard" class="d-flex align-items-center">
                            <label for="start" class="me-2">Start date:</label>
                            <input class="form-control me-2" type="date" id="start" name="start" value="${start}">
                            <label for="end" class="me-2">End date:</label>
                            <input class="form-control me-2" type="date" id="end" name="end" value="${end}">
                            <input class="btn btn-danger me-2" type="submit" value="Filter">
                        </form>
                    </div>
                    <div class="col-md-2">
                        <select class="form-select" aria-label="Default select example" onchange="location = this.value;">
                            <option value="setting-list?${historyKey}${historyValue}${historyTypeId}" ${status == null ? "selected" : ""}>Status</option>
                            <option value="setting-list?${historyKey}${historyValue}${historyTypeId}&status=1" ${status == 1 ? "selected" : ""}>appear</option>
                            <option value="setting-list?${historyKey}${historyValue}${historyTypeId}&status=0" ${status == 0 ? "selected" : ""}>hidden</option>
                        </select>
                    </div>

                    <div class="col-md-3 d-flex justify-content-end">
                        <form class="d-flex" action="manageCoupons?service=search" method="post">
                            <input type="hidden" name="service" value="search">
                            <input class="form-control border-0 me-2" type="search" placeholder="Search" name="txt">
                            <button style="color: black; background-color: #99ccff; border-radius: 40px;" type="submit" class="btn btn-secondary"><i class="fa fa-search"></i></button>
                        </form>
                    </div>


                </div>

                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">

                        <!-- Load account staff -->
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th>CouponId</th>
                                        <th>CouponCode</th>
                                        <th>Description</th>
                                        <th>DiscountCoupons</th>
                                        <th>Start date</th>
                                        <th>End date</th>
                                        <th>isActive</th>
                                        <th >Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.couponList}" var="co">
                                        <tr class="text-center">
                                            <td scope="row">${co.couponsId}</td>
                                            <td>${co.code}</td>        
                                            <td>${co.description}</td>                                      
                                            <td>${co.discountAmount}</td>                                      
                                            <td>${co.startDate}</td>                                 
                                            <td>${co.endDate}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${co.isActive == 1}">
                                                        <img class="circle" src="ViewAdmin/img/active.png" alt="Active">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="circle" src="ViewAdmin/img/inactive.png" alt="Inactive">
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td style="display: flex">
                                                <form action="manageCoupons?service=update" method="post" >

                                                    <input type="hidden" name="id" value="${co.couponsId}"/>
                                                    <button type="submit" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#updateCouponModal" >
                                                        <i class="fas fa-user-edit"></i>
                                                    </button>

                                                </form>
                                                <a class="btn btn-danger"  onclick="doDeleteCoupon('${co.couponsId}')" role="button" style='font-size:10px'>
                                                    <i class="fas fa-trash-alt"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>


                </div>
                          <c:set var="page" value="${page}"/>
                            <div class="col-lg-12 text-center">
                                <div class="pagination__option">
                                    <c:forEach begin="${1}" end="${num}" var="i">
                                        <a href="product?page=${i}">${i}</a>
                                    </c:forEach>

                                </div>
                            </div>

        </div>
            </div>
  
        <!-- Add Coupons Modal -->
        <div class="modal fade" id="addCouponModal" tabindex="-1" aria-labelledby="addCouponModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addCouponModalLabel">Add Coupon</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="couponForm" action="manageCoupons?service=insert" method="post">
                            <div class="mb-3">
                                <label for="couponCode" class="form-label">Coupon Code</label>
                                <input type="text" class="form-control" id="couponCode" name="couponCode" >
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <input type="text" class="form-control" id="description" name="description" required>
                                <div id="descriptionError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3">
                                <label for="discountAmount" class="form-label">Discount Amount</label>
                                <input type="number" class="form-control" id="discountAmount" name="discountAmount" required>
                                <div id="discountAmountError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3">
                                <label for="startDate" class="form-label">Start Date</label>
                                <input type="datetime-local" class="form-control" id="startDate" name="startDate" required>
                                <div id="startDateError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3">
                                <label for="endDate" class="form-label">End Date</label>
                                <input type="datetime-local" class="form-control" id="endDate" name="endDate" required>
                                <div id="endDateError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="isActive" name="isActive">
                                <label class="form-check-label" for="isActive">Active</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- update Coupons Modal -->
        <div class="modal fade" id="updateCouponModal" tabindex="-1" aria-labelledby="CouponModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateCouponModal">Update Coupon</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <c:set value="${requestScope.CouponIdUpdate}" var="couponUpdate"/>
                        <form id="couponForm" action="manageCoupons?service=edit" method="post">
                             <div class="mb-3">
                                <label for="couponid" class="form-label">Coupon Id</label>
                                <input type="text" class="form-control" id="couponid" name="couponid" value="${couponUpdate.couponsId}">
                            </div>
                            <div class="mb-3">
                                <label for="couponCode" class="form-label">Coupon Code</label>
                                <input type="text" class="form-control" id="couponCode" name="couponCode" value="${couponUpdate.code}">
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <input type="text" class="form-control" id="description" name="description" value="${couponUpdate.description}" required>
                                <div id="descriptionError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3">
                                <label for="discountAmount" class="form-label">Discount Amount</label>
                                <input type="number" class="form-control" id="discountAmount" name="discountAmount" value="${couponUpdate.discountAmount}"  required>
                                <div id="discountAmountError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3">
                                <label for="startDate" class="form-label">Start Date</label>
                                <input type="datetime-local" class="form-control" id="startDate" name="startDate" value="${couponUpdate.startDate}"  required>
                                <div id="startDateError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3">
                                <label for="endDate" class="form-label">End Date</label>
                                <input type="datetime-local" class="form-control" id="endDate" name="endDate" value="${couponUpdate.endDate}"  required>
                                <div id="endDateError" class="form-text text-danger fst-italic"></div>
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="isActive" name="isActive" ${couponUpdate.isActive == 1 ? 'checked' : ''}>
                                <label class="form-check-label" for="isActive">Active</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
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

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script>
            
                //function delete
                                            function doDeleteCoupon(couponsId) {
                                                if (confirm("are you sure to delete couponId = " + couponsId)) {
                                                    window.location = "manageCoupons?service=delete&id=" + couponsId;
                                                }
                                            }

                            $(document).ready(function () {
                                // Update
            <c:if test="${not empty requestScope.CouponIdUpdate}">
                                $('#updateCouponModal').modal('show');
            </c:if>
                            });





                            document.addEventListener("DOMContentLoaded", function () {

                                function validateDescription() {
                                    var description = document.getElementById("description").value;
                                    if (/^\s*$/.test(description)) {
                                        document.getElementById("descriptionError").innerHTML = "Description should not contain only spaces.";
                                        return false;
                                    } else {
                                        document.getElementById("descriptionError").innerHTML = "";
                                        return true;
                                    }
                                }

                                function validateDiscountAmount() {
                                    var discountAmount = parseFloat(document.getElementById("discountAmount").value);
                                    if (isNaN(discountAmount) || discountAmount <= 0) {
                                        document.getElementById("discountAmountError").innerHTML = "Discount amount must be a positive number.";
                                        return false;
                                    } else {
                                        document.getElementById("discountAmountError").innerHTML = "";
                                        return true;
                                    }
                                }

                                function validateStartDate() {
                                    var startDate = document.getElementById("startDate").value;
                                    if (!startDate) {
                                        document.getElementById("startDateError").innerHTML = "Start date must not be empty.";
                                        return false;
                                    } else {
                                        document.getElementById("startDateError").innerHTML = "";
                                        return true;
                                    }
                                }

                                function validateEndDate() {
                                    var startDate = document.getElementById("startDate").value;
                                    var endDate = document.getElementById("endDate").value;
                                    if (!endDate) {
                                        document.getElementById("endDateError").innerHTML = "End date must not be empty.";
                                        return false;
                                    } else if (startDate && endDate && new Date(endDate) < new Date(startDate)) {
                                        document.getElementById("endDateError").innerHTML = "End date should not be before start date.";
                                        return false;
                                    } else {
                                        document.getElementById("endDateError").innerHTML = "";
                                        return true;
                                    }
                                }

                                document.getElementById("description").oninput = validateDescription;
                                document.getElementById("discountAmount").oninput = validateDiscountAmount;
                                document.getElementById("startDate").oninput = function () {
                                    validateStartDate();
                                    validateEndDate();
                                };
                                document.getElementById("endDate").oninput = validateEndDate;

                                document.getElementById("couponForm").onsubmit = function (event) {
                                    if (!validateDescription() || !validateDiscountAmount() || !validateStartDate() || !validateEndDate()) {
                                        event.preventDefault();
                                    }
                                };

                            });
        </script>
    </body>

</html>
