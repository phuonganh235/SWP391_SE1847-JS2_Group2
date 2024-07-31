<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib
    uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8" />
            <title>DASHMIN - Bootstrap Admin Template</title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport" />
            <meta content="" name="keywords" />
            <meta content="" name="description" />

            <!-- Favicon -->
            <link href="img/favicon.ico" rel="icon" />

            <!-- Google Web Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link
                href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
                rel="stylesheet"
                />

            <!-- Icon Font Stylesheet -->
            <link
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                rel="stylesheet"
                />
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                rel="stylesheet"
                />

            <!-- Libraries Stylesheet -->
            <link
                href="ViewAdmin/lib/owlcarousel/assets/owl.carousel.min.css"
                rel="stylesheet"
                />
            <link
                href="ViewAdmin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
                rel="stylesheet"
                />

            <!-- Customized Bootstrap Stylesheet -->
            <link href="ViewAdmin/css/bootstrap.min.css" rel="stylesheet" />

            <!-- Template Stylesheet -->
            <link href="ViewAdmin/css/style.css" rel="stylesheet" />

            <!--Style image admin-->
            <style>
                .app-sidebar__user-avatar {
                    border-radius: 50% !important;
                    width: 80px; /* Match the inline style */
                    height: 80px; /* Match the inline style */
                    border: 4px solid #ff99cc; /* White border */
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
                    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transition for hover effects */
                }

                .app-sidebar__user-avatar:hover {
                    transform: scale(1.05); /* Slightly enlarge on hover */
                    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Enhanced shadow on hover */
                }

                .status-indicator {
                    width: 20px; /* Adjust size as needed */
                    height: 20px; /* Adjust size as needed */
                    background-color: #28a745; /* Success green color */
                    border: 2px solid #fff; /* White border */
                }
            </style>
        </head>
        <body>
            <!-- Sidebar Start -->
            <div class="sidebar pe-2 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="#" class="navbar-brand mx-3 mb-3">
                        <h3
                            class="text-primary"
                            style="
                            font-family: 'Pacifico', cursive;
                            font-size: 23px;
                            text-decoration: underline;
                            "
                            >
                            <i class="fa fa-shopping-basket me-2"></i>HAPPYBEAUTY
                        </h3>
                    </a>

                    <div class="d-flex align-items-center ms-3 mb-3">
                        <div class="position-relative">
                            <a href="#">

                                <c:if test="${sessionScope.inforUserLogin.roleId == 1}">
                                    <img
                                        class="app-sidebar__user-avatar"
                                        src="ViewAdmin/img/admin.jpg"
                                        alt=""
                                        style="width: 60px; height: 60px"
                                        />
                                </c:if>
                                <c:if test="${sessionScope.inforUserLogin.roleId == 4}">
                                    <img
                                        class="app-sidebar__user-avatar"
                                        src="ViewAdmin/img/staff.jpg"
                                        alt=""
                                        style="width: 60px; height: 60px"
                                        />
                                </c:if>
                            </a>
                            <div
                                class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"
                                ></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">${sessionScope.inforUserLogin.getName()}</h6>
                            <c:if test="${sessionScope.inforUserLogin.roleId == 1}">
                                <span>Quản trị viên</span>
                            </c:if>
                            <c:if test="${sessionScope.inforUserLogin.roleId == 4}">
                                <span>Nhân viên</span>
                            </c:if>
                        </div>
                    </div>

                    <div class="navbar-nav w-100">
                        <a href="dashboard" class="nav-item nav-link">
                            <i class="fa fa-tachometer-alt me-2"></i>Bảng điều khiển
                        </a>
                        <c:if test="${sessionScope.inforUserLogin.roleId == 1}">
                            <div class="nav-item dropdown">
                                <a
                                    href="#"
                                    class="nav-link dropdown-toggle"
                                    data-bs-toggle="dropdown"
                                    >
                                    <i class="fa fa-user-edit me-2"></i>Tài khoản
                                </a>
                                <div class="dropdown-menu bg-transparent border-0" style="text-align: center">
                                    <!--<a href="ViewAdmin/manageRole.jsp" class="dropdown-item">Phân vai trò</a>-->
                                    <a href="manageRole" class="dropdown-item">Phân vai trò</a>
                                    <a href="manageAccountAdmin?service=ListAllStaff" class="dropdown-item">Nhân viên</a>
                                    <a href="manageAccountAdmin?service=ListAllShipper" class="dropdown-item">Người giao hàng</a>
                                </div>
                            </div>
                        </c:if>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-server"></i>  Đơn hàng
                            </a>
                            <div class="dropdown-menu bg-transparent border-0" style="text-align: center">
                                <a href="/HappyBeautySystem/managerOrder?service=listAllOrder&status=1" class="dropdown-item">Chưa xác nhận</a>
                                <a href="/HappyBeautySystem/managerOrder?service=listAllOrder&status=2" class="dropdown-item">Đã xác nhận</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-server"></i>  Sản phẩm
                            </a>
                            <div class="dropdown-menu bg-transparent border-0" style="text-align: center">
                                <a href="manager" class="dropdown-item">Tất cả</a>
                                <a href="manager?service=low" class="dropdown-item">Sắp hết hàng</a>
                            </div>
                        </div>
                        <a href="managercategory" class="nav-item nav-link">
                            <i class="fa fa-th me-2"></i>Danh mục
                        </a>
                        <a href="managefeedback" class="nav-item nav-link">
                            <i class="fa fa-th me-2"></i>Phản hồi
                        </a>
                        
                        <a href="managenews" class="nav-item nav-link">
                            <i class="fa fa-th me-2"></i>Bài viết
                        </a>
                        <a href="managepromotion" class="nav-item nav-link">
                            <i class="fa fa-bell me-2"></i>Khuyến mãi
                        </a>
                        <a href="manageCoupons?service=listAllCoupon" class="nav-item nav-link">
                            <i class="fa fa-tag me-2"></i>Phiếu giảm giá
                        </a>
                        <a
                            href="Consultation?service=listAll1"
                            class="nav-item nav-link"
                            ><i class="fa fa-calendar me-2"></i>Lịch tư vấn</a
                        >
                        <c:if test="${sessionScope.inforUserLogin.roleId == 1}">
                            <a href="chart" class="nav-item nav-link">
                                <i class="fa fa-chart-bar me-2"></i>Biểu đồ
                            </a>
                        </c:if>
                        <a href="manageabout" class="nav-link">
                            <i class="far fa-file-alt me-2"></i>Giới thiệu
                        </a>
                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->
        </body>
    </html>
