<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <title>Coupon Page</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            /* Section padding */
            section {
                padding: 1% 0 6% 0;
            }

            /* Color classes */
            .alizarin {
                background: #e74c3c;
            }
            .amethyst {
                background: #9b59b6;
            }
            .emerald {
                background: #0099cc;
            }
            .midnight-blue {
                background: #2c3e50;
            }
            .peter-river {
                background: #3498db;
            }

            /* Coupon card styles */
            .coupon-card {
                padding: 15px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .coupon-card .dl {
                background: #dfcbfd;
                padding: 15px;
                border-radius: 20px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                position: relative;
                margin-bottom: 20px;
                padding: 10px;
            }

            .coupon-card .dl:before {
                content: " ";
                height: 20px;
                width: 20px;
                background: #ddd;
                border-radius: 20px;
                position: absolute;
                left: 50%;
                top: -10px;
                transform: translateX(-50%);
            }

            .coupon-card .dl.active:before {
                background: #2ecc71;
            }

            .coupon-card .dl.inactive:before {
                background: #95a5a6;
            }

            .coupon-card .brand h5 {
                font-size: 14px;
                margin-bottom: 5px;
                text-transform: uppercase;
                letter-spacing: 3px;
                padding: 10px 15px;
                text-align: center;
                font-weight: bold
            }

            .coupon-card .discount {
                
                align-items: center;
                text-align: center;
                font-weight: 700;
                color: #ff3333;
            }

            .coupon-card .discount img {
                width: 533px;
                height: 150px;
                /*margin-right: 10px;*/
                /*margin-left: 100px;*/
            }

            .coupon-card .discount:after {
                content: " ";
                border-right: 20px solid transparent;
                border-left: 20px solid transparent;
                position: absolute;
                bottom: -20px;
                left: 50%;
                transform: translateX(-50%);
            }

            .coupon-card .discount.alizarin:after {
                border-top: 20px solid #e74c3c;
            }

            .coupon-card .discount.peter-river:after {
                border-top: 20px solid #3498db;
            }

            .coupon-card .discount.amethyst:after {
                border-top: 20px solid #9b59b6;
            }

            .coupon-card .discount .type {
                font-size: 12px;
                color: #fff;
                background: #28a745;
                padding: 3px 6px;
                border-radius: 3px;
            }

            .coupon-card .descr,
            .coupon-card .ends {
                font-size: 12px;
                margin-bottom: 5px;
                color: #666;
                padding: 20px 15px;
            }

            .coupon-card .descr strong,
            .coupon-card .ends strong {
                display: block;
                margin-bottom: 0px;
            }

            .coupon-card .coupon {
                text-align: center;
                padding: 10px;
                background: #383879;
                border-radius: 3px;
                min-height: 30px;
                text-transform: uppercase;
                font-weight: 700;
                font-size: 16px;
                /*padding: 10px 15px;*/
            }

            .coupon-card .coupon a {
                font-size: 15px;
                color: #fff;
                text-decoration: none;
            }

            .coupon-card .coupon a.open-code {
                color: #90c9fd;
            }

            .coupon-card .coupon .code {
                letter-spacing: 1px;
                border-radius: 4px;
                margin-top: 10px;
                padding: 10px 15px;
                color: #f1c40f;
                background: #f0f0f0;
            }

            /* Filter container styles */
            .filter-container {
                display: flex;
                justify-content: flex-start;
                margin-bottom: 17px;
                margin-top: 27px;
            }

            .filter-container select {
                width: 200px;
                border-radius: 20px;
            }

            /* Additional styles for responsiveness */
            @media (max-width: 767px) {
                .coupon-card {
                    margin-bottom: 10px;
                }

                .coupon-card .discount img {
                    max-width: 40px;
                }

                .coupon-card .discount .type {
                    font-size: 10px;
                    padding: 2px 4px;
                }

                .coupon-card .coupon a {
                    font-size: 10px;
                }
            }

        </style>
    </head>
    <body>
        <!-- Header Section Begin -->
        <jsp:include page="navbar.jsp"/>
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="home"><i class="fa fa-home"></i>Trang chủ</a>
                            <span>Khuyến mãi</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Filter Section Begin -->
        <div class="container filter-container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="filter" style="font-weight: bold">Lọc khuyến mãi:</label>
                        <select id="filter" class="form-control">
                            <option value="all">Tất cả</option>
                            <option value="active">Còn hiệu lực</option>
                            <option value="inactive">Hết hiệu lực</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <!-- Filter Section End -->

        <section id="labels">
            <div class="container">
                <div class="row">
                    <c:forEach items="${requestScope.listP}" var="c">
                        <div class="col-sm-6 col-md-6 coupon-card ${c.status == 1 ? 'active' : 'inactive'}">
                            <div class="dl ${c.status == 1 ? 'active' : 'inactive'}">
                                <div class="brand">
                                    <h5>${c.promoName}</h5>
                                </div>
                                <div class="discount emerald">
                                    <img src="ViewUser/img/banner/banner-8.jpg" class="img-fluid" alt="Product Image">
                                    <div class="type">
                                        <c:choose>
                                            <c:when test="${c.status == 1}">
                                                Đang Diễn Ra
                                            </c:when>
                                            <c:otherwise>
                                                Hết Khuyến Mãi
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="descr">
                                    <strong>Giá trị khuyến mãi: ${c.discountAmount}00 vnd</strong> <br>  
                                    <strong>Khuyến mãi tới: ${c.endDate}</strong>
                                </div>
                                <div class="ends">
                                    <strong>Áp dụng cho mọi lứa tuổi khách hàng.</strong>
                                </div>
                                <div class="coupon midnight-blue">
                                    <a href="promotion?service=promotiondetail&promotion_id=${c.promoCode}">Xem Chi Tiết</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="col-lg-12 text-center">
                    <div class="pagination__option">
                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <a href="promotion?page=${i}">${i}</a>      
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"/>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="ViewUser/js/jquery-3.3.1.min.js"></script>
        <script src="ViewUser/js/bootstrap.min.js"></script>
        <script src="ViewUser/js/jquery.magnific-popup.min.js"></script>
        <script src="ViewUser/js/jquery-ui.min.js"></script>
        <script src="ViewUser/js/mixitup.min.js"></script>
        <script src="ViewUser/js/jquery.countdown.min.js"></script>
        <script src="ViewUser/js/jquery.slicknav.js"></script>
        <script src="ViewUser/js/owl.carousel.min.js"></script>
        <script src="ViewUser/js/jquery.nicescroll.min.js"></script>
        <script src="ViewUser/js/main.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Filter functionality
                var filterSelect = document.getElementById('filter');
                var couponCards = document.querySelectorAll('.coupon-card');

                filterSelect.addEventListener('change', function () {
                    var filterValue = this.value;
                    couponCards.forEach(function (card) {
                        if (filterValue === 'all') {
                            card.style.display = 'block';
                        } else {
                            if (card.classList.contains(filterValue)) {
                                card.style.display = 'block';
                            } else {
                                card.style.display = 'none';
                            }
                        }
                    });
                });
            });
        </script>
    </body>

</html>

