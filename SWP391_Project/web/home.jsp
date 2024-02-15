<%-- 
    Document   : Home
    Created on : Jan 15, 2024, 9:39:31 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Electro - HTML Ecommerce Template</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <style>
            .container-2 {
                position: relative;
            }

            .cookiesContent {
                text-align: center;
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #fff;
                padding: 20px;
                border: 1px solid #ccc;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                z-index: 9999; /* Đặt z-index để thẻ luôn hiển thị trên cùng */
            }

            .show {
                display: block !important;
            }

            .button-buy {
                position: relative;
                display: inline-block;
                margin: 15px;
                padding: 15px 15px;
                text-align: center;
                font-size: 18px;
                letter-spacing: 1px;
                text-decoration: none;
                color: #725AC1;
                background: transparent;
                cursor: pointer;
                transition: ease-out 0.5s;
                border: 2px solid #725AC1;
                border-radius: 10px;
                box-shadow: inset 0 0 0 0 #725AC1;
            }

            .button-buy:hover {
                color: white;
                box-shadow: inset 0 -100px 0 0 #725AC1;
            }

            .button-buy:active {
                transform: scale(0.9);
            }
        </style>

    </head>

    <body>
        <!-- HEADER -->
        <%@include file="components/navBar.jsp" %>
        <!-- /NAVIGATION -->
        <!-- /NAVIGATION -->
        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Product</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    <c:forEach items="${listCategory}" var="c">
                                        <li><a data-toggle="tab" href="" value="${c.id}">${c.name}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <c:forEach items="${listProduct}" var="p" varStatus="loop">
                                        <div class="col-md-3">
                                            <!-- product -->

                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="${p.image1}" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="#">${p.name}</a></h3>
                                                    <h4 class="product-price">${p.price} <del
                                                            class="product-old-price">$990.00</del></h4>

                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                                class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                                class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view"><i class="fa fa-eye"></i><span
                                                                class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <!-- Thêm một ID động cho nút "Thêm vào giỏ hàng" -->
                                                    <button class="add-to-cart-btn" id="buyButton_${loop.index}" data-target="cookiesPopup_${loop.index}">
                                                        <i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="container-2">
                                                <div class="cookiesContent" id="cookiesPopup_${loop.index}">
                                                    <button class="close">✖</button>
                                                    <img src="https://dichthuatmientrung.com.vn/wp-content/uploads/2022/06/important-sticky-note.jpg" alt="cookies-img" style="width: 50%;"/>
                                                    <p style="color:red; margin-top: 5%;">We will hold your intermediary funds and wait until you confirm the transaction is completely successful</p>
                                                    <button class="button-buy" data-id="${p.id}">BUY</button>
                                                </div>
                                            </div>               
                                            <!-- /product -->

                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>

                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->



        <script>
            <c:forEach items="${listProduct}" var="p" varStatus="loop">
            document.querySelector('#buyButton_${loop.index}').addEventListener('click', function () {
                document.getElementById('cookiesPopup_${loop.index}').style.display = 'block';
            });

            // Lấy tất cả các nút đóng của popup tương ứng và thêm trình nghe sự kiện
            var closeButtons_${loop.index} = document.querySelectorAll('#cookiesPopup_${loop.index} .close');
            closeButtons_${loop.index}.forEach(function (button) {
                button.addEventListener('click', function () {
                    // Tìm popup chứa nút đóng và ẩn nó
                    var popup = this.closest('.cookiesContent');
                    popup.style.display = 'none';
                });
            });
            </c:forEach>
        </script>

        <!-- FOOTER -->
        <%@include file="components/footer.jsp" %>
        <!-- /FOOTER -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="jscript/signin_captcha.js"></script>
        <!-- jQuery Plugins -->
        <script src="js1/jquery.min.js"></script>
        <script src="js1/bootstrap.min.js"></script>
        <script src="js1/slick.min.js"></script>
        <script src="js1/nouislider.min.js"></script>
        <script src="js1/jquery.zoom.min.js"></script>
        <script src="js1/main.js"></script>
        <script>
            $(document).ready(function () {
                $(".button-buy").click(function () {
                    var productId = $(this).data("id");
                    $.ajax({
                        type: 'post',
                        url: "buy",
                        data: {id: productId},
                        success: function (response) {
                            alert(response);
                        },
                        error: function () {
                            // Xử lý lỗi nếu có
                            alert("Đã xảy ra lỗi khi tải trang");
                        }
                    });
                });
            });

        </script>
    </body>
</html>

