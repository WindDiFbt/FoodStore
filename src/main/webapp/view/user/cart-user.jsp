<%-- 
    Document   : dashboard-admin
    Created on : Mar 2, 2024, 9:01:01 PM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Organic Food</title>
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="../../css/manager.css">
        <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../../css/style.css">
        <script src="../../js/bootstrap.bundle.min.js"></script>
        <style>
            .card p, span{
                font-size: 15px;
                margin: 3px 3px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header-user.jsp"></jsp:include>
            <section class="h-100" style="background-color: #eee; padding-top: 20px">
                <div class="container h-100 py-5">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-10">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h3 class="fw-normal mb-0 text-black">Giỏ hàng</h3>
                            </div>
                        <c:forEach items="${sessionScope.cart.list}" var="list">
                            <div class="card rounded-2 mb-2">
                                <div class="card-body p-3">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img
                                                src="../../${list.product.image}"
                                                class="img-fluid rounded-3" >
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p class="lead fw-normal mb-2">${list.product.name}</p>
                                            <p><span class="text-muted">Đơn giá: </span>${list.price}</p>
                                        </div>
                                        <div class="col-md-3 col-lg-3  d-flex">
                                            <div id="quantity-container" class="form-control form-control-sm" style="width: 80%; display: flex; justify-content: space-around">
                                                <div>
                                                    <a class="btn btn-primary" id="btn-decrease"  href="decreasequantity?product_id=${list.product.product_id}">-</a>
                                                </div>
                                                <div style="width: 60%">
                                                    <form action="updatequantity?product_id=${list.product.product_id}" method="post">
                                                        <input style="width: 100%; margin-top: 4px" type="text" name="quantity" id="quantity-input" value="${list.amount}">
                                                    </form>
                                                </div>
                                                <div>
                                                    <a class="btn btn-primary" id="btn-decrease" href="addtocart?product_id=${list.product.product_id}" onclick="increaseQuantity()">+</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h5 class="mb-0">${list.amount * list.price}</h5>
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <a href="deletefromcart?product_id=${list.product.product_id}" class="text-danger"><i style="font-size: 25px" class="lni lni-trash-can"></i></a>
                                        </div>
                                        <div>
                                            <p>Product ID: ${list.product.product_id } </p>
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <a href="#!" class="text-danger"><i class="lni lni-trash fa-lg"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div  class="card">
                            <div class="card-body"style="display: flex; justify-content: space-between">
                                <div>
                                    <p>Tổng giá trị đơn hàng: ${cart.total_money}</p>
                                </div>
                                <c:choose>
                                    <c:when test="${sessionScope.user != null}">
                                        <c:if test="${cart.total_money == 0 || cart.total_money == null}">
                                            <a href="../../product" type="button" class="btn btn-warning btn-block btn-center">Đặt hàng</a>
                                        </c:if>
                                        <c:if test="${cart.total_money != 0 && cart.total_money != null}">
                                            <a type="button" class="btn btn-warning btn-block btn-center" onclick="ConfirmInfo('${sessionScope.user.user_id}', '${user.fullname}', '${user.phone_number}', '${user.email}', '${user.address}', '${cart.total_money}')" 
                                               data-bs-toggle="modal" data-bs-target="#confirmInfoModal"> Đặt hàng</a>                                        
                                        </c:if>
                                    </c:when>
                                    <c:when test="${sessionScope.user == null}">
                                        <a href="../login.jsp" type="button" class="btn btn-warning btn-block btn-center">Đặt hàng</a>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Confirm order information -->
        <div id="confirmInfoModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="order" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Confirm order information</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <input type="hidden" name="user_id" id="user_idInput"/>
                                <input type="hidden" name="total_money" id="total_moneyInput"/>
                                <label>Họ và tên</label>
                                <input name="fullname" type="text" class="form-control" id="fullnameInput" required>
                            </div>
                            <div class="form-group">
                                <label>Số điện thoại</label>
                                <input name="phone_number" type="text" class="form-control" id="phone_numberInput" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input name="email" type="text" class="form-control" id="emailInput" required>
                            </div>
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <input name="address" type="text" class="form-control" id="addressInput" required>
                            </div>
                            <div class="form-group">
                                <label>Ghi chú</label>
                                <textarea rows="5" name="note" type="text" class="form-control" ></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="reset" class="btn btn-default" data-bs-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Xác nhận">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <footer id="footer"style="padding-top: 30px" >
            <div class="container">
                <div class="row">
                    <div class="footer-top-area">
                        <div class="row d-flex flex-wrap justify-content-between">
                            <div class="col-lg-3 col-sm-6 pb-3">
                                <div class="footer-menu">
                                    <img src="../../images/pngwing.com.png" height="40" width="80" alt="logo">
                                    <p>Nisi, purus vitae, ultrices nunc. Sit ac sit suscipit hendrerit. Gravida massa volutpat aenean odio erat nullam fringilla.</p>
                                    <div class="social-links">
                                        <ul class="d-flex list-unstyled">
                                            <li>
                                                <a href="#">
                                                    <svg class="facebook">
                                                    <use xlink:href="#facebook" />
                                                    </svg>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <svg class="instagram">
                                                    <use xlink:href="#instagram" />
                                                    </svg>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <svg class="twitter">
                                                    <use xlink:href="#twitter" />
                                                    </svg>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <svg class="linkedin">
                                                    <use xlink:href="#linkedin" />
                                                    </svg>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <svg class="youtube">
                                                    <use xlink:href="#youtube" />
                                                    </svg>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-sm-6 pb-3">
                                <div class="footer-menu text-uppercase">
                                    <h5 class="widget-title pb-2">Quick Links</h5>
                                    <ul class="menu-list list-unstyled text-uppercase">
                                        <li class="menu-item pb-2">
                                            <a href="#">Trang chủ</a>
                                        </li>
                                        <li class="menu-item pb-2">
                                            <a href="#">Sản phẩm</a>
                                        </li>
                                        <li class="menu-item pb-2">
                                            <a href="#">Hệ thống siêu thị</a>
                                        </li>
                                        <li class="menu-item pb-2">
                                            <a href="#">Liên hệ</a>
                                        </li>
                                        <li class="menu-item pb-2">
                                            <a href="#">Đăng nhập</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6 pb-3">
                                <h5 class=" text-uppercase text-black">Subscribe Us Now</h5>
                                <p>Get latest news, updates and deals directly mailed to your inbox.</p>
                                <form class="subscription-form validate">
                                    <div class="input-group flex-wrap">
                                        <input class="form-control btn-rounded-none" type="email" name="EMAIL" placeholder="Your email address here" required="">
                                        <button class="btn btn-sm btn-primary text-uppercase btn-rounded-none" type="submit" name="subscribe">Subscribe</button>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-3 col-sm-6 pb-3">
                                <div class="footer-menu contact-item">
                                    <h5 class="widget-title text-uppercase pb-2">Contact Us</h5>
                                    <p>Do you have any queries or suggestions? <a href="mailto:">yourinfo@gmail.com</a>
                                    </p>
                                    <p>If you need support? Just give us a call. <a href="">+55 111 222 333 44</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </footer>
        <div id="footer-bottom">
            <div class="container">
                <div class="row d-flex flex-wrap justify-content-between">
                    <div class="col-md-4 col-sm-6">
                        <div class="Shipping d-flex">
                            <p style="padding-top: 5px; margin-right: 5px">We ship with:</p>
                            <div class="card-wrap" style="font-size: 30px; padding-bottom: 10px">
                                <i class="lni lni-visa"></i>
                                <i class="lni lni-mastercard"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-5">
                        <div class="payment-method d-flex">
                            <p style="padding-top: 5px; margin-right: 5px">Payment options:</p>
                            <div class="card-wrap" style="font-size: 30px; padding-bottom: 10px">
                                <i class="lni lni-visa"></i>
                                <i class="lni lni-mastercard"></i>
                                <i class="lni lni-paypal"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function ConfirmInfo(user_id, fullname, phone_number, email, address, total_money) {
                document.getElementById('user_idInput').value = user_id;
                document.getElementById('phone_numberInput').value = phone_number;
                document.getElementById('fullnameInput').value = fullname;
                document.getElementById('emailInput').value = email;
                document.getElementById('addressInput').value = address;
                document.getElementById('total_moneyInput').value = total_money;
            }
        </script>
    </body>

</html>
