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
                background-color: #ffe6f2;
                color: #333;
                font-family: Arial, sans-serif;
            }
            .container {
                max-width: 600px;
                margin: 50px auto;
                background: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h2 {
                color: #ff99cc;
            }
            label {
                color: #ff66a3;
            }
            input[type="text"], input[type="password"] {
                border: 1px solid #ffccdd;
                border-radius: 5px;
                padding: 10px;
                width: 100%;
                margin-bottom: 10px;
            }
            button {
                background-color: #ff66a3;
                color: white;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            button:hover {
                background-color: #ff99cc;
            }
            .links a {
                color: #ff66a3;
                margin-right: 10px;
                text-decoration: none;
            }
            .links a:hover {
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
            <h2>Reset Your Password</h2>
            <p>You've Successfully Verified Your Account. Enter New Password Below.</p>
            <form id="resetPasswordForm" action="newpass" method="post">
                <!-- Username -->
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Username" name="username" id="username" required>
                    <label for="username">Username</label>
                    <div id="usernameError" class="error-message"></div>
                </div>

                <!-- New Password -->
                <div class="form-group">
                    <input type="password" class="form-control" name="new-password" id="new-password" placeholder=" " required>
                    <label for="new-password">New Password <span>*</span></label>
                    <div id="newPasswordError" class="error-message"></div>
                </div>

                <!-- Confirm New Password -->
                <div class="form-group">
                    <input type="password" class="form-control" name="confirm-password" id="confirm-password" placeholder=" " required>
                    <label for="confirm-password">Confirm New Password <span>*</span></label>
                    <div id="confirmPasswordError" class="error-message"></div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn">Update Password</button>
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
                    <a href="login">Login</a>
                    <a href="register">Register</a>
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
                var usernameInput = document.getElementById("username");
                var newPasswordInput = document.getElementById("new-password");
                var confirmPasswordInput = document.getElementById("confirm-password");

                var usernameError = document.getElementById("usernameError");
                var newPasswordError = document.getElementById("newPasswordError");
                var confirmPasswordError = document.getElementById("confirmPasswordError");

                function validateUsername() {
                    var username = usernameInput.value.trim();
                    if (username === "") {
                        usernameError.textContent = "Username must not be empty.";
                        return false;
                    } else if (username.length < 3 || username.length > 20) {
                        usernameError.textContent = "Username must be between 3 and 20 characters.";
                        return false;
                    } else if (/\s/.test(username)) {
                        usernameError.textContent = "Username cannot contain spaces.";
                        return false;
                    } else {
                        usernameError.textContent = "";
                        return true;
                    }
                }

                function validateNewPassword() {
                    var password = newPasswordInput.value;
                    if (password === "") {
                        newPasswordError.textContent = "Password must not be empty.";
                        return false;
                    } else if (password.length < 6) {
                        newPasswordError.textContent = "Password must be at least 6 characters.";
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
                        confirmPasswordError.textContent = "Confirm Password must not be empty.";
                        return false;
                    } else if (password !== confirmPassword) {
                        confirmPasswordError.textContent = "Passwords do not match.";
                        return false;
                    } else {
                        confirmPasswordError.textContent = "";
                        return true;
                    }
                }

                usernameInput.addEventListener("input", validateUsername);
                newPasswordInput.addEventListener("input", validateNewPassword);
                confirmPasswordInput.addEventListener("input", validateConfirmPassword);

                var form = document.getElementById("resetPasswordForm");
                form.addEventListener("submit", function (event) {
                    var isUsernameValid = validateUsername();
                    var isNewPasswordValid = validateNewPassword();
                    var isConfirmPasswordValid = validateConfirmPassword();

                    if (!isUsernameValid || !isNewPasswordValid || !isConfirmPasswordValid) {
                        event.preventDefault();
                    }
                });
            });
        </script>
    </body>
</html>
