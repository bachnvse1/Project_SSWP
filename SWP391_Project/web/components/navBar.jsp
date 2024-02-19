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
                            <li id="notification-Button"><a href="notification"><i class="fa fa-bell"></i>
                                    Notification</a></li>

                            <li><a>${balance} VND</a></li>

                            <li id="info-Button"><a><i class="fa fa-user-o"></i>${user.display_name}</a></li>
                                    </c:if>
                                    <c:if test="${user == null}">
                            <li><a><i class="fa fa-user-o"></i></a></li>
                                    </c:if>
                                    <c:if test="${user == null}">
                            <li ><button style="color:red; border: 0; background-color: #1E1F29;" id="signin-Button">Login</button></li>
                            </c:if>
                            <c:if test="${user != null}">
                            <li><button style="color:red; border: 0; background-color: #1E1F29;" id="logout-Button">Logout</button></li>
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
                                    <img src="./img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">

                                <form action="home" method="get">
                                    <input type="" class="input" placeholder="Search here" name="searchproductname">

                                    <button class="search-btn">Search</button>
                                </form>
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
                                            <span>My Order</span>
                                        </a>
                                    </div>
                                </c:if>

                                <c:if test="${user == null}">
                                    <div>
                                        <a href="#">
                                            <i class="fa fa-heart-o"></i>
                                            <span>My Order</span>
                                        </a>
                                    </div>
                                </c:if>

                                <!-- /Wishlist -->

                                <!-- Cart -->
                                <div class="row">
                                    <a id="your-cart-button" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
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
                                <!-- /Feedback -->

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


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- jQuery Plugins -->
        <script src="js1/jquery.min.js"></script>
        <script src="js1/bootstrap.min.js"></script>
        <script src="js1/slick.min.js"></script>
        <script src="js1/nouislider.min.js"></script>
        <script src="js1/jquery.zoom.min.js"></script>
        <script src="js1/main.js"></script>
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
        </script>
    </body>
</html>
