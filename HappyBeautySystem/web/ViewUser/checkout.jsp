<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ashion Template">
        <meta name="keywords" content="Ashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>HappyBeauty</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <script src="https://esgoo.net/scripts/jquery.js"></script>
        <!-- Css Styles -->
        <link rel="stylesheet" href="ViewUser/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/style.css" type="text/css">
        <style type="text/css">
            /* Container for the form to center and set max width */
            /* Kích thước font cho thẻ h2 */
            .form-container h2 {
                text-align: center;
                margin-bottom: 20px;
                font-size: 20px; /* Kích thước font mới, bạn có thể điều chỉnh lại theo ý muốn */
                color: #333;
            }

            /* Style for form group to make input fields equal width */
            .form-group {
                display: flex;
                flex-direction: column;
                width: 100%; /* Chiều rộng của form group sẽ là 100% */
            }

            /* Style for labels to add spacing */
            .form-group label {
                margin-bottom: 5px;
                font-weight: bold;
                font-size: 14px; /* Kích thước font cho nhãn */
                color: #555;
            }

            /* Style for select and input elements to have equal width */
            .css_select, .form-control {
                width: 100%; /* Chiều rộng của select và input là 100% */
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background: #fff;
                font-size: 14px; /* Kích thước font cho select và input */
                box-shadow: inset 0 1px 3px rgba(0,0,0,0.1);
            }

            /* Hover and focus effects for the select elements */
            .css_select:hover, .css_select:focus, .form-control:hover, .form-control:focus {
                border-color: #888;
                box-shadow: 0 0 5px rgba(0,0,0,0.2);
            }

            /* Optional: Style the disabled select element to differentiate it */
            .css_select[disabled] {
                background: #e9ecef;
                color: #6c757d;
                cursor: not-allowed;
            }

            /* Style for input elements to match the select elements */
            .form-control {
                font-size: 14px; /* Kích thước font cho input */
                color: #333;
            }

            /* Add margin to the bottom of the form control for spacing */
            .form-control + .form-control {
                margin-top: 15px;
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
                            <a href="home"><i class="fa fa-home"></i> Trang Chủ</a>
                            <span>Thanh Toán</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Checkout Section Begin -->
        <section class="checkout spad">
            <div class="container">
                <form action="OrderController?service=confirmOrder" id="checkoutForm" class="checkout__form" method="post">
                    <div class="row">
                        <div style="display: flex">


                            <div class="col-lg-8">

                                <c:if test="${sessionScope.inforUserLogin != null}">
                                    <div class="form-container">
                                        <h2>THÔNG TIN - CHI TIẾT - ĐƠN HÀNG</h2>
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="fullName">Thành phố</label>
                                                <select class="css_select" id="tinh" name="tinh" title="Chọn Tỉnh Thành" disabled>
                                                    <!-- Hà Nội sẽ được thêm vào từ JavaScript và bị vô hiệu hóa -->
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="categoryName">Quận / Huyện</label>
                                                <select class="css_select" id="quan" name="quan" title="Chọn Quận Huyện" required>
                                                    <option value="">Chọn Quận Huyện</option>
                                                    <!-- Các option khác của quận/huyện sẽ được thêm vào từ mã JavaScript -->
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="categoryName">Phường / Xã</label>
                                                <select required class="css_select" id="phuong" name="phuong" title="Chọn Phường Xã" required> 
                                                    <option value="">Phường / Xã</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="categoryName">Số điện thoại nhận hàng</label>
                                                <input type="text" class="form-control" id="phone" name="phone" value="${sessionScope.inforUserLogin.getMobile()}" required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="categoryName">Địa chỉ chi tiết</label>
                                                <input type="text" class="form-control" id="phone" name="AddressDetail" value="" required>
                                            </div>
                                        </div>
                                        <h2>Đặt thời gian giao hàng</h2>
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="note">Ghi chú</label>
                                                <select class="form-control" id="note" name="note">
                                                    <option value="">Chọn ghi chú</option>
                                                    <option value="Giao hàng nhanh chóng">Giao hàng nhanh chóng</option>
                                                    <option value="Giao hàng ngoài giờ hành chính">Giao hàng ngoài giờ hành chính</option>
                                                    <option value="Giao hàng trong giờ hành chính">Giao hàng trong giờ hành chính</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="fromTime">Từ</label>
                                                <input type="time" class="form-control" id="fromTime" name="fromTime" required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="toTime">Đến</label>
                                                <input type="time" class="form-control" id="toTime" name="toTime" required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="deliveryDate">Ngày</label>
                                                <input type="date" class="form-control" id="deliveryDate" name="deliveryDate" required>
                                            </div>
                                        </div>
                                        <div id="timeWarning" class="alert alert-danger" style="display:none;">
                                            Ngoài thời gian làm việc (6:00 AM - 8:00 PM). Làm ơn chọn lại.
                                        </div>
                                        <div id="dateWarning" class="alert alert-danger" style="display:none;">
                                            Không được chọn ngày ở quá khứ
                                        </div>
                                    </div>
                                </c:if>

                            </div



                            <div class="col-lg-2" style="height: 60% ; margin-left: 20px">
                                <div class="checkout__order">
                                    <h5>Đơn hàng của bạn</h5>
                                    <div class="checkout__order__product">
                                        <ul>
                                            <li>
                                                <span class="top__text">Sản phẩm </span>
                                                <span class="top__text__right">Tổng</span>
                                            </li>

                                            <%
                                                List<Cart> listCart = (List<Cart>) request.getAttribute("listCart");
                                                // lấy giá trị đơn hàng và số tiền giảm ở bên shop_cart
                                                // annp them
                                                double cartTotal = Double.parseDouble(request.getParameter("total"));
                                                double cartDiscount = Double.parseDouble(request.getParameter("discount"));
                                                double cartPromotion = Double.parseDouble(request.getParameter("promotion"));
                                                if (listCart != null && !listCart.isEmpty()) {
                                                    ProductDAO daoProduct = new ProductDAO();
                                                    for (Cart cart : listCart) {
                                                        Product pro = daoProduct.getProductById(cart.getProductId());
                                                        if (pro != null) {

                                            %>
                                            <li><%= pro.getProductName()%> <span><%= pro.getPrice() * cart.getQuantity()%></span></li>
                                                <%
                                                        }
                                                    }
                                                } else {
                                                %>
                                            <li>No Product</span></li>
                                                <%
                                                    }
                                                %>
                                        </ul>
                                    </div>
                                    <div class="checkout__order__total">
                                        <ul>
                                            <li>Số tiền <span><%= String.format("%.0f", cartTotal + cartDiscount + cartPromotion)%></span></li>
                                            <li>Khuyến mãi <span><%= String.format("%.0f", cartPromotion)%></span></li>
                                            <li>Giảm giá <span><%= String.format("%.0f", cartDiscount)%></span></li>
                                            <li>Tổng tiền <span><%= String.format("%.0f", cartTotal)%></span></li>

                                        </ul>
                                    </div>
                                    <div class="checkout__order__widget">
                                        <label for="check-payment-1">
                                            COD
                                            <input type="checkbox" id="check-payment-1" class="paymentMethod" name="paymentMethod" value="1">
                                            <span class="checkmark"></span>
                                        </label>

                                        <label for="check-payment-2">
                                            VNPay
                                            <input type="checkbox" id="check-payment-2" class="paymentMethod" name="paymentMethod" value="2">
                                            <span class="checkmark"></span>
                                            <input type="hidden" name="total_cost" value="<%= cartTotal%>"/>
                                        </label>
                                    </div>

                                    <input type="hidden" id="selectedQuan" name="selectedQuan">
                                    <input type="hidden" id="selectedPhuong" name="selectedPhuong">
                                    <input type="hidden" name="couponCode" id="appliedCouponCode" value="">
                                    <button type="submit" class="btn btn-success">Mua Hàng</button>
                                </div>
                            </div>
                        </div>

                </form>

            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

    <!-- Instagram Begin -->
    <div class="instagram">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-1.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-2.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-3.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-4.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-5.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-6.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Instagram End -->

    <!-- Footer Section Begin -->
    <jsp:include page="footer.jsp"/>
    <!-- Footer Section End -->

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        $(document).ready(function () {
            // Lấy ngày và giờ hiện tại
            var now = new Date();
            var currentHour = now.getHours();

            // Đặt giá trị min cho input type="time" từ 6 giờ sáng đến 8 giờ tối
            var fromTimeInput = document.getElementById('fromTime');
            var toTimeInput = document.getElementById('toTime');
            var deliveryDateInput = document.getElementById('deliveryDate');

            fromTimeInput.min = '08:00';
            fromTimeInput.max = '22:00';

            toTimeInput.min = '08:00';
            toTimeInput.max = '22:00';

            // Nếu giờ hiện tại nhỏ hơn 6 giờ sáng, giới hạn giờ bắt đầu từ 6 giờ sáng
            if (currentHour < 6) {
                fromTimeInput.value = '06:00';
                toTimeInput.value = '08:00'; // Giới hạn giờ kết thúc là 8 giờ tối nếu hiện tại nhỏ hơn 6 giờ sáng
            } else {
                fromTimeInput.value = formatTime(currentHour, now.getMinutes());
                toTimeInput.value = formatTime(currentHour, now.getMinutes() + 30); // Giới hạn mặc định là 30 phút sau giờ hiện tại nếu không đặt giới hạn
            }

            // Set giá trị min cho input type="date" để không cho chọn ngày trong quá khứ
            var formattedToday = now.getFullYear() + '-' + ('0' + (now.getMonth() + 1)).slice(-2) + '-' + ('0' + now.getDate()).slice(-2);
            deliveryDateInput.min = formattedToday;

            // Xử lý sự kiện thay đổi giá trị của input "From"
            fromTimeInput.addEventListener('input', function () {
                if (fromTimeInput.value < fromTimeInput.min || fromTimeInput.value > fromTimeInput.max) {
                    $('#timeWarning').show();
                } else {
                    $('#timeWarning').hide();
                }

                // Nếu giờ bắt đầu lớn hơn giờ kết thúc, đặt giờ kết thúc bằng giờ bắt đầu
                if (fromTimeInput.value > toTimeInput.value) {
                    toTimeInput.value = fromTimeInput.value;
                }
            });

            // Xử lý sự kiện thay đổi giá trị của input "To"
            toTimeInput.addEventListener('input', function () {
                if (toTimeInput.value < toTimeInput.min || toTimeInput.value > toTimeInput.max) {
                    $('#timeWarning').show();
                } else {
                    $('#timeWarning').hide();
                }

                // Nếu giờ kết thúc nhỏ hơn giờ bắt đầu, đặt giờ bắt đầu bằng giờ kết thúc
                if (toTimeInput.value < fromTimeInput.value) {
                    fromTimeInput.value = toTimeInput.value;
                }
            });

            // Xử lý sự kiện thay đổi giá trị của input "Date"
            deliveryDateInput.addEventListener('input', function () {
                if (deliveryDateInput.value < formattedToday) {
                    $('#dateWarning').show();
                } else {
                    $('#dateWarning').hide();
                }
            });

            // Format số giờ và phút thành chuỗi có hai chữ số
            function formatTime(hours, minutes) {
                var displayHours = hours % 12;
                displayHours = displayHours ? displayHours : 12; // Nếu là 0 thì hiển thị là 12
                var formattedHours = displayHours < 10 ? '0' + displayHours : displayHours;
                var formattedMinutes = minutes < 10 ? '0' + minutes : minutes;
                return formattedHours + ':' + formattedMinutes;
            }
        });




    </script>
    <script>
        $(document).ready(function () {
            const hanoiId = "01"; // ID của Hà Nội

            // Lấy dữ liệu quận huyện của Hà Nội khi tải trang
            function loadHanoiDistricts() {
                $.getJSON('https://esgoo.net/api-tinhthanh/2/' + hanoiId + '.htm', function (data_quan) {
                    if (data_quan.error == 0) {
                        $("#quan").html('<option value="0">Chọn Quận / Huyện</option>');
                        $("#phuong").html('<option value="0">Chọn Phường / Xã</option>');
                        $.each(data_quan.data, function (key_quan, val_quan) {
                            $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                        });
                    }
                });
            }

            // Thêm Hà Nội vào danh sách tỉnh và vô hiệu hóa nó
            $("#tinh").append('<option value="' + hanoiId + '" selected>Thành phố Hà Nội</option>').attr("disabled", true);

            // Gọi hàm để tải quận huyện của Hà Nội khi trang được tải
            loadHanoiDistricts();

            // Khi thay đổi quận huyện
            $("#quan").change(function (e) {
                var idquan = $(this).val();
                var selectedQuan = $("#quan option:selected").text();
                $("#selectedQuan").val(selectedQuan); // Cập nhật giá trị trường ẩn

                $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                    if (data_phuong.error == 0) {
                        $("#phuong").html('<option value="0">Chọn phường / xã </option>');
                        $.each(data_phuong.data, function (key_phuong, val_phuong) {
                            $("#phuong").append('<option value="' + val_phuong.id + '">' + val_phuong.full_name + '</option>');
                        });
                    }
                });
            });

            // Khi thay đổi phường xã
            $("#phuong").change(function (e) {
                var selectedPhuong = $("#phuong option:selected").text();
                $("#selectedPhuong").val(selectedPhuong); // Cập nhật giá trị trường ẩn
            });

            // Đảm bảo rằng các trường ẩn có giá trị trước khi gửi biểu mẫu
            $("form").submit(function () {
                var selectedQuan = $("#quan option:selected").text();
                var selectedPhuong = $("#phuong option:selected").text();
                $("#selectedQuan").val(selectedQuan);
                $("#selectedPhuong").val(selectedPhuong);
            });
        });


        $(document).ready(function () {
            const urlParams = new URLSearchParams(window.location.search);
            const couponCode = urlParams.get('couponCode');
            if (couponCode) {
                document.getElementById('appliedCouponCode').value = couponCode;
            }
        });

    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var form = document.getElementById("checkoutForm"); // Đổi "checkoutForm" thành ID của form của bạn

            form.addEventListener("submit", function (event) {
                var checkboxes = document.querySelectorAll(".paymentMethod");
                var isChecked = false;

                checkboxes.forEach(function (checkbox) {
                    if (checkbox.checked) {
                        isChecked = true;
                    }
                });

                if (!isChecked) {
                    event.preventDefault(); // Ngăn form submit nếu không có checkbox nào được chọn
                    alert("Vui lòng chọn ít nhất một phương thức thanh toán.");
                }
            });
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var form = document.getElementById("checkoutForm"); // Replace "checkoutForm" with your form ID

            form.addEventListener("submit", function (event) {
                var quanSelect = document.getElementById("quan");
                var phuongSelect = document.getElementById("phuong");
                var isChecked = true;

                // Check if Quận / Huyện is selected
                if (quanSelect.value === "") {
                    isChecked = false;
                    alert("Vui lòng chọn Quận / Huyện.");
                }

                // Check if Phường / Xã is selected
                if (phuongSelect.value === "0") {
                    isChecked = false;
                    alert("Vui lòng chọn Phường / Xã.");
                }

                // Prevent form submission if any required field is not selected
                if (!isChecked) {
                    event.preventDefault();
                }
            });
        });
    </script>

</body>

</html>
