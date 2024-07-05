<%-- 
    Document   : login
    Created on : Feb 26, 2024, 9:48:41 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Organic Food | Login</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"><link rel="stylesheet" href="../css/login_style.css">
    </head>
    <body>
        <div class="box-form" style="margin-top: 60px">
            <div class="left">
                <div class="overlay">
                    <img src="../images/pngwing.com.png" width="30%" height="15%" />
                    <h1>Organic Food</h1>
                    <p>Sản xuất các thực phẩm đông lạnh, thực phẩm sơ chế và chế biến để đáp ứng xu
                        hướng và nhu cầu thực phẩm luôn thay đổi là điều chúng tôi làm tốt nhất.</p>
                    <a style="text-decoration: none; color: #842029" href="http://localhost:9999/assignment/home">← Quay lại trang chủ</a>
                </div>
            </div>
            <div class="right">
                <form action="login" method="post">
                    <h5>Đăng nhập</h5>
                    <p style="color: gray">Chưa có tài khoản? <a href="register.jsp">Tạo tài khoản</a> ngay tại đây!</p>
                    <div class="inputs">
                        <input name="account_name" type="text" placeholder="User name" value="${account_name}" >
                        <br>
                        <input name="password" type="password" placeholder="Password" value="${password}" >
                    </div>
                    <br>
                    <%
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                    %>
                    <div style="color: red" class="error-message">
                        <%= errorMessage %>
                    </div>
                    <% } %>
                    <br><br>
                    <div class="remember-me--forget-password">
                        <div>
                            <input type="checkbox" name="remember" value="1" ${remember =='1' ?'checked':''}/><span>Nhớ mật khẩu</span>
                        </div>
                        <a href="forget_password.jsp">Quên mật khẩu?</a>
                    </div>
                    <br>
                    <button type="submit">Đăng nhập</button>
                </form>
            </div>
        </div>
    </body>
</html>
