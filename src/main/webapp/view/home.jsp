<%-- 
    Document   : home
    Created on : Jan 11, 2024, 5:22:25 PM
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
        <section id="billboard" class="position-relative overflow-hidden bg-light-blue">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/big_banner2.jpg" class="d-block" alt="">
                        <div class="carousel-caption d-none d-md-block">
                            <h1 class="display-2 text-uppercase text-light pb-6">Our best products</h1>
                            <a href="product" class="btn btn-medium btn-dark text-uppercase btn-rounded-none" style="margin-bottom: 20%">Sản phẩm</a>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/big_banner3.jpg" class="d-block" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h1 class="display-2 text-uppercase text-light pb-6">ngon lắm luôn á</h1>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="images/big_banner4.jpg" class="d-block" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h1 class="display-2 text-uppercase text-light pb-6">mua đi đừng ngại</h1>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>

        <section id="best_seller" class="product-store position-relative padding-large">
            <div class="container">
                <div class="row">
                    <div class="display-header d-flex justify-content-center" style="margin-bottom: 30px">
                        <h2 class="text-dark text-uppercase">Sản phẩm bán chạy</h2><br>
                    </div>
                <c:forEach begin="3" end="17" step="4" items="${listProduct}" var="product">
                    <div class="col-sm-3">
                        <div class="product-card position-relative">
                            <div class="image-holder">
                                <img src="${product.image}" class="img-thumbnail" style="height: 212px; width: 300px" alt="product-item">
                            </div>
                            <div class="cart-concern position-absolute">
                                <div class="cart-button d-flex">
                                    <a href="#" class="btn btn-md btn-black">Add to Cart<svg class="cart-outline"><use xlink:href="#cart-outline"></use></svg></a>
                                </div>
                            </div>
                            <div class="card-detail d-flex justify-content-between align-items-baseline pt-3">
                                <p class="card-title">
                                    <a href="detail?pid=${product.product_id}">${product.name}</a>
                                </p>
                                <p style="color: red">${product.price}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="swiper-pagination position-absolute text-center"></div>
    </section>

    <div class="display-header d-flex justify-content-center">
        <h2 class="text-dark text-uppercase">Sản phẩm</h2><br>
    </div>

    <section id="products" class="product-store padding-small position-relative">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <c:forEach begin="1" end="22" step="3" items="${listProduct}" var="product">
                            <div class="col-sm-3">
                                <div class="product-card position-relative">
                                    <div class="image-holder">
                                        <img src="${product.image}" class="img-thumbnail" style="height: 212px; width: 300px" alt="product-item">
                                    </div>
                                    <div class="cart-concern position-absolute">
                                        <div class="cart-button d-flex">
                                            <a href="#" class="btn btn-md btn-black">Add to Cart<svg class="cart-outline"><use xlink:href="#cart-outline"></use></svg></a>
                                        </div>
                                    </div>
                                    <div class="card-detail d-flex justify-content-between align-items-baseline pt-3">
                                        <p class="card-title">
                                            <a href="detail?pid=${product.product_id}">${product.name}</a>
                                        </p>
                                        <p style="color: red">${product.price}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="yearly-sale" class="bg-light-blue overflow-hidden mt-5 padding-xlarge" style="background-image: url('images/single-image1.png');background-position: right; background-repeat: no-repeat;">
        <div class="row d-flex flex-wrap align-items-center">
            <div class="col-md-6 col-sm-12">
                <div class="text-content offset-4 padding-medium">
                    <h3>10% off</h3>
                    <h2 class="display-2 pb-5 text-uppercase text-dark">8/3 sale</h2>
                    <a href="listSale" class="btn btn-medium btn-dark text-uppercase btn-rounded-none">Shop Sale</a>
                </div>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row">
                                <c:forEach begin="0" end="1" items="${sale}" var="sale">
                                    <div class="col-sm-5">
                                        <div class="product-card position-relative">
                                            <div class="image-holder">
                                                <img src="${sale.image}" class="img-thumbnail" style="height: 212px; width: 300px" alt="product-item">
                                            </div>
                                            <div class="card-detail d-flex justify-content-between align-items-baseline pt-3">
                                                <p class="card-title">
                                                    <a href="detail?pid=${sale.product_id}">${sale.name}</a>
                                                </p>
                                                <p style="color: red">${sale.price}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="row">
                                <c:forEach begin="2" end="3" items="${sale}" var="sale">
                                    <div class="col-sm-5">
                                        <div class="product-card position-relative">
                                            <div class="image-holder">
                                                <img src="${sale.image}" class="img-thumbnail" style="height: 212px; width: 300px" alt="product-item">
                                            </div>
                                            <div class="card-detail d-flex justify-content-between align-items-baseline pt-3">
                                                <p class="card-title">
                                                    <a href="detail?pid=${sale.product_id}">${sale.name}</a>
                                                </p>
                                                <p style="color: red">${sale.price}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="company-services" class="padding-large">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 pb-3">
                    <div class="icon-box d-flex">
                        <div class="icon-box-icon pe-3 pb-3">
                            <svg class="cart-outline">
                            <use xlink:href="#cart-outline" />
                            </svg>
                        </div>
                        <div class="icon-box-content">
                            <h3 class="card-title text-uppercase text-dark">Vận chuyển miễn phí</h3>
                            <p>Đưa sản phẩm đến tay người tiêu dùng nhanh nhất với giá tốt nhất.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 pb-3">
                    <div class="icon-box d-flex">
                        <div class="icon-box-icon pe-3 pb-3">
                            <svg class="quality">
                            <use xlink:href="#quality" />
                            </svg>
                        </div>
                        <div class="icon-box-content">
                            <h3 class="card-title text-uppercase text-dark">Chất lượng hàng đầu</h3>
                            <p>Sản phẩm được chuẩn bị kỹ lưỡng bằng tâm huyết của chúng tôi.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 pb-3">
                    <div class="icon-box d-flex">
                        <div class="icon-box-icon pe-3 pb-3">
                            <svg class="price-tag">
                            <use xlink:href="#price-tag" />
                            </svg>
                        </div>
                        <div class="icon-box-content">
                            <h3 class="card-title text-uppercase text-dark">Ưu đãi hàng ngày</h3>
                            <p>Dễ dàng tiếp cận, dễ dàng thưởng thức.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 pb-3">
                    <div class="icon-box d-flex">
                        <div class="icon-box-icon pe-3 pb-3">
                            <svg class="shield-plus">
                            <use xlink:href="#shield-plus" />
                            </svg>
                        </div>
                        <div class="icon-box-content">
                            <h3 class="card-title text-uppercase text-dark">Thanh toán dễ dàng</h3>
                            <p>Luôn bảo mật, nhanh chóng và đáng tin cậy.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="latest-blog" class="padding-large">
        <div class="container">
            <div class="row">
                <div class="display-header d-flex justify-content-between pb-3">
                    <h2 class="display-7 text-dark text-uppercase">Góc ẩm thực</h2>
                    <div class="btn-right">
                        <a href="#" class="btn btn-medium btn-normal text-uppercase">Read Blog</a>
                    </div>
                </div>
                <div class="post-grid d-flex flex-wrap justify-content-between">
                    <div class="col-lg-4 col-sm-12">
                        <div class="card border-none me-3">
                            <div class="card-image">
                                <img style="height: 212px; width: 415px" src="images/ca-basa-kho-mang.png" alt="" >
                            </div>
                        </div>
                        <div class="card-body text-uppercase">
                            <div class="card-meta text-muted">
                                <span class="meta-date">feb 26, 2024</span>
                                <span class="meta-category">- Tutorials</span>
                            </div>
                            <h3 class="card-title">
                                <a href="#">Hướng dẫn cách làm cá basa kho măng đơn giản</a>
                            </h3>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <div class="card border-none me-3">
                            <div class="card-image">
                                <img style="height: 212px; width: 450px" src="images/cach-lam-ca-hoi-ap-chao-sot-bo-290x180-c-default.jpg" alt="" class="img-fluid">
                            </div>
                        </div>
                        <div class="card-body text-uppercase">
                            <div class="card-meta text-muted">
                                <span class="meta-date">feb 25, 2024</span>
                                <span class="meta-category">- Tutorials</span>
                            </div>
                            <h3 class="card-title">
                                <a href="#">Hướng dẫn cách làm cá hồi áp chảo sốt bơ</a>
                            </h3>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <div class="card border-none me-3">
                            <div class="card-image">
                                <img style="height: 212px; width: 450px" src="images/huong-dan-cach-nau-bo-sot-vang-khoai-tay-ca-rot-290x180-c-default.jpg" alt="" class="img-fluid">
                            </div>
                        </div>
                        <div class="card-body text-uppercase">
                            <div class="card-meta text-muted">
                                <span class="meta-date">feb 22, 2024</span>
                                <span class="meta-category">- Tutorials</span>
                            </div>
                            <h3 class="card-title">
                                <a href="#">Hướng dẫn cách nấu bò sốt vang khoai tây cà rốt</a>
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp"></jsp:include>
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="js/plugins.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
</body>
</html>
