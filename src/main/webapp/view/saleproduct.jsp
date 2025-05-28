<%-- 
    Document   : saleproduct
    Created on : Mar 5, 2024, 2:35:23 AM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
        <!-- script
        ================================================== -->
        <script src="js/modernizr.js"></script>
    </head>
    <body>

    <jsp:include page="header.jsp"></jsp:include>
        <div class="breadcrumb_tt">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="product">Sản phẩm</a></li>
                    <li class="breadcrumb-item active">Sản phẩm giảm giá</li>
                </ol>
            </nav>
        </div>
        <div class="display-header d-flex justify-content-center">
            <h2 class="text-dark text-uppercase">Sản phẩm giảm giá</h2><br>
        </div>

        <div class="d-flex justify-content-center">
            <a href="product" data-bs-toggle="dropdown" aria-expanded="false" class="btn text-dark btn-outline-secondary mx-2"><i class="lni lni-funnel"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
                <li><a style="font-size: 13px" class="dropdown-item" href="sortproduct?sort=asc">Giá tăng dần</a></li>
                <li><a style="font-size: 13px" class="dropdown-item" href="sortproduct?sort=desc">Giá giảm dần</a></li>
                <li><a style="font-size: 13px" class="dropdown-item" href="listSale">Sản phẩm giảm giá</a></li>
            </ul>

            <a href="product" class="btn text-dark btn-outline-secondary mx-2">All</a>
            <c:forEach items="${listCategory}" var = "category">
                <a href="category?category_id=${category.category_id}&name=${category.name}" class="btn text-dark btn-outline-secondary mx-2 ${tag == category.category_id ? "active text-white" : ""} ">${category.name}</a>
            </c:forEach>
        </div>
        <section id="products" class="product-store padding-small position-relative">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="content" class="row">
                        <c:forEach items="${sale}" var="sale">
                            <div class="col-sm-3">
                                <div class="product product-card position-relative">
                                    <div class="image-holder">
                                        <img src="${sale.image}" class="img-thumbnail" style="height: 212px; width: 300px" alt="product-item">
                                    </div>
                                    <div class="cart-concern position-absolute">
                                        <div class="cart-button d-flex">
                                            <a href="view/user/addtocart?product_id=${sale.product_id}" class="btn btn-md btn-black">Add to Cart<svg class="cart-outline"><use xlink:href="#cart-outline"></use></svg></a>
                                        </div>
                                    </div>
                                    <div style="display: flex; justify-content:space-between " class="card-detail align-items-baseline pt-3">
                                        <p class="card-title">
                                            <a href="detail?pid=${sale.product_id}">${sale.name}</a>
                                        </p>
                                        <p style="color: red">${sale.price}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${empty sale}">
                            <p>Không tìm thấy sản phẩm</p>
                        </c:if>
                    </div>
                </div>
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
