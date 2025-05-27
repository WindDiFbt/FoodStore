<%-- 
    Document   : store
    Created on : Jan 11, 2024, 10:04:28 PM
    Author     : Asus
--%>

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
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
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
            <div class="formbold-main-wrapper" style="padding-top: 150px">
                <div class="formbold-form-wrapper border border-secondary">
                    <img src="">
                    <div>
                        <h4 style="text-align: center; color: red">Hệ thống cửa hàng</h4>
                    </div>
                    <div class="formbold-input-wrapp formbold-mb-3">
                        <label class="formbold-form-label"> 4 place on the nationwide </label>
                        <div>
                            <span><i class="lni lni-map-marker"></i></span>
                            <p>Xóm Văn Thánh, Phường Đồng Bẩm, Thành Phố Thái Nguyên, Tỉnh Thái Nguyên</p>
                        </div>
                    </div>
                    <div class="formbold-input-wrapp formbold-mb-3">
                        <div>
                            <span><i class="lni lni-map-marker"></i></span>
                            <p>Khu Dân cư, Hoàng Văn Thụ, Quận Hà Đông, Thành Phố Hà Nội</p>
                        </div>
                    </div>
                    <div class="formbold-input-wrapp formbold-mb-3">
                        <div>
                            <span><i class="lni lni-map-marker"></i></span>
                            <p>Số 9-11, Ngõ Thổ Quan, Quận Đống Đa, Thành Phố Hà Nội</p>
                        </div>
                    </div>
                    <div class="formbold-input-wrapp formbold-mb-3">
                        <div>
                            <span><i class="lni lni-map-marker"></i></span>
                            <p>Trung tâm thương mại – Việt Nam tại Lô1/20 KĐT Ngã Năm Sân bay Cát Bi, Ngô Quyền, Hải Phòng</p>
                        </div>
                    </div>
                </div>
            </div>
            <style>
                @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                .formbold-mb-3 {
                    margin-bottom: 15px;
                }
                .formbold-relative {
                    position: relative;
                }
                .formbold-opacity-0 {
                    opacity: 0;
                }
                .formbold-stroke-current {
                    stroke: #ffffff;
                    z-index: 999;
                }
                #supportCheckbox:checked ~ div span {
                    opacity: 1;
                }
                #supportCheckbox:checked ~ div {
                    background: #6a64f1;
                    border-color: #6a64f1;
                }

                .formbold-main-wrapper {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 48px;
                }

                .formbold-form-wrapper {
                    margin: 0 auto;
                    max-width: 770px;
                    width: 100%;
                    background: white;
                    padding: 40px;
                }

                .formbold-img {
                    display: block;
                    margin: 0 auto 45px;
                }

                .formbold-input-wrapp > div {
                    display: flex;
                    gap: 20px;
                }

                .formbold-input-flex {
                    display: flex;
                    gap: 20px;
                    margin-bottom: 15px;
                }
                .formbold-input-flex > div {
                    width: 50%;
                }
                .formbold-form-input {
                    width: 100%;
                    padding: 13px 22px;
                    border-radius: 5px;
                    border: 1px solid #dde3ec;
                    background: #ffffff;
                    font-weight: 500;
                    font-size: 16px;
                    color: #536387;
                    outline: none;
                    resize: none;
                }
                .formbold-form-input::placeholder,
                select.formbold-form-input,
                .formbold-form-input[type='date']::-webkit-datetime-edit-text,
                .formbold-form-input[type='date']::-webkit-datetime-edit-month-field,
                .formbold-form-input[type='date']::-webkit-datetime-edit-day-field,
                .formbold-form-input[type='date']::-webkit-datetime-edit-year-field {
                    color: rgba(83, 99, 135, 0.5);
                }

                .formbold-form-input:focus {
                    border-color: #6a64f1;
                    box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
                }
                .formbold-form-label {
                    color: #536387;
                    font-size: 14px;
                    line-height: 24px;
                    display: block;
                    margin-bottom: 10px;
                }

                .formbold-checkbox-label {
                    display: flex;
                    cursor: pointer;
                    user-select: none;
                    font-size: 16px;
                    line-height: 24px;
                    color: #536387;
                }
                .formbold-checkbox-label a {
                    margin-left: 5px;
                    color: #6a64f1;
                }
                .formbold-input-checkbox {
                    position: absolute;
                    width: 1px;
                    height: 1px;
                    padding: 0;
                    margin: -1px;
                    overflow: hidden;
                    clip: rect(0, 0, 0, 0);
                    white-space: nowrap;
                    border-width: 0;
                }
                .formbold-checkbox-inner {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    width: 20px;
                    height: 20px;
                    margin-right: 16px;
                    margin-top: 2px;
                    border: 0.7px solid #dde3ec;
                    border-radius: 3px;
                }

                .formbold-form-file {
                    padding: 12px;
                    font-size: 14px;
                    line-height: 24px;
                    color: rgba(83, 99, 135, 0.5);
                }
                .formbold-form-file::-webkit-file-upload-button {
                    display: none;
                }
                .formbold-form-file:before {
                    content: 'Upload';
                    display: inline-block;
                    background: #EEEEEE;
                    border: 0.5px solid #E7E7E7;
                    border-radius: 3px;
                    padding: 3px 12px;
                    outline: none;
                    white-space: nowrap;
                    -webkit-user-select: none;
                    cursor: pointer;
                    color: #637381;
                    font-weight: 500;
                    font-size: 12px;
                    line-height: 16px;
                    margin-right: 10px;
                }

                .formbold-btn {
                    font-size: 16px;
                    border-radius: 5px;
                    padding: 14px 25px;
                    border: none;
                    font-weight: 500;
                    background-color: #6a64f1;
                    color: white;
                    cursor: pointer;
                    margin-top: 25px;
                }
                .formbold-btn:hover {
                    box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
                }

                .formbold-w-45 {
                    width: 45%;
                }
            </style>

        <jsp:include page="footer.jsp"></jsp:include>
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="js/plugins.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>
