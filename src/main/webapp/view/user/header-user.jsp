<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
    Document   : header
    Created on : Jan 14, 2024, 10:24:23 PM
    Author     : Asus-->


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Organic Food</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../../css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
        <!-- script
        ================================================== -->
        <script src="../../js/modernizr.js"></script>
    </head>

    <div class="search-popup">
        <div class="search-popup-container">
            <form action="search" method="post" class="search-form" >
                <input type="search" id="search-form" class="search-field" placeholder="Nhập và nhấn enter" value="" name="txt" />
                <button type="submit" class="search-submit"><svg class="search"><use xlink:href="#search"></use></svg></button>
            </form>
            <h5 class="cat-list-title">Browse Categories</h5>
            <ul class="cat-list">
                <li class="cat-list-item">
                    <a href="category?category_id=1&name=Bánh%20chuối" title="Mobile Phones">Bánh chuối</a>
                </li>
                <li class="cat-list-item">
                    <a href="category?category_id=2&name=Bánh%20khoai%20môn" title="Smart Watches">Bánh khoai môn</a>
                </li>
                <li class="cat-list-item">
                    <a href="category?category_id=3&name=Bánh%20pizza" title="Headphones">Bánh pizza</a>
                </li>
                <li class="cat-list-item">
                    <a href="category?category_id=5&name=Hải%20sản" title="Accessories">Hải sản</a>
                </li>
                <li class="cat-list-item">
                    <a href="category?category_id=6&name=Khoai%20lang%20kén" title="Monitors">Khoai lang kén</a>
                </li>
                <li class="cat-list-item">
                    <a href="category?category_id=7&name=Nem%20gia%20đình" title="Speakers">Nem gia đình</a>
                </li>
                <li class="cat-list-item">
                    <a href="category?category_id=8&name=Niêu%20tình%20yêu" title="Memory Cards">Niêu tình yêu</a>
                </li>
            </ul>
        </div>
    </div>

    <header id="header" class="site-header header-scrolled position-fixed text-black bg-light">
        <nav id="header-nav" class="navbar navbar-expand-lg px-3 mb-0">
            <div class="container-fluid">
                <button class="navbar-toggler d-flex d-lg-none order-3 p-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#bdNavbar" aria-controls="bdNavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <svg class="navbar-icon">
                    <use xlink:href="#navbar-icon"></use>
                    </svg>
                </button>
                <div class="offcanvas offcanvas-end" tabindex="-1" id="bdNavbar" aria-labelledby="bdNavbarOffcanvasLabel">
                    <div class="offcanvas-header px-4 pb-0">
                        <a class="navbar-brand" href="index.html">
                            <img src="images/pngwing.com.png" width="100" height="50" class="logo">
                        </a>
                        <button type="button" class="btn-close btn-close-black" data-bs-dismiss="offcanvas" aria-label="Close" data-bs-target="#bdNavbar"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul id="navbar" class="navbar-nav text-uppercase justify-content-end align-items-center flex-grow-1 pe-3">
                            <%String currentPage = request.getRequestURI(); %>
                            <li class="nav-item">
                                <a class="nav-link me-4 <%= currentPage.endsWith("home.jsp") ? "active" : "" %>" href="../../home">Trang chủ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link me-4 <%= currentPage.endsWith("product.jsp") ? "active" : "" %>" href="../../product">Sản phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link me-4 <%= currentPage.endsWith("store.jsp") ? "active" : "" %>" href="../../store">Hệ thống siêu thị</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link me-4 <%= currentPage.endsWith("feedback.jsp") ? "active" : "" %>" href="../../feedback">Liên hệ</a>
                            </li>
                            <c:if test="${sessionScope.user == null}">
                                <li class="nav-item">
                                    <a class="nav-link me-4 <%= currentPage.endsWith("login.jsp") ? "active" : "" %>" href="../login">Đăng nhập</a>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <div class="user-items ps-5">
                                    <ul class="d-flex justify-content-end list-unstyled">
                                        <c:if test="${sessionScope.user == null}">
                                            <li class="pe-3">
                                                <a href="#">
                                                    <svg class="user">
                                                    <use xlink:href="#user"></use>
                                                    </svg>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.user != null}">
                                            <div class="dropdown">
                                                <li class="pe-3">
                                                    <img style="width: 25px; border-radius: 50%" src="../../${sessionScope.user.avatar}"  type=""  data-bs-toggle="dropdown" aria-expanded="false">
                                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
                                                        <li><a style="font-size: 13px" class="dropdown-item" href="user_detail">Tài khoản của tôi</a></li>
                                                        <li><a style="font-size: 13px" class="dropdown-item" href="listorder">Đơn hàng của tôi</a></li>
                                                        <li><a style="font-size: 13px" class="dropdown-item" href="../logout"> Đăng xuất</a></li>
                                                    </ul>
                                                </li>
                                            </div>
                                        </c:if>
                                        <li>
                                            <a href="cart">
                                                <svg class="cart">
                                                <use xlink:href="#cart"></use>
                                                </svg>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </header>
</html>



