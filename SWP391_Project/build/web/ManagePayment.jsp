<%-- 
    Document   : ManagePayment
    Created on : Mar 16, 2024, 3:28:55 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
=========================================================
* Argon Dashboard 2 - v2.0.4
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2022 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="./assets/img/favicon.png">
        <title>
            Quản lí thanh toán
        </title>
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
        <!-- Nucleo Icons -->
        <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- CSS Files -->
        <link id="pagestyle" href="./assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
        <style>
            .main-content {
                min-height: 60vh; /* Thay đổi chiều cao để nâng cao lên */
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .custom-form {
                background-color: #ffffff;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }

            .custom-form form {
                margin-bottom: 0;
            }

            .custom-form label {
                font-weight: bold;
            }

            .custom-form .form-control {
                border-radius: 8px;
            }

            .custom-form .custom-btn {
                width: 100%;
            }



        </style>
    </head>

    <body class="g-sidenav-show   bg-gray-100">
        <aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 " id="sidenav-main">
            <div class="sidenav-header">
                <a class="navbar-brand m-0" href=" https://demos.creative-tim.com/argon-dashboard/pages/dashboard.html " target="_blank">
                    <span class="ms-1 font-weight-bold">Quản lí thanh toán</span>
                </a>
            </div>
            <hr class="horizontal dark mt-0">
            <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" href="">
                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1" id="formDeposite">Nạp tiền</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="">
                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1" id="">Rút tiền</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="">
                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-credit-card text-success text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Lịch sử giao dịch</span>
                        </a>
                    </li>

                    <div class="sidenav-footer mx-3 ">
                        <a class="btn btn-primary btn-sm mb-0 w-100" href="home" type="button">Trang chủ</a>
                    </div>
                    </aside>
                    <main class="main-content position-relative border-radius-lg d-flex justify-content-center align-items-center">
                        <div class="row">
                            <div class="col-lg-5 mb-lg-0 mb-3">
                                <p class="mb-0"><span class="fw-bold">Phương thức</span><span class="c-green">: Cổng thanh toán VNPAY</span></p>
                                <p class="mb-0">Thu thêm 3000đ cho những đơn hàng dưới 100.000đ. Quý khách vui lòng nhập đúng thông tin tránh sai sót không đáng có !</p>
                                <div class="text-center mt-4">
                                    <a href="home" class="btn btn-success">Chú ý</a>
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <div class="custom-form">
                                    <form class="form" id="vnpayForm">
                                        <div class="mb-3">
                                            <label for="amountVnpay" class="form-label">Số tiền:</label>
                                            <input name="amount" id="amountVnpay" type="text" class="form-control" placeholder="">
                                        </div>
                                        <div class="mb-3">
                                            <label for="desVnpay" class="form-label">Mô tả khoản nạp:</label>
                                            <input name="description" id="desVnpay" type="text" class="form-control" placeholder="">
                                        </div>
                                        <div class="mb-3">
                                            <input type="submit" class="btn btn-primary custom-btn" value="Nạp tiền">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </main>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                    <script src="jscript/vnpay.js"></script>
                    <!--   Core JS Files   -->
                    <script src="./assets/js/core/popper.min.js"></script>
                    <script src="./assets/js/core/bootstrap.min.js"></script>
                    <script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
                    <script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
                    <script src="./assets/js/plugins/chartjs.min.js"></script>

                    </body>

                    </html>
