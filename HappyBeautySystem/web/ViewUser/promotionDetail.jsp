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
                padding: 6% 0 6% 6%;
            }

            /* Coupon card styles */

            .coupon-card .dl {
                background: #e5e5ff;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                position: relative;
                margin-bottom: 20px;
                padding: 10px;
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
                width: 350px;
                height: 100px;
                margin-right: 10px;
                margin-left: 10px;
            }

            .coupon-card .discount .type {
                font-size: 12px;
                color: #fff;
                background: #28a745;
                padding: 3px 6px;
                border-radius: 3px;
            }

            .coupon-card .descr{
                font-size: 14px;
                margin-bottom: 5px;
                color: #6f2349;
                padding: 15px 35px;
            }
            .coupon-card .ends {
                font-size: 13px;
                margin-bottom: 4px;
                color: #f166aa;
                padding: 10px 15px;
            }

            .coupon-card .descr strong,
            .coupon-card .ends strong {
                display: block;
                margin-bottom: 0px;
            }

            .coupon-card .coupon a {
                font-size: 15px;
                color: #fff;
                text-decoration: none;
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
                            <a href="promotion"><i class="fa fa-tag"></i>Khuyến mãi</a>
                            <span>Chi tiết khuyến mãi</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Filter Section Begin -->
<!--        <div class="container filter-container">
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
        </div>-->
        <!-- Filter Section End -->

        <section id="labels">
            <div class="container">
                <div class="row">
                        <div class="col-sm-6 col-md-6 coupon-card ${P.status == 1 ? 'active' : 'inactive'}">
                            <div class="dl ${P.status == 1 ? 'active' : 'inactive'}">
                                <div class="brand">
                                    <h5>${P.promoName}</h5>
                                </div>
                                <div class="discount emerald">
                                    <img src="ViewUser/img/banner/banner-8.jpg" class="img-fluid" alt="Product Image">
                                    <div class="type">
                                        <c:choose>
                                            <c:when test="${P.status == 1}">
                                                Đang Diễn Ra
                                            </c:when>
                                            <c:otherwise>
                                                Hết Khuyến Mãi
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="ends" style="font-size: 19px; text-align: center">
                                    <strong>${P.description}</strong>
                                </div>
                                <div class="descr">
                                    <strong>Hạn sử dụng mã:   ${P.startDate}  tới  ${P.endDate}</strong>
                                </div>
                                <div class="descr">
                                    <strong>Giá trị khuyến mãi:   ${P.discountAmount}00 vnd</strong>
                                    <strong>Giao dịch tối thiểu:   ${P.condition}00 vnd</strong> 
                                </div>
                                <div class="ends">
                                    <strong>Áp dụng cho mọi lứa tuổi khách hàng.</strong>
                                    <strong>Không đồng thời áp dụng với các khuyến mãi khác.</strong>
                                </div>

                            </div>
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
    </body>

</html>

