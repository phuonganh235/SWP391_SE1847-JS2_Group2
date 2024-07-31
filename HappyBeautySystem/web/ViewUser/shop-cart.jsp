<%@page import="com.google.gson.Gson"%>
<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@page import="model.ProductCart"%>
<%@page import="dal.PromotionDAO"%>
<%@page import="model.Promotions"%>
<%@page import="java.util.List"%>
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

        <!-- Css Styles -->
        <link rel="stylesheet" href="ViewUser/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="ViewUser/css/style.css" type="text/css">
        <link href="ViewUser/css/style-shopcart.css" rel="stylesheet" type="text/css"/>
        <style>
            .user-profile-points {
                background-color: #f8f9fa;
                border: 2px solid #28a745;
                border-radius: 10px;
                padding: 10px 15px;
                margin-top: 15px;
                display: inline-block;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .user-profile-points .points-label {
                font-weight: bold;
                color: #28a745;
                font-size: 16px;
                margin-right: 10px;
            }

            .user-profile-points .points-value {
                font-size: 18px;
                color: #343a40;
                font-weight: bold;
            }
            @keyframes blink {
                0% {
                    opacity: 1;
                }
                50% {
                    opacity: 0;
                }
                100% {
                    opacity: 1;
                }
            }

            .points-label-promotion {
                animation: blink 1.5s infinite;
                color: #ff0000; /* Example color, change as needed */
                text-decoration: none; /* Remove underline */
                font-weight: bold; /* Make text bold */
            }

        </style>

    </head>

    <body>
        <!-- Header Section Begin -->
        <jsp:include page="navbar.jsp" />
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="./home"><i class="fa fa-home"></i> Trang chủ</a>
                            <span>Giỏ hàng</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->
        <!-- Shop Cart Section Begin -->
        <section class="shop-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shop__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Chọn</th>
                                        <th style="margin-left :40px">Sản phẩm</th>
                                        <th>Giá bán</th>
                                        <th>Số lượng</th>
                                        <th>Tổng tiền</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<Cart> listCart = (List<Cart>) request.getAttribute("listCart");
                                        double granTotal = 0;
                                        if (listCart != null && !listCart.isEmpty()) {
                                            ProductDAO daoProduct = new ProductDAO();
                                            for (Cart cart : listCart) {
                                                int hh = daoProduct.getProductQuantity(cart.getProductId());
                                                Product pro = daoProduct.getProductById(cart.getProductId());
                                                if (pro != null) {
                                                    double subtotal = cart.getQuantity() * pro.getPrice();
                                                    String formattedGranTotal = String.format("%.0f", granTotal);
                                    %>
                                    <tr>
                                        <%
                                            // Kiểm tra nếu quantity nhỏ hơn 1 thì không hiển thị checkbox
                                            if (hh >= 1) { // Nếu quantity lớn hơn hoặc bằng 1
                                        %>
                                        <td>
                                            <input type="checkbox" class="product-checkbox" data-product-id="<%= pro.getProductId()%>" data-price="<%= String.format("%.0f", subtotal)%>"
                                                   onclick="updateTotal()">
                                        </td>
                                        <%
                                        } else { // Nếu quantity nhỏ hơn 1
                                        %>
                                        <td>
                                            <!-- Đưa ra thông báo hoặc hành động phù hợp khi quantity < 1 -->
                                            <span style="color: red;">Hết hàng</span>
                                        </td>
                                        <%
                                            } // Kết thúc kiểm tra điều kiện
                                        %>

                                        <td class="cart__product__item">
                                            <a
                                                href="product?action=productdetail&product_id=<%= pro.getProductId()%>&product_category=<%= pro.getCateId()%>">
                                                <img style="height: 90px; width: 90px; margin-left: 40px;"
                                                     src="<%= pro.getPathImage()%>" alt=""></a>
                                            <div class="cart__product__item__title">
                                                <h6><a
                                                        href="product?action=productdetail&product_id=<%= pro.getProductId()%>&product_category=<%= pro.getCateId()%>"><%= pro.getProductName()%></a>
                                                </h6>

                                            </div>
                                        </td>
                                        <td class="cart__price" id="field-price-<%= pro.getProductId()%>"><%= pro.getPrice()%></td>

                                <script>
                                    (function () {
                                        // Function to format the price
                                        function format(price) {
                                            // Convert the price to a string with a fixed number of decimal places (0 in this case)
                                            let priceString = parseFloat(price).toFixed(0);

                                            // Use a regular expression to insert dots at the thousand places
                                            priceString = priceString.replace(/\B(?=(\d{3})+(?!\d))/g, ".");

                                            // Return the formatted price with ' VNĐ' appended
                                            return priceString + ' VNĐ';
                                        }

                                        // Get the price from the element
                                        let priceNew = <%= pro.getPrice()%>;

                                        // Format the price and display it in the specified HTML element
                                        document.getElementById('field-price-<%= pro.getProductId()%>').innerHTML = format(priceNew);
                                    })();
                                </script>

                                <td class="cart__quantity">
                                    <input type="number" value="<%= cart.getQuantity()%>" style="width: 50%" onblur="changeQuantity(this, `<%= cart%>`, <%= pro.getPrice()%>)"/>
                                </td>

                                <td class="cart__price sub_total" data-price="<%= String.format("%.0f", subtotal)%>"
                                    id="subtotal-<%= cart.getCartId()%>"><%= String.format("%.0f", subtotal)%></td>
                                <td class="cart__close">


                                    <a
                                        href="AddToCart?service=deleteCart&productId=<%= cart.getProductId()%>&userId=<%= cart.getUserId()%>">
                                        <span class="icon_close"></span>
                                    </a>
                                </td>

                                </tr>
                                <%
                                        }
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="5" class="text-center">Giỏ hàng trống</td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="cart__btn">
                            <a href="product">Tiếp tục mua sắm</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="discount__content">
                            <h6>Mã giảm giá</h6>
                            <form action="#" id="couponForm">
                                <input type="text" id="couponCode"  placeholder="Nhập mã giảm giá của bạn">
                                <input type="hidden" name="couponCode" id="appliedCouponCode" value="">
                                <button type="button" onclick="applyCoupon()" class="site-btn">Áp dụng</button>
                            </form>
                            <p id="couponMessage"></p>
                        </div>
                        <div class="discount__content">


                            <h6>Quy đổi điểm</h6>
                            <form action="#" id="pointForm" class="poit-customer" >
                                <select id="pointSelect" class="poit-select-customer" style=" border-radius: 25px; margin-left: -8px">
                                    <option value="0">Chọn số điểm</option>
                                    <option value="100">100 điểm - Giảm 5%</option>
                                    <option value="200">200 điểm - Giảm 10%</option>
                                    <option value="300">300 điểm - Giảm 15%</option>
                                    <option value="400">400 điểm - Giảm 20%</option>
                                </select>
                                <button type="button" onclick="applyPoints()" class="site-btn hh" >Áp dụng</button>
                            </form>


                            <p id="pointMessage"></p>
                        </div>
                        <%
                            PromotionDAO promotionDAO = new PromotionDAO();
                            List<Promotions> activePromotions = promotionDAO.getActivePromotion();
                            int promotioncount = promotionDAO.countPromotion();
                        %>
                        <div class="user-profile-points">
                            <a href="promotion" class="points-label-promotion">Chương trình khuyến mãi (<%=  promotioncount%>)</a>
                        </div>
                        <div class="user-profile-points">
                            <span class="points-label">Điểm tích lũy mua hàng:</span>
                            <span class="points-value">${requestScope.point}</span>
                        </div>
                        <div style="padding-top: 30px">
                            Với 100000đ bạn được 5 điểm tích lũy
                        </div>

                    </div>

                    <div class="col-lg-4 offset-lg-2">
                        <div class="cart__total__procced">
                            <h6>Thông tin mua hàng</h6>
                            <ul>
                                <li>Tạm tính  <span id="originalTotal"><%= String.format("%.0f", granTotal)%></span></li>
                                <li>Khuyến mãi <span id="promotion">0.00</span></li>
                                <li>Giảm giá <span id="discountAmount">0.00</span></li>
                                <li>Tổng tiền  <span id="finalTotal"><%= String.format("%.0f", granTotal)%></span></li>
                            </ul>
                            <button class="primary-btn " style="background-color: green" onclick="confirm(this);" >Xác nhận thanh toán</button></div>
                    </div>
                </div>
        </section>
        <!-- Shop Cart Section End -->

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
                                (function () {
                                    // Function to format the price
                                    function format(price) {
                                        // Convert the price to a string with a fixed number of decimal places (0 in this case)
                                        let priceString = parseFloat(price).toFixed(0);

                                        // Use a regular expression to insert dots at the thousand places
                                        priceString = priceString.replace(/\B(?=(\d{3})+(?!\d))/g, ".");

                                        // Return the formatted price with ' VNĐ' appended
                                        return priceString + ' VNĐ';
                                    }

                                    // Use JSP to get the price from the server-side
                                    let priceNew = ${pc.getPrice()};

                                    // Format the price and display it in the specified HTML element
                                    document.getElementById('field-price-${pc.getProductId()}').innerHTML = format(priceNew);
                                })();
        </script>
        <script>
            // Define the condition and promotion amount
//            const promotionCondition = 100000; // example condition, change as needed
//            const promotionAmount = 30000; // example promotion amount, change as needed
            //// Chuyển danh sách khuyến mãi thành JSON
            var promotions = <%= new Gson().toJson(activePromotions)%>;
            // Định nghĩa mảng để lưu trữ các id sản phẩm được chọn
            let listProcductIdChoose = [];
            function updateTotal() {
                var checkboxes = document.querySelectorAll('.product-checkbox');
                var total = 0;
                checkboxes.forEach(function (checkbox) {
                    if (checkbox.checked) {
                        total += parseFloat(checkbox.dataset.price);
                    }
                });
                document.getElementById('originalTotal').innerText = total.toFixed(2);

                // Apply discount
                // Tính tổng giảm giá (từ mã giảm giá và điểm quy đổi)
                var discountAmount = total * (currentDiscount + currentPointDiscount);
                // Apply promotion if condition is met
//                var promotion = 0;
//                if (total > promotionCondition) {
//                    promotion = promotionAmount;
//                }
                // Apply promotion if conditions are met
                var promotionAmount = 0;
                promotions.forEach(function (promotion) {
                    if (total >= promotion.condition) {
                        promotionAmount = Math.max(promotionAmount, promotion.discountAmount);
                    }
                });
                // Đảm bảo tổng giảm giá không vượt quá tổng tiền
                discountAmount = Math.min(discountAmount, total);

                // Calculate final total after applying discounts and promotion
                var finalTotal = total - discountAmount - promotionAmount;
                finalTotal = finalTotal < 0 ? 0 : finalTotal; // Ensure total is not negative

                document.getElementById('promotion').innerText = promotionAmount.toFixed(2);
                document.getElementById('discountAmount').innerText = discountAmount.toFixed(2);
                document.getElementById('finalTotal').innerText = finalTotal.toFixed(2);
                sessionStorage.setItem('cartTotal', finalTotal.toFixed(2));
                sessionStorage.setItem('cartDiscount', discountAmount.toFixed(2));
                sessionStorage.setItem('cartPromotion', promotionAmount.toFixed(2));
            }

            document.querySelectorAll('.product-checkbox').forEach(function (checkbox) {
                checkbox.addEventListener('change', updateTotal);
            });

            function stringToObject(string) {
                let keyValuePairs = string.split(", ");
                let obj = {};

                for (let i = 0; i < keyValuePairs.length; i++) {
                    let keyValue = keyValuePairs[i].split("=");
                    let key = keyValue[0].trim();
                    let value = keyValue[1].trim();

                    if (!isNaN(value)) {
                        value = parseFloat(value);
                    }

                    obj[key] = value;
                }

                return obj;
            }

            function changeQuantity(position, obj_raw, price) {
                let value = +position.value;
                if (value <= 0) {
                    position.value = 1;
                    value = 1;
                }
                let obj = stringToObject(obj_raw);
                $.ajax({
                    url: "/HappyBeautySystem/AddToCart?service=updateQuantity&productId=" + obj.productId + "&userId=" + obj.userId + "&quantity=" + value,
                    type: "POST",
                    success: function (data) {
                        let id = obj.cartId;
                        let subtotalElement = document.getElementById('subtotal-' + id);
                        let newSubtotal = price * value;
                        subtotalElement.innerHTML = newSubtotal.toFixed(2);
                        subtotalElement.setAttribute('data-price', newSubtotal.toFixed(2));

                        // Cập nhật lại data-price của checkbox tương ứng
                        var checkbox = document.querySelector('.product-checkbox[data-product-id="' + obj.productId + '"]');
                        if (checkbox) {
                            checkbox.setAttribute('data-price', newSubtotal.toFixed(2));
                        }

                        updateTotal();  // Gọi updateTotal để cập nhật tổng giá khi thay đổi số lượng
                    },
                    error: function (xhr, status, error) {
                        console.log(error);
                    }
                });
            }

            function confirm(btn) {
                var checkboxes = document.querySelectorAll('.product-checkbox:checked');
                listProcductIdChoose = [];

                checkboxes.forEach(function (checkbox) {
                    var productId = checkbox.getAttribute('data-product-id');
                    listProcductIdChoose.push(productId);
                });

                if (listProcductIdChoose.length > 0) {
                    let link = "OrderController?service=showAll";
                    let params = new URLSearchParams();

                    for (let i = 0; i < listProcductIdChoose.length; i++) {
                        params.append('id', listProcductIdChoose[i]);
                    }
                    if (appliedCouponCode) {
                        params.append('couponCode', appliedCouponCode);
                    }
                    // đẩy tổng tiền và số tiền giảm giá sang trang check out note: annp
                    link += '&total=' + sessionStorage.getItem('cartTotal');
                    link += '&discount=' + sessionStorage.getItem('cartDiscount');
                    link += '&promotion=' + sessionStorage.getItem('cartPromotion');
                    link += '&' + params.toString();
                    window.location.href = link;
                }
            }

// Gọi updateTotal ban đầu để đảm bảo tổng giá ban đầu là 0
            updateTotal();




        </script>

        <!--        xu ly ma giam gia-->
        <script>
            let appliedCouponCode = ''; // Biến để lưu mã giảm giá đã áp dụng
            let currentDiscount = 0; // Biến để lưu giá trị giảm giá hiện tại
            function applyCoupon() {
                var couponCode = document.getElementById('couponCode').value;
                $.ajax({
                    url: "coupon?service=checkCoupon",
                    type: "POST",
                    data: {couponCode: couponCode},
                    dataType: 'json',
                    success: function (result) {
                        if (result.valid) {
                            document.getElementById('couponMessage').innerHTML = "Mã giảm giá hợp lệ. Giảm " + result.discountAmount + "%";
                            currentDiscount = parseFloat(result.discountAmount) / 100;
                            appliedCouponCode = couponCode;
                            document.getElementById('appliedCouponCode').value = couponCode;
                            updateTotal();
                        } else {
                            document.getElementById('couponMessage').innerHTML = "Mã giảm giá không hợp lệ hoặc đã hết hạn.";
                            currentDiscount = 0;
                            appliedCouponCode = '';
                            updateTotal();
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log("Error: " + error);
                        document.getElementById('couponMessage').innerHTML = "Có lỗi xảy ra khi kiểm tra mã giảm giá.";
                    }
                });
            }
        </script>

        <script>
            let appliedPoint = ''; // Biến để lưu diểm đã  áp dụng
            let currentPointDiscount = 0; //Biến để lưu giá trị giảm giá hiện tại
            function applyPoints() {
                let points = parseInt(document.getElementById('pointSelect').value);

                $.ajax({
                    url: "applypoint?service=applyPoints",
                    type: "POST",
                    data: {
                        points: points
                    },
                    dataType: 'json',
                    success: function (result) {
                        if (result.success) {
                            currentPointDiscount = result.discount / 100; // Chuyển % thành số thập phân
                            document.getElementById('pointMessage').innerHTML = "Quy đổi điểm thành công. Giảm " + result.discount + "%.";
                            updateTotal(); // Cập nhật tổng tiền với giảm giá mới
                        } else {
                            document.getElementById('pointMessage').innerHTML = result.message;
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log("Error: " + error);
                        document.getElementById('pointMessage').innerHTML = "Có lỗi xảy ra khi quy đổi điểm.";
                    }
                });
            }
        </script>

    </body>

</html>
