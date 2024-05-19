

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
        <link href="ViewAdmin/img/favicon.ico" rel="icon">

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
                    <form class="d-none d-md-flex ms-4">
                        <input class="form-control border-0" type="search" placeholder="Search">
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


                <!-- Button Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Basic Buttons</h6>
                                <div class="m-n2">
                                    <button type="button" class="btn btn-primary m-2">Primary</button>
                                    <button type="button" class="btn btn-secondary m-2">Secondary</button>
                                    <button type="button" class="btn btn-success m-2">Success</button>
                                    <button type="button" class="btn btn-danger m-2">Danger</button>
                                    <button type="button" class="btn btn-warning m-2">Warning</button>
                                    <button type="button" class="btn btn-info m-2">Info</button>
                                    <button type="button" class="btn btn-light m-2">Light</button>
                                    <button type="button" class="btn btn-dark m-2">Dark</button>
                                    <button type="button" class="btn btn-link m-2">Link</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Outline Buttons</h6>
                                <div class="m-n2">
                                    <button type="button" class="btn btn-outline-primary m-2">Primary</button>
                                    <button type="button" class="btn btn-outline-secondary m-2">Secondary</button>
                                    <button type="button" class="btn btn-outline-success m-2">Success</button>
                                    <button type="button" class="btn btn-outline-danger m-2">Danger</button>
                                    <button type="button" class="btn btn-outline-warning m-2">Warning</button>
                                    <button type="button" class="btn btn-outline-info m-2">Info</button>
                                    <button type="button" class="btn btn-outline-light m-2">Light</button>
                                    <button type="button" class="btn btn-outline-dark m-2">Dark</button>
                                    <button type="button" class="btn btn-outline-link m-2">Link</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Rounded Buttons</h6>
                                <div class="m-n2">
                                    <button type="button" class="btn btn-primary rounded-pill m-2">Primary</button>
                                    <button type="button" class="btn btn-secondary rounded-pill m-2">Secondary</button>
                                    <button type="button" class="btn btn-success rounded-pill m-2">Success</button>
                                    <button type="button" class="btn btn-danger rounded-pill m-2">Danger</button>
                                    <button type="button" class="btn btn-warning rounded-pill m-2">Warning</button>
                                    <button type="button" class="btn btn-info rounded-pill m-2">Info</button>
                                    <button type="button" class="btn btn-light rounded-pill m-2">Light</button>
                                    <button type="button" class="btn btn-dark rounded-pill m-2">Dark</button>
                                    <button type="button" class="btn btn-link rounded-pill m-2">Link</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Buttons Size</h6>
                                <div class="m-n2">
                                    <button type="button" class="btn btn-lg btn-primary m-2">Large Button (btn-lg)</button>
                                    <button type="button" class="btn btn-lg btn-secondary m-2">Large Button (btn-lg)</button>
                                    <button type="button" class="btn btn-sm btn-primary m-2">Small Button (btn-sm)</button>
                                    <button type="button" class="btn btn-sm btn-secondary m-2">Small Button (btn-sm)</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Icon Buttons</h6>
                                <div class="m-n2">
                                    <button type="button" class="btn btn-square btn-primary m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-outline-primary m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-secondary m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-outline-secondary m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-success m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-outline-success m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-danger m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-outline-danger m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-warning m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-outline-warning m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-info m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-outline-info m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-dark m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-outline-dark m-2"><i class="fa fa-home"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Icon Buttons Size</h6>
                                <div class="m-n2">
                                    <button type="button" class="btn btn-lg btn-lg-square btn-primary m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-lg btn-lg-square btn-outline-primary m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-primary m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-square btn-outline-primary m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-sm btn-sm-square btn-primary m-2"><i class="fa fa-home"></i></button>
                                    <button type="button" class="btn btn-sm btn-sm-square btn-outline-primary m-2"><i class="fa fa-home"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Icon & Text Buttons</h6>
                                <div class="m-n2">
                                    <button type="button" class="btn btn-primary m-2"><i class="fa fa-home me-2"></i>Icon Left</button>
                                    <button type="button" class="btn btn-outline-primary m-2"><i class="fa fa-home me-2"></i>Icon Left</button>
                                    <button type="button" class="btn btn-primary m-2">Icon Right<i class="fa fa-home ms-2"></i></button>
                                    <button type="button" class="btn btn-outline-primary m-2">Icon Right<i class="fa fa-home ms-2"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Block Buttons</h6>
                                <div class="m-n2">
                                    <button class="btn btn-primary w-100 m-2" type="button">Button</button>
                                    <button class="btn btn-outline-primary w-100 m-2" type="button">Button</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Basic Button Group</h6>
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-primary">Left</button>
                                    <button type="button" class="btn btn-primary">Middle</button>
                                    <button type="button" class="btn btn-primary">Right</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Mixed Button Group</h6>
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-danger">Left</button>
                                    <button type="button" class="btn btn-warning">Middle</button>
                                    <button type="button" class="btn btn-success">Right</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Outlined Button Group</h6>
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-outline-primary">Left</button>
                                    <button type="button" class="btn btn-outline-primary">Middle</button>
                                    <button type="button" class="btn btn-outline-primary">Right</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Checkbox Button Group</h6>
                                <div class="btn-group" role="group">
                                    <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btncheck1">Checkbox 1</label>

                                    <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btncheck2">Checkbox 2</label>

                                    <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btncheck3">Checkbox 3</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Radio Button Group</h6>
                                <div class="btn-group" role="group">
                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off"
                                           checked>
                                    <label class="btn btn-outline-primary" for="btnradio1">Radio 1</label>

                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btnradio2">Radio 2</label>

                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btnradio3">Radio 3</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Button Toolbar</h6>
                                <div class="btn-toolbar" role="toolbar">
                                    <div class="btn-group me-2" role="group" aria-label="First group">
                                        <button type="button" class="btn btn-primary">1</button>
                                        <button type="button" class="btn btn-primary">2</button>
                                        <button type="button" class="btn btn-primary">3</button>
                                        <button type="button" class="btn btn-primary">4</button>
                                    </div>
                                    <div class="btn-group me-2" role="group" aria-label="Second group">
                                        <button type="button" class="btn btn-secondary">5</button>
                                        <button type="button" class="btn btn-secondary">6</button>
                                        <button type="button" class="btn btn-secondary">7</button>
                                    </div>
                                    <div class="btn-group" role="group" aria-label="Third group">
                                        <button type="button" class="btn btn-info">8</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Vertical Button Group</h6>
                                <div class="btn-group-vertical me-2" role="group">
                                    <button type="button" class="btn btn-primary">Left</button>
                                    <button type="button" class="btn btn-primary">Middle</button>
                                    <button type="button" class="btn btn-primary">Right</button>
                                </div>
                                <div class="btn-group-vertical" role="group">
                                    <button type="button" class="btn btn-danger">Left</button>
                                    <button type="button" class="btn btn-warning">Middle</button>
                                    <button type="button" class="btn btn-success">Right</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Vertical Button Group (Checkbox & Radio)</h6>
                                <div class="btn-group-vertical me-2" role="group">
                                    <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btncheck1">Checkbox 1</label>

                                    <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btncheck2">Checkbox 2</label>

                                    <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btncheck3">Checkbox 3</label>
                                </div>
                                <div class="btn-group-vertical" role="group">
                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off"
                                           checked>
                                    <label class="btn btn-outline-primary" for="btnradio1">Radio 1</label>

                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btnradio2">Radio 2</label>

                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btnradio3">Radio 3</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Button End -->


                <!-- Footer Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light rounded-top p-4">
                        <div class="row">
                            <div class="col-12 col-sm-6 text-center text-sm-start">
                                &copy; <a href="#">Your Site Name</a>, All Right Reserved. 
                            </div>
                            <div class="col-12 col-sm-6 text-center text-sm-end">
                                <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                                Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer End -->
            </div>
            <!-- Content End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="ViewAdmin/lib/chart/chart.min.js"></script>
        <script src="ViewAdmin/lib/easing/easing.min.js"></script>
        <script src="ViewAdmin/lib/waypoints/waypoints.min.js"></script>
        <script src="ViewAdmin/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="ViewAdmin/lib/tempusdominus/js/moment.min.js"></script>
        <script src="ViewAdmin/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="ViewAdmin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="ViewAdmin/js/main.js"></script>
    </body>

</html>
