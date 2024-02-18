<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Shopping Cart</title>
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
                    <c:forEach items="${cart.product}" var="x">
                        <tr>
                            <td>${x.id}</td>
                            <td><img src="${x.image1}" alt="" style="height: 50px;"/></td>
                            <td>${x.name}</td>
                            <td>${x.price}</td>
                            <td><span class="delete-icon" onclick="deleteProduct(${x.id})">&#128465;</span></td>
                            <td><a href="xxx" class="buy-button">Buy</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="home" class="checkout-btn">Back to home</a>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>
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