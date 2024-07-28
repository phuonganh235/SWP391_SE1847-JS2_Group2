<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Password</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #ffe6f2;
                color: #333;
                font-family: Arial, sans-serif;
                padding-top: 50px;
            }
            .container {
                max-width: 600px;
                background: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin: auto;
            }
            h2 {
                color: #ff99cc;
            }
            label {
                color: #ff66a3;
            }
            .form-control {
                border: 1px solid #ffccdd;
                border-radius: 5px;
            }
            .btn-primary {
                background-color: #ff66a3;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .btn-primary:hover {
                background-color: #ff99cc;
            }
            .form-label span {
                color: red;
            }
            .link-secondary {
                color: #ff66a3;
            }
            .link-secondary:hover {
                text-decoration: underline;
            }
            .message {
                color: red;
                text-align: center;
            }
            .error-message {
                color: red;
                font-size: 0.9em;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="mb-5">
                <h2>Xác nhận email của bạn</h2>
                <p>Vui lòng nhập mã xác minh chúng tôi đã gửi tới ${sessionScope.email}</p>
            </div>
            <form id="verificationForm" action="validateotp" method="post">
                <div class="mb-3">
                    <label for="verification-code" class="form-label">Mã xác minh<span>*</span></label>
                    <input type="text" class="form-control" name="verification-code" id="verification-code" placeholder="Nhập mã xác minh" maxlength="6" required />
                    <div id="verificationCodeError" class="error-message"></div>
                </div>
                <div class="d-grid">
                    <button class="btn btn-primary btn-block" type="submit">Xác nhận</button>
                </div>
            </form>
            <div class="mt-4">
                <p>Không nhận được Email?
                <form action="forgotpass" method="post" style="display: inline;">
                    <input type="hidden" name="email" value="${sessionScope.email}">
                    <button type="submit" style="background: none; border: none; padding: 0; color: #ff66a3; cursor: pointer;">Gửi lại Email</button>
                </form>
                </p>
            </div>
            <c:if test="${not empty param.mess}">
                <p class="message">${param.mess}</p>
            </c:if>
            <div class="text-center mt-4">
                <hr/>
                <div>
                    <a href="login" class="link-secondary text-decoration-none">Đăng nhập</a>
                    <a href="register" class="link-secondary text-decoration-none">Đăng ký</a>
                </div>
            </div>
        </div>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var verificationCodeInput = document.getElementById("verification-code");
                var verificationCodeError = document.getElementById("verificationCodeError");

                function validateVerificationCode() {
                    var code = verificationCodeInput.value;
                    if (code.trim() === "") {
                        verificationCodeError.textContent = "Mã xác minh không được để trống.";
                        return false;
                    } else if (/\s/.test(code)) {
                        verificationCodeError.textContent = "Mã xác minh không được chứa khoảng trắng.";
                        return false;
                    } else if (!/^\d{6}$/.test(code)) {
                        verificationCodeError.textContent = "Mã xác minh phải là số có 6 chữ số.";
                        return false;
                    } else {
                        verificationCodeError.textContent = "";
                        return true;
                    }
                }

                verificationCodeInput.addEventListener("input", validateVerificationCode);

                var form = document.getElementById("verificationForm");
                form.addEventListener("submit", function (event) {
                    if (!validateVerificationCode()) {
                        event.preventDefault();
                    } else {
                        this.submit();
                    }
                });
            });
        </script>
    </body>
</html>
