<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Reset</title>
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
            .error-message {
                color: red;
                font-size: 0.9em;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="mb-5">
                <h2 class="h3">Password Reset</h2>
                <h3 class="fs-6 fw-normal text-secondary m-0">
                    Provide the email address associated with your account
                    to recover your password.
                </h3>
            </div>
            <form id="resetForm" action="forgotpass" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email<span>*</span></label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com" required/>
                    <div id="emailError" class="error-message"></div>
                </div>
                <div class="d-grid">
                    <button class="btn btn-primary btn-block" type="submit">Reset Password</button>
                </div>
            </form>
        </div>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
        <!-- JavaScript for email validation -->
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                var emailInput = document.getElementById("email");
                var emailError = document.getElementById("emailError");

                emailInput.oninput = function() {
                    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                    var email = emailInput.value;

                    if (!emailPattern.test(email)) {
                        emailError.textContent = "Please enter a valid email address.";
                    } else {
                        emailError.textContent = "";
                    }
                };

                var form = document.getElementById("resetForm");
                form.addEventListener("submit", function(event) {
                    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                    var email = emailInput.value;

                    if (!emailPattern.test(email)) {
                        emailError.textContent = "Please enter a valid email address.";
                        event.preventDefault();
                    } else {
                        emailError.textContent = "";
                    }
                });
            });
        </script>
    </body>
</html>
