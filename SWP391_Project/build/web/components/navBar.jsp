<%-- 
    Document   : navbar
    Created on : Jan 24, 2024, 11:52:14 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #popupContainer {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: rgba(255, 255, 255, 0.9);
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                z-index: 9999;
                max-width: 80%;
                max-height: 80%;
                overflow-y: auto;
            }

            #popupContainer table.popupTable {
                border: none;
                width: 100%;
            }

            #popupContainer .content {
                margin-left: auto;
                margin-right: auto;
            }

            #popupContainer h1 {
                font-size: 24px;
                margin-bottom: 10px;
            }

            #popupContainer .notification {
                margin-bottom: 20px;
            }

            #popupContainer .icon {
                font-size: 20px;
                margin-right: 10px;
            }

            #popupContainer .small {
                font-size: 14px;
                color: #666;
            }

            #popupContainer .productInfo {
                color: black;
                text-decoration: none;
            }

            #popupContainer .productInfo:hover {
                text-decoration: underline;
            }

            #popupContainer .fa-info-circle {
                margin-left: 5px;
            }

            .general {
                background-color: white;
            }

            .notification h1 {
                font-size: 26px;
                color: #000000;
                font-weight: normal;
            }

            .notification p {
                font-size: 18px;
            }

            .notification p.small {
                font-size: 14px;
            }

            .icon {
                width: 32px;
                height: 32px;
                line-height: 32px;
                display: inline-block;
                text-align: center;
                border-radius: 16px;
                margin-right: 10px;
            }

            .failure {
                border-top: 20px #b02020 solid;
                background-color: #db9c9b;
            }

            .critical {
                border-top: 20px #c05050 solid;
                background-color: #e2afae;
            }

            .warning {
                border-top: 20px #c08040 solid;
                background-color: #e0c4aa;
            }

            .healthy {
                border-top: 20px #80c080 solid;
                background-color: #c6e2c3;
            }

            .information {
                border-top: 20px #50a0c0 solid;
                background-color: #b5d5e2;
            }

            .failure p {
                color: #3d120f;
            }

            .critical p {
                color: #3d211f;
            }

            .warning p {
                color: #44311c;
            }

            .healthy p {
                color: #364731;
            }

            .information p {
                color: #273c47;
            }

            .failure .icon {
                background-color: #b02020;
                color: #ffffff;
            }

            .critical .icon {
                background-color: #c05050;
                color: #ffffff;
                font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            }

            .warning .icon {
                background-color: #c08040;
                color: #ffffff;
                font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            }

            .healthy .icon {
                background-color: #80c080;
                color: #ffffff;
            }

            .information .icon {
                background-color: #50a0c0;
                color: #ffffff;
                font-family: Georgia, "Times New Roman", Times, serif;
                font-style: italic;
            }

            .content {
                width: 600px;
            }

            @media only screen and (max-width: 600px) {
                .content {
                    width: 100%;
                }
            }

            @media only screen and (max-width: 400px) {
                td {
                    padding: 15px 25px;
                }

                h1,
                h2 {
                    font-size: 20px;
                }

                p {
                    font-size: 13px;
                }

                small,
                .small {
                    font-size: 11px;
                }

                td.notification {
                    text-align: center;
                    padding: 10px 25px 15px 25px;
                }

                .notification h1 {
                    font-size: 22px;
                }

                .notification p {
                    font-size: 16px;
                }

                .notification p.small {
                    font-size: 12px;
                }

                .icon {
                    display: block;
                    margin: 0 auto 10px auto;
                }

            </style>
        </head>
        <body>
            <header>
                <!-- TOP HEADER -->
                <div id="top-header">
                    <div class="container">
                        <ul class="header-links pull-left">
                            <li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
                            <li><a href="#"><i class="fa fa-map-marker"></i>xxx</a></li>
                        </ul>
                        <ul class="header-links pull-right">
                            <c:if test="${user != null}">
                                <li id="notification-Button"><a><i class="fa fa-bell"></i>
                                        Thông báo</a></li>\
                                <li id="notification-Button"><a href="ManagePayment.jsp"><i class="fa fa-map-marker"></i>
                                        Quan lí thanh toán</a></li>

                                <li><a>${balance} VND</a></li>

                                <li id="info-Button"><a><i class="fa fa-user-o"></i>${user.display_name}</a></li>
                                        </c:if>
                                        <c:if test="${user == null}">
                                <li><a><i class="fa fa-user-o"></i></a></li>
                                        </c:if>
                                        <c:if test="${user == null}">
                                <li ><button style="color:red;
                                             border: 0;
                                             background-color: #1E1F29;" id="signin-Button">Đăng nhập</button></li>
                                </c:if>
                                <c:if test="${user != null}">
                                <li><button style="color:red;
                                            border: 0;
                                            background-color: #1E1F29;" id="logout-Button">Đăng xuất</button></li>
                                </c:if>

                        </ul>
                    </div>
                </div>
                <!-- /TOP HEADER -->

                <!-- MAIN HEADER -->
                <div id="header">
                    <!-- container -->
                    <div class="container">
                        <!-- row -->
                        <div class="row">
                            <!-- LOGO -->
                            <div class="col-md-2">
                                <div class="header-logo">
                                    <a href="#" class="logo">

                                    </a>
                                </div>
                            </div>
                            <!-- /LOGO -->

                            <!-- SEARCH BAR -->
                            <div class="col-md-6">
                                <div class="header-search">

                                    <form action="home" method="get">
                                        <input type="" class="input" placeholder="Search here" name="searchproductname">

                                        <button class="search-btn">Tìm kiếm</button>
                                    </form>

                                </div>
                            </div>
                            <!-- /SEARCH BAR -->

                            <!-- ACCOUNT -->
                            <div class="col-md-4 clearfix">
                                <div class="header-ctn">
                                    <!-- Wishlist -->
                                    <c:if test="${user != null}">

                                        <div>
                                            <a id="oder-Button" href="#">
                                                <i class="fa fa-heart-o"></i>
                                                <span>Đơn hàng</span>
                                            </a>

                                        </div>


                                    </c:if>

                                    <c:if test="${user == null}">
                                        <div>
                                            <a href="">
                                                <i class="fa fa-heart-o"></i>
                                                <span>Đơn hàng</span>
                                            </a>

                                        </div>
                                    </c:if>

                                    <!-- /Wishlist -->

                                    <!-- Cart -->
                                    <div class="row">
                                        <a id="your-cart-button" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span>Giỏ hàng</span>
                                            <!--<div class="qty">3</div> -->
                                        </a>
                                    </div>
                                    <!-- /Cart -->

                                    <!-- Feedback -->
                                    <div class="row">
                                        <a  href="Feedback" >
                                            <i class="fa fa-comments"></i>
                                            <span>Feedback</span>

                                        </a>
                                    </div>

                                </div>
                            </div>
                            <!-- /ACCOUNT -->
                        </div>
                        <!-- row -->
                    </div>
                    <!-- container -->
                </div>
                <!-- /MAIN HEADER -->
            </header>

            <div id="popupContainer">
                <span class="close">&times;</span>
                <table id="notificationTable" class="popupTable" style="display: none;
                       border: none" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <table id="table123" style="border: none;
                                   margin-left: auto;
                                   margin-right: auto" cellpadding="0" cellspacing="0" width="900" class="content">
                                <tr>
                                    <td class="general center">
                                        <h1 style="text-align: center;">Thông báo </h1>  
                                    </td>
                                </tr>
                                <c:forEach items="${listR}" var="r">
                                    <c:if test="${r.getType_report() == 1}">
                                        <tr class="abc">
                                            <td class="failure notification">
                                                <h1><span class="icon">&times;</span>Khiếu nại đơn hàng</h1>
                                                <p class="small">${r.getDescription()}</p>
                                                
                                            </td>
                                        </tr>
                                    </c:if>

                                    <c:if test="${r.getType_report() == 2}">
                                        <tr class="abc">
                                            <td class="warning notification">
                                                <h1><span class="icon">&quest;</span>Đang kiểm tra đơn hàng</h1>
                                                <p class="small">${r.getDescription()}</p>
                                                
                                            </td>
                                        </tr>
                                    </c:if>

                                    <c:if test="${r.getType_report() == 3}">
                                        <tr class="abc">
                                            <td class="healthy notification">
                                                <h1><span class="icon">&check;</span>Sẵn sàng giao dịch</h1>
                                                <p class="small">${r.getDescription()}</p>
                                                
                                            </td>
                                        </tr>
                                    </c:if>

                                    <c:if test="${r.getType_report() == 4}">
                                        <tr class="abc">
                                            <td class="healthy notification">
                                                <h1><span class="icon">&check;</span>Đơn hàng đã hoàn tất</h1>
                                                <p class="small">${r.getDescription()}</p>
                                                
                                            </td>
                                        </tr>
                                    </c:if>
                                        
                                        <c:if test="${r.getType_report() == 5}">
                                        <tr class="abc">
                                            <td class="warning notification">
                                                <h1><span class="icon">&check;</span>Thông báo nạp tiền</h1>
                                                <p class="small">${r.getDescription()}</p>
                                                
                                            </td>
                                        </tr>
                                    </c:if>
                                        
                                    <c:if test="${r.getType_report() == 7}">
                                        <tr class="abc">
                                            <td class="information notification">
                                                <h1><span class="icon">&check;</span>Yêu cầu admin giải quyết</h1>
                                                <p class="small">${r.getDescription()}</p>
                                               
                                            </td>
                                        </tr>
                                    </c:if>
                                    <tr><!-- Thêm dòng trống trước button Load More -->
                                        <td style="height: 20px;"></td>
                                    </tr>
                                </c:forEach>

                                <!--                                                <tr>
                                                                                    <td class="information notification">
                                                                                        <h1><span class="icon">i</span>Information</h1>
                                                                                        <p>The "something or other" system information</p>
                                                                                        <p class="small">Any supplementary information</p>
                                                                                    </td>
                                                                                </tr>-->

                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <button style="padding: 10px 20px;
                                    background-color: #0061f2;
                                    color: #fff;
                                    border: none;
                                    cursor: pointer;
                                    border-radius: 5px;" onclick="loadMore()">Load More</button>
                        </td>
                    </tr>
                </table>

            </div>



            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <!-- jQuery Plugins -->
            <!--        <script src="js1/jquery.min.js"></script>
                    <script src="js1/bootstrap.min.js"></script>
                    <script src="js1/slick.min.js"></script>
                    <script src="js1/nouislider.min.js"></script>
                    <script src="js1/jquery.zoom.min.js"></script>
                    <script src="js1/main"></script>-->

            <script src="jscript/signin_captcha.js"></script>

            <script>
                                $(document).ready(function () {
                                    $("#info-Button").click(function () {
                                        $.ajax({
                                            type: 'GET',
                                            url: "editprofile.jsp",
                                            success: function (response) {
                                                window.location.href = "editprofile.jsp";
                                            },
                                            error: function () {
                                                // Xử lý lỗi nếu có
                                                alert("Đã xảy ra lỗi khi tải trang");
                                            }
                                        });
                                    });

                                });


                                $(document).ready(function () {
                                    $("#oder-Button").click(function () {
                                        $.ajax({
                                            type: 'GET',
                                            url: "manageMyOrder",
                                            success: function (response) {
                                                window.location.href = "manageMyOrder";
                                            },
                                            error: function () {
                                                // Xử lý lỗi nếu có
                                                alert("Đã xảy ra lỗi khi tải trang");
                                            }
                                        });
                                    });
                                });

                                $(document).ready(function () {
                                    $("#logout-Button").click(function () {
                                        $.ajax({
                                            type: 'POST',
                                            url: "logout",
                                            success: function (response) {
                                                $("body").html(response);
                                            },
                                            error: function () {
                                                // Xử lý lỗi nếu có
                                                alert("Đã xảy ra lỗi khi tải trang");
                                            }
                                        });
                                    });
                                });
                                $(document).ready(function () {
                                    // Xử lý khi nhấp vào nút "Your Cart"
                                    $("#your-cart-button").click(function () {
                                        // Thực hiện chuyển hướng đến trang mong muốn (thay "your-cart-page" bằng đường dẫn thực tế)
                                        window.location.href = "Cart.jsp";
                                    });
                                });
                                $(".close").click(function () {
                                    const popupContainer = document.getElementById('popupContainer');
                                    const tablePopup = document.getElementById('notificationTable');
                                    popupContainer.style.display = 'none';
                                    tablePopup.style.display = 'none';
                                });

                                function loadMore() {
                                    var amount = document.getElementsByClassName("abc").length;
                                    $.ajax({
                                        url: 'notification',
                                        type: 'get',
                                        data: {
                                            exists: amount
                                        },
                                        success: function (response) {
                                            document.getElementById("table123").innerHTML += response;

                                        },
                                        error: function (xhr) {
                                            console.error(xhr.response);
                                        }


                                    });
                                }
            </script>

        </body>
    </html>
