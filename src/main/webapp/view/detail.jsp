<%-- 
    Document   : detail
    Created on : Feb 21, 2024, 11:27:51 PM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
        <!-- script
        ================================================== -->
        <script src="js/modernizr.js"></script>
        <style>
            p{
                color: var(--navbar-color-color) ;
                font-size: 1.15em;
            }
        </style>
    </head>
    <body>
    <jsp:include page="header.jsp"></jsp:include>
        <div class="breadcrumb_tt">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="product">Sản phẩm</a></li>
                    <li class="breadcrumb-item active">${product1.name}</li>
            </ol>
        </nav>
    </div>
    <div class="display-header d-flex justify-content-center">
        <h2 class="text-dark text-uppercase">Sản phẩm</h2><br>
    </div>

    <div class="container">
        <div class="main-content-inner">
            <article>
                <div class="row product-summary">
                    <div class="col-md-6">
                        <div class="image-holder"> <img src="${product1.image}" style="padding-left: 100px; width: 100%"></div>
                    </div>
                    <div class="col-md-5">
                        <h3>${product1.name}</h3>
                        <div>
                            <p>${product1.ingredient}</p>
                        </div>
                        <div>
                            <p>${product1.price}đ</p>
                            <c:if test="${requestScope.product2 != null}">
                                <p style="color: red">Giảm ${product2.discount}% còn ${product2.price}đ</p>
                            </c:if>
                            <label>Khối lượng: </label>
                            <span>${product1.weight}g</span>
                        </div>
                        <form action="view/user/addtocart?product_id=${product1.product_id}" method="post">
                            <div>
                                <label>Số lượng: </label> 
                                <input type="number" id="quantity" name="quantity" value="1" min="1">
                            </div>
                            <div class="cart-concern position-absolute">
                                <div class="cart-button d-flex" style="margin-top: 10px">
                                    <input class="btn btn-lg btn-outline-secondary" type="submit" value="Add to cart">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-7" style="margin-left: 60px">
                        <div class="product-description" style="margin-top: 70px">
                            <h3>Mô tả</h3>
                            <p>${product1.user_manual}</p>
                        </div>
                        <div class="product-description">
                            <h3>Thông tin thêm</h3>
                            <p>${product1.more_info}</p>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="js/plugins.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
</body>
</html>
