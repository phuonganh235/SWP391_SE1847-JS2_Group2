<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #FFE4E1; /* Misty Rose */
                color: #8B4963; /* Deep pink for text */
                font-family: 'Arial', sans-serif;
            }
            .container {
                max-width: 500px;
                margin: 50px auto;
                background: #FFF0F5; /* Lavender blush */
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            }
            h2 {
                color: #DB7093; /* Pale Violet Red */
                text-align: center;
                margin-bottom: 20px;
            }
            .form-group {
                margin-bottom: 25px;
            }
            .form-control {
                border: 2px solid #FFC0CB; /* Pink */
                border-radius: 8px;
                padding: 10px 15px;
            }
            .form-control:focus {
                border-color: #FF69B4; /* Hot Pink */
                box-shadow: 0 0 0 0.2rem rgba(255, 105, 180, 0.25);
            }
            label {
                color: #C71585; /* Medium Violet Red */
                font-weight: bold;
            }
            .btn {
                background-color: #FF69B4; /* Hot Pink */
                border: none;
                color: white;
                padding: 10px 20px;
                border-radius: 8px;
                font-weight: bold;
                transition: background-color 0.3s ease;
            }
            .btn:hover {
                background-color: #FF1493; /* Deep Pink */
            }
            .error-message {
                color: #FF4500; /* Orange Red */
                font-size: 0.9em;
                margin-top: 5px;
            }
            .message {
                text-align: center;
                margin-top: 20px;
                font-weight: bold;
            }
            .links {
                margin-top: 20px;
            }
            .links a {
                color: #FF69B4; /* Hot Pink */
                text-decoration: none;
                margin: 0 10px;
            }
            .links a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Đặt lại mật khẩu của bạn</h2>
            <p>Bạn đã xác minh tài khoản thành công. Nhập mật khẩu mới bên dưới.</p>
            <form id="resetPasswordForm" action="newpass" method="post">
                <!-- New Password -->
                <div class="form-group">
                    <input type="password" class="form-control" name="new-password" id="new-password" placeholder=" " required>
                    <label for="new-password">Mật khẩu mới <span>*</span></label>
                    <div id="newPasswordError" class="error-message"></div>
                </div>

                <!-- Confirm New Password -->
                <div class="form-group">
                    <input type="password" class="form-control" name="confirm-password" id="confirm-password" placeholder=" " required>
                    <label for="confirm-password">Xác nhận mật khẩu <span>*</span></label>
                    <div id="confirmPasswordError" class="error-message"></div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn">Cập nhật mật khẩu</button>
                </div>
            </form>

            <c:choose>
                <c:when test="${requestScope.mess == 'Update Success!'}">
                    <p class="message"><a href="home">${requestScope.mess}</a></p>
                </c:when>
                <c:otherwise>
                    <p class="message">${requestScope.mess}</p>
                </c:otherwise>
            </c:choose>

            <div class="text-center mt-4">
                <hr/>
                <div class="links">
                    <a href="login">Đăng nhập</a>
                    <a href="register">Đăng ký</a>
                </div>
            </div>
        </div>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- JavaScript for form validation -->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var newPasswordInput = document.getElementById("new-password");
                var confirmPasswordInput = document.getElementById("confirm-password");

                var newPasswordError = document.getElementById("newPasswordError");
                var confirmPasswordError = document.getElementById("confirmPasswordError");

                function validateNewPassword() {
                    var password = newPasswordInput.value;
                    if (password === "") {
                        newPasswordError.textContent = "Mật khẩu không được để trống.";
                        return false;
                    } else if (password.length < 6) {
                        newPasswordError.textContent = "Mật khẩu phải có ít nhất 6 ký tự.";
                        return false;
                    } else {
                        newPasswordError.textContent = "";
                        return true;
                    }
                }

                function validateConfirmPassword() {
                    var password = newPasswordInput.value;
                    var confirmPassword = confirmPasswordInput.value;
                    if (confirmPassword === "") {
                        confirmPasswordError.textContent = "Xác nhận mật khẩu không được để trống.";
                        return false;
                    } else if (password !== confirmPassword) {
                        confirmPasswordError.textContent = "Mật khẩu không khớp.";
                        return false;
                    } else {
                        confirmPasswordError.textContent = "";
                        return true;
                    }
                }

                newPasswordInput.addEventListener("input", validateNewPassword);
                confirmPasswordInput.addEventListener("input", validateConfirmPassword);

                var form = document.getElementById("resetPasswordForm");
                form.addEventListener("submit", function (event) {
                    var isNewPasswordValid = validateNewPassword();
                    var isConfirmPasswordValid = validateConfirmPassword();

                    if (!isNewPasswordValid || !isConfirmPasswordValid) {
                        event.preventDefault();
                    }
                });
            });
        </script>
    </body>
</html>