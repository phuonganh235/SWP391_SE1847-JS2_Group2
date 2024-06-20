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
    <div class="sidebar pe-4 pb-3">
      <nav class="navbar bg-light navbar-light">
        <a href="home" class="navbar-brand mx-4 mb-3">
          <h3
            class="text-primary"
            style="
              font-family: Pacifico, cursive;
              font-size: 23px;
              text-decoration: underline;
            "
          >
            <i class="fa fa-shopping-basket me-2"></i>HAPPYBEAUTY
          </h3>
        </a>

        <div class="d-flex align-items-center ms-4 mb-4">
          <div class="position-relative">
            <a href="customerprofile?service=ViewProfile"
              ><img
                class="app-sidebar__user-avatar"
                src="ViewAdmin/img/user.jpg"
                alt=""
                style="width: 80px; height: 80px"
            /></a>
            <div
              class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"
            ></div>
          </div>
          <div class="ms-3">
            <h6 class="mb-0">${sessionScope.inforUserLogin.getName()}</h6>
            <span>Admin</span>
          </div>
        </div>
        <div class="navbar-nav w-100">
          <a href="dashboard" class="nav-item nav-link active"
            ><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a
          >
          <div class="nav-item dropdown">
            <a
              href="#"
              class="nav-link dropdown-toggle"
              data-bs-toggle="dropdown"
              ><i class="fa fa-laptop me-2"></i>Elements</a
            >
            <div class="dropdown-menu bg-transparent border-0">
              <a href="button.jsp" class="dropdown-item">Buttons</a>
              <a href="typography.jsp" class="dropdown-item">Typography</a>
              <a href="element.jsp" class="dropdown-item">Other Elements</a>
            </div>
          </div>
          <div class="nav-item dropdown">
            <a
              href="#"
              class="nav-link dropdown-toggle"
              data-bs-toggle="dropdown"
              ><i class="fa fa-server"></i>Manager Order</a
            >
            <div class="dropdown-menu bg-transparent border-0">
              <a
                href="/HappyBeautySystem/managerOrder?service=listAllOrder&status=1"
                class="dropdown-item"
                >Order not yet confirmed</a
              >
              <a
                href="/HappyBeautySystem/managerOrder?service=listAllOrder&status=2"
                class="dropdown-item"
                >Order confirmed</a
              >
            </div>
          </div>
          <a href="widget.jsp" class="nav-item nav-link"
            ><i class="fa fa-th me-2"></i>Widgets</a
          >
          <div class="nav-item dropdown">
            <a
              href="#"
              class="nav-link dropdown-toggle"
              data-bs-toggle="dropdown"
              ><i class="fa fa-server"></i>Manager Product</a
            >
            <div class="dropdown-menu bg-transparent border-0">
              <a href="manager" class="dropdown-item">All Product</a>
              <a href="manager?service=low" class="dropdown-item"
                >Product low in stock</a
              >
            </div>
          </div>
          <a href="managercategory" class="nav-item nav-link"
            ><i class="fa fa-th me-2"></i>Manage Category</a
          >
          <a href="manageabout" class="nav-link dropdown-toggle"
            ><i class="far fa-file-alt me-2"></i>About Page</a
          >
          <a href="form.jsp" class="nav-item nav-link"
            ><i class="fa fa-keyboard me-2"></i>Forms</a
          >
          <a href="table.jsp" class="nav-item nav-link"
            ><i class="fa fa-table me-2"></i>Tables</a
          >

          <a
            href="manageCoupons?service=listAllCoupons"
            class="nav-item nav-link"
            ><i class="fa fa-chart-bar me-2"></i>Manage Coupons</a
          >
          <a href="chart" class="nav-item nav-link"
            ><i class="fa fa-chart-bar me-2"></i>Chart</a
          >

          <a
            href="manageCoupons?service=listAllCoupon"
            class="nav-item nav-link"
            ><i class="fa fa-chart-bar me-2"></i>Manage Coupons</a
          >
          <div class="nav-item dropdown">
            <a
              href="#"
              class="nav-link dropdown-toggle"
              data-bs-toggle="dropdown"
              ><i class="far fa-file-alt me-2"></i>Pages</a
            >
            <div class="dropdown-menu bg-transparent border-0">
              <a href="signin.jsp" class="dropdown-item">Sign In</a>
              <a href="signup.jsp" class="dropdown-item">Sign Up</a>
              <a href="404.jsp" class="dropdown-item">404 Error</a>
              <a href="blank.jsp" class="dropdown-item">Blank Page</a>
            </div>
          </div>
          <div class="nav-item dropdown">
            <a
              href="#"
              class="nav-link dropdown-toggle"
              data-bs-toggle="dropdown"
              ><i class="fa fa-th me-2"></i>Manage Account</a
            >
            <div class="dropdown-menu bg-transparent border-0">
              <a
                href="manageAccountAdmin?service=ListAllStaff"
                class="dropdown-item"
                >View list account Staff</a
              >
              <a
                href="manageAccountAdmin?service=ListAllShipper"
                class="dropdown-item"
                >View list account shipper</a
              >
            </div>
          </div>
        </div>
      </nav>
    </div>

    <!-- Sidebar End -->
  </body>
</html>
