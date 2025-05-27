<%-- 
    Document   : sidebar
    Created on : Mar 2, 2024, 11:30:11 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="../../css/admin_style.css">
    </head>
    <body>
        <aside id="sidebar">
            <div class="d-flex">
                <button style="padding-top: 20px" class="toggle-btn" type="button">
                    <i class="lni lni-grid-alt"></i>
                </button>
                <div class="sidebar-logo">
                    <img src="../../${user.avatar}" width="50%" height="20%" style="margin-left:  10px; border-radius: 50%" />
                    <p style="color: white">Xin chào ${user.account_name}</p>
                </div>
            </div>
            <ul class="sidebar-nav">
                <li class="sidebar-item">
                    <a href="user_detail" class="sidebar-link">
                        <i class="lni lni-user"></i>
                        <span>Thông tin người dùng</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                       data-bs-target="#auth" aria-expanded="false" aria-controls="auth">
                        <i class="lni lni-cart-full"></i>
                        <span>Thông tin đơn hàng</span>
                    </a>
                    <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="listorder" class="sidebar-link">Tất cả đơn hàng</a>
                        </li>
                        <li class="sidebar-item">
                            <a href="listorder?od_status=0" class="sidebar-link">Đang xử lý</a>
                        </li>
                        <li class="sidebar-item">
                            <a href="listorder?od_status=1" class="sidebar-link">Đang vận chuyển</a>
                        </li>
                        <li class="sidebar-item">
                            <a href="listorder?od_status=2" class="sidebar-link">Đã hoàn thành</a>
                        </li>
                        <li class="sidebar-item">
                            <a href="listorder?od_status=3" class="sidebar-link">Đã hủy</a>
                        </li>
                    </ul>
                </li>

                <li class="sidebar-item">
                    <a href="#" class="sidebar-link">
                        <i class="lni lni-popup"></i>
                        <span>Notification</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link">
                        <i class="lni lni-cog"></i>
                        <span>Setting</span>
                    </a>
                </li>
            </ul>
            <div class="sidebar-footer">
                <a href="../logout" class="sidebar-link">
                    <i class="lni lni-exit"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>
    </body>
</html>
