<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Shopping Cart</title>
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
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            h2 {
                color: #333;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            .delete-icon {
                color: #ff0000;
                cursor: pointer;
            }

            .buy-button {
                background-color: #008000;
                color: #ffffff;
                padding: 8px 15px;
                text-decoration: none;
                border-radius: 5px;
                display: inline-block;
            }

            .checkout-btn {
                background-color: #4CAF50;
                color: #ffffff;
                padding: 10px 15px;
                text-decoration: none;
                border-radius: 5px;
                display: inline-block;
                margin-top: 20px;
            }

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


        <div style="max-width: 800px; margin: 0 auto;" >
            <h2>Shopping Cart</h2>
            <table>
                <thead>
                    <tr>
                        <th>Id Product</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Delete</th>
                        <th>Buy</th>
                    </tr>
                </thead>
                <tbody id="tableCart">
                    <c:forEach items="${cart.product}" var="x"  varStatus="loop">
                        <c:if test="${x.is_delete != true}">
                            <tr>
                                <td>${x.id}</td>
                                <td><img src="${x.image1}" alt="" style="height: 50px;"/></td>
                                <td>${x.name}</td>
                                <td>${x.price}</td>
                                <td><span class="delete-icon" onclick="deleteProduct(${x.id})">&#128465;</span></td>
                                <td><button class="add-to-cart-btn" id="buyButton_${loop.index}" data-target="cookiesPopup_${loop.index}">
                                        <i class="fa fa-shopping-cart"></i>BUY
                                    </button></td>
                            </tr>
                        <div class="container-2">
                            <div class="cookiesContent" id="cookiesPopup_${loop.index}">
                                <button class="close">✖</button>
                                <img src="https://dichthuatmientrung.com.vn/wp-content/uploads/2022/06/important-sticky-note.jpg" alt="cookies-img" style="width: 50%;"/>
                                <p style="color:red; margin-top: 5%;">We will hold your intermediary funds and wait until you confirm the transaction is completely successful</p>
                                <button class="button-buy" data-id="${x.id}">BUY</button>
                            </div>
                        </div>   
                    </c:if>

                </c:forEach>
                </tbody>
            </table>

            <a href="home" class="checkout-btn">Back to home</a>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <script>

                                    // Sử dụng event delegation:
                                    document.addEventListener('click', function (event) {
                                        var target = event.target;

                                        // Kiểm tra xem nút BUY được nhấp hay không
                                        if (target.classList.contains('add-to-cart-btn')) {
                                            var targetId = target.getAttribute('data-target');
                                            var popup = document.getElementById(targetId);
                                            if (popup) {
                                                popup.style.display = 'block';
                                            }
                                        }

                                        // Kiểm tra xem nút đóng được nhấp hay không
                                        if (target.classList.contains('close')) {
                                            var popup = target.closest('.cookiesContent');
                                            if (popup) {
                                                popup.style.display = 'none';
                                            }
                                        }

                                        // Kiểm tra xem nút BUY trong popup được nhấp hay không
                                        if (target.classList.contains('button-buy')) {
                                            var productId = target.getAttribute('data-id');
                                            $.ajax({
                                                type: 'post',
                                                url: 'buy',
                                                data: {id: productId},
                                                success: function (response) {
                                                    alert(response);
                                                    window.location.href = 'home';
                                                },
                                                error: function () {
                                                    alert('Đã xảy ra lỗi khi tải trang');
                                                }
                                            });
                                        }
                                    });


                                    $(".button-buy").click(function () {
                                        var productId = $(this).data("id");
                                        $.ajax({
                                            type: 'post',
                                            url: "buy",
                                            data: {id: productId},
                                            success: function (response) {
                                                alert(response);
                                                window.location.href = "home";
                                            },
                                            error: function () {
                                                // Xử lý lỗi nếu có
                                                alert("Đã xảy ra lỗi khi tải trang");
                                            }
                                        });
                                    });

                                    function deleteProduct(deleteProductId) {

                                        $.ajax({
                                            type: "GET", // Hoặc "GET" tùy thuộc vào yêu cầu của bạn
                                            url: "AddToCartController", // Thay thế bằng URL của servlet của bạn
                                            data: {deleteProductId: deleteProductId},
                                            success: function (response) {
                                                // Xử lý kết quả từ servlet nếu cần
                                                $("#tableCart").html(response);
                                            },
                                            error: function (error) {
                                                console.log("Error:", error);
                                            }
                                        });
                                    }
        </script>
    </body>
</html>
