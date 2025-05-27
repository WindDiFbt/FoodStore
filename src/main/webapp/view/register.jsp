<%-- 
    Document   : registration
    Created on : Feb 26, 2024, 9:44:16 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title> Organic Food | Register </title>
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/registration_style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="container">
            <div class="title">Đăng ký</div>
            <div class="content">
                <form id="register" action="register" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Họ và tên</span>
                            <input name="fullname" type="text" placeholder="Enter your name" value="${fullname}" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input name="email" type="text" placeholder="Enter your email" value="${email}" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Số điện thoại</span>
                            <input name="phone_number" type="text" placeholder="Enter your phone number" value="${phone_number}" required>
                        </div>
                        <div class="input-box">
                            <input type="radio" name="gender" id="dot-1" value="1" required>
                            <input type="radio" name="gender" id="dot-2" value="0" required>
                            <span class="gender-title">Giới tính</span>
                            <div class="category">
                                <label for="dot-1">
                                    <span class="dot one"></span>
                                    <span class="gender">Nam</span>
                                </label>
                                <label for="dot-2">
                                    <span class="dot two"></span>
                                    <span class="gender">Nữ</span>
                                </label>
                            </div>
                        </div>
                        <div class="input-box">
                            <span class="details">Ngày sinh</span>
                            <input type="date" name="date_of_birth" value="${date_of_birth}" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Tên tài khoản</span>
                            <input name="account_name" type="text" placeholder="Enter your username" value="${account_name}" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Mật khẩu</span>
                            <input id="password" name="password" type="password" placeholder="Enter your password" oninput="checkPasswordLength()" required>
                            <div id="passwordLengthMessage"></div>
                        </div>
                        <div class="input-box">
                            <span class="details">Xác nhận mật khẩu</span>
                            <input id="confirmPassword" name="re_password" type="password" placeholder="Confirm your password" oninput="checkPasswordMatch()" required>
                            <div id="passwordMatchMessage"></div>
                        </div>
                        <div class="input-box" style="width: 214%">
                            <span class="details">Địa chỉ</span>
                            <input name="address" type="text" placeholder="Enter your address" value="${address}" required>
                        </div>
                    </div>
                    <%
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {
                    %>
                    <div style="color: red" class="error-message">
                        <%= errorMessage %>
                    </div>
                    <% } %>
                    <div class="button">
                        <input type="submit" value="Đăng ký">
                    </div>
                </form>
                <div style="display: flex; justify-content: space-between" >
                    <div>
                        <a style="text-decoration: none" href="login.jsp">← Back</a>
                    </div>
                    <div class="">
                        <input type="reset" value="Tạo mới" onclick="resetForm()">
                    </div>
                </div>
            </div>
        </div>

        <script>
            function resetForm() {
                window.location.href = 'register.jsp';
            }

            function checkPasswordLength() {
                var passwordInput = document.getElementById("password");
                var passwordLengthMessage = document.getElementById("passwordLengthMessage");
                if (passwordInput.value.length < 6) {
                    passwordLengthMessage.textContent = "Mật khẩu phải có ít nhất 6 ký tự.";
                    passwordLengthMessage.style.color = "red";
                } else {
                    passwordLengthMessage.remove();
                }
            }

            function checkPasswordMatch() {
                var passwordInput = document.getElementById("password");
                var confirmPasswordInput = document.getElementById("confirmPassword");
                var passwordMatchMessage = document.getElementById("passwordMatchMessage");
                if (passwordInput.value === confirmPasswordInput.value) {
                    passwordMatchMessage.textContent = "Mật khẩu nhập lại khớp.";
                    passwordMatchMessage.style.color = "green";
                } else {
                    passwordMatchMessage.textContent = "Mật khẩu nhập lại không khớp.";
                    passwordMatchMessage.style.color = "red";
                }
            }
        </script>
    </body>
</html>
