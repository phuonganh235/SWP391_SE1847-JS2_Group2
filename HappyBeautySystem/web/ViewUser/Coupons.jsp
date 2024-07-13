<%-- 
    Document   : Coupons
    Created on : Jul 1, 2024, 2:08:42 PM
    Author     : phuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <title>JSP Page</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            section{
                padding: 2% 0 5% 0;
            }
            .alizarin{
                background:#e74c3c
            }
            .amethyst{
                background:#9b59b6
            }
            .emerald{
                background:#2ecc71
            }
            .midnight-blue{
                background:#2c3e50
            }
            .peter-river{
                background:#3498db
            }
            .dl{
                background:#f0f0f0;
                padding:30px 0;
                border-radius:20px;
                position:relative
            }
            .dl:before{
                content:" ";
                height:20px;
                width:20px;
                background:#ddd;
                border-radius:20px;
                position:absolute;
                left:50%;
                top:20px;
                margin-left:-10px
            }
            .dl.active:before {
                background: #2ecc71; /* Màu xanh cho mã còn hoạt động */
            }

            .dl.inactive:before {
                background: #95a5a6; /* Màu xám cho mã không còn hoạt động */
            }
            .dl .brand{
                text-transform:uppercase;
                letter-spacing:3px;
                padding:10px 15px;
                margin-top:10px;
                text-align:center;
                min-height:100px
            }
            .dl .discount{
                min-height:50px;
                position:relative;
                font-size:80px;
                line-height:80px;
                text-align:center;
                font-weight:700;
                padding:20px 15px 0;
                color:#f1c40f
            }
            .dl .discount:after{
                content:" ";
                border-right:20px solid transparent;
                border-left:20px solid transparent;
                position:absolute;
                bottom:-20px;
                left:20%
            }
            .dl .discount.alizarin:after{
                border-top:20px solid #e74c3c
            }
            .dl .discount.peter-river:after{
                border-top:20px solid #3498db
            }
            .dl .discount.emerald:after{
                border-top:20px solid #2ecc71
            }
            .dl .discount.amethyst:after{
                border-top:20px solid #9b59b6
            }
            .dl .discount .type{
                font-size:20px;
                letter-spacing:1px;
                text-transform:uppercase;
                margin-top:-30px
            }
            .dl .descr{
                color:#999;
                margin-top:10px;
                padding:20px 15px
            }
            .dl .ends{
                padding:0 15px;
                color:#f1c40f;
                margin-bottom:10px
            }
            .dl .coupon{
                min-height:50px;
                text-align:center;
                text-transform:uppercase;
                font-weight:700;
                font-size:18px;
                padding:20px 15px
            }
            .dl .coupon a.open-code{
                color:#16a085
            }
            .dl .coupon .code{
                letter-spacing:1px;
                border-radius:4px;
                margin-top:10px;
                padding:10px 15px;
                color:#f1c40f;
                background:#f0f0f0
            }
            .filter-container {
                display: flex;
                justify-content: end;
            }
            .filter-container select {
                width: 200px;
                border-radius: 20px;
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
                            <span>Mã giảm giá</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Filter Section Begin -->

        <div class="container filter-container ">
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="filter" style="font-weight: bold">Lọc mã giảm giá:</label>
                        <select id="filter" class="form-control">
                            <option value="all">Tất cả</option>
                            <option value="active" >Còn hạn</option>
                            <option value="inactive">Hết hạn</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
            
        <!-- Filter Section End -->

        <section id="labels">
            <div class="container ">
                <div class="row">
                    <c:forEach items="${requestScope.couponList}" var="c">
                        <div class="col-sm-6 col-md-3 coupon-card ${c.isActive == 1 ? 'active' : 'inactive'}">
                            <div class="dl ${c.isActive == 1 ? 'active' : 'inactive'}">
                                <div class="brand">
                                    <h5>Từ : ${c.startDate}</h5>
                                    <h5>Đến : ${c.endDate}</h5>
                                </div>
                                <div class="discount emerald">${c.discountAmount}%
                                    <div class="type">
                                        <c:choose>
                                            <c:when test="${c.isActive == 1}">
                                                Đang còn
                                            </c:when>
                                            <c:otherwise>
                                                Đã hết
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="descr">
                                    <strong>${c.description}</strong><br>      
                                    <strong>Số lượng :${c.quantity}</strong> 
                                </div>
                                <div class="ends">
                                    <small>Áp dụng cho tổng giá trị đơn hàng .</small>
                                </div>
                                <div class="coupon midnight-blue">
                                    <a href="#" class="open-code">Xem Code</a>
                                    <div class="code" style="display: none;">${c.code}</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="col-lg-12 text-center">
                <div class="pagination__option">
                      
                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                <a href="coupon?page=${i}">${i}</a>      
                    </c:forEach>
                </div>
            </div>
        </section>

        <!--footer area start-->
        <jsp:include page="footer.jsp"/>
        <!--footer area end-->

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
                var openCodeButtons = document.querySelectorAll('.open-code');

                openCodeButtons.forEach(function (button) {
                    button.addEventListener('click', function (e) {
                        e.preventDefault();
                        var codeElement = this.nextElementSibling;
                        if (codeElement.style.display === "none") {
                            codeElement.style.display = "block";
                            this.textContent = "Ẩn Code";
                        } else {
                            codeElement.style.display = "none";
                            this.textContent = "Xem Code";
                        }
                    });
                });

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
