<%-- 
    Document   : MyOrder
    Created on : Jan 31, 2024, 5:10:34 PM
    Author     : tudo7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <link type="text/css" rel="stylesheet" href="css/myorder.css"/>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <%@include file="components/navBar.jsp" %>
        <div style="display: flex">
            <div>
                <div class="management" id="myproduct">
                    <div class="title-bar" onclick="toggleOptions('myproduct')">
                        <h5>Manage Product</h5>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="options">
                        <ul>
                            <li><a id="allProductButton"href="#">All product</a></li>
                            <li><a id="addProductButton" href="#">Add product</a></li>
                        </ul>
                    </div>
                </div>
                <div class="management" id="myorder">
                    <div class="title-bar" onclick="toggleOptions('myorder')">
                        <h5>Quản lí đơn mua</h5>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="options">
                        <ul>
                            <li><a href="#">Đã hoàn thành</a></li>
                            <li><a href="#">Đang xử lí</a></li>
                            <li><a href="#">Đã hủy</a></li>
                        </ul>
                    </div>
                </div>
                <div class="management" id="mysale">
                    <div class="title-bar" onclick="toggleOptions('mysale')">
                        <h5>Quản lí đơn bán</h5>
                        <span class="arrow">▼</span>
                    </div>
                    <div class="options">
                        <ul>
                            <li><a href="#">Đã hoàn thành</a></li>
                            <li><a href="#">Đang xử lí</a></li>
                            <li><a href="#">Đã hủy</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="table-responsive" style="margin-left: 5%">

                <<<<<<< HEAD
                <div class="container mt-5">
                    <div class="d-flex justify-content-center row">
                        <div class="col-md-10">
                            <div class="rounded">
                                <div class="table-responsive table-borderless">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Code</th>
                                                <th>Product Name</th>
                                                <th>Price</th>                        
                                                <th>Total amount received</th>
                                                <th>Total payment</th>
                                                <th>Transaction fees</th>
                                                <th>Status</th>
                                                <th>Party bears the fee</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-body">
                                            <tr class="cell-1">
                                                <td class="text-center">
                                                    <div class="toggle-btn">
                                                        <div class="inner-circle"></div>
                                                    </div>
                                                </td>
                                                <td>#SO-13487</td>
                                                <td>Gasper Antunes</td>
                                                <td><span class="badge badge-success">Fullfilled</span></td>
                                                <td>$2674.00</td>
                                                <td>Today</td>
                                                <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                            </tr>
                                            <tr class="cell-1">
                                                <td class="text-center">
                                                    <div class="toggle-btn">
                                                        <div class="inner-circle"></div>
                                                    </div>
                                                </td>
                                                <td>#SO-13453</td>
                                                <td>Aartsen van</td>
                                                <td><span class="badge badge-info">Confirmed</span></td>
                                                <td>$3454.00</td>
                                                <td>Yesterday</td>
                                                <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                            </tr>
                                            <tr class="cell-1">
                                                <td class="text-center">
                                                    <div class="toggle-btn">
                                                        <div class="inner-circle"></div>
                                                    </div>
                                                </td>
                                                <td>#SO-13498</td>
                                                <td>Trashes Habard</td>
                                                <td><span class="badge badge-danger">Partially shipped</span></td>
                                                <td>$6274.00</td>
                                                <td>May 12,2020</td>
                                                <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                            </tr>
                                            <tr class="cell-1">
                                                <td class="text-center">
                                                    <div class="toggle-btn">
                                                        <div class="inner-circle"></div>
                                                    </div>
                                                </td>
                                                <td>#SO-16499</td>
                                                <td>Samban Hubart</td>
                                                <td><span class="badge badge-success">Fullfilled</span></td>
                                                <td>$6375.00</td>
                                                <td>May 11,2020</td>
                                                <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="addProductForm" class="addProduct">
                    <h2>Add Product</h2>

                    <form  action="addProduct" method="post">                     
                        <label for="name">Name:</label>
                        <input type="text" name="nameProduct" required><br>

                        <label for="price">Price:</label>
                        <input type="text" name="priceProduct" required><br>

                        <label for="category">Category:</label>
                        <select name="categoryID">
                            <option value="1">Account</option>
                            <option value="2">Keys</option>
                            <option value="3">Document</option>
                            <option value="4">Others</option>
                        </select><br>

                        <label for="description">Description:</label>
                        <textarea id="description" name="Description" rows="4" required></textarea><br>

                        <label for="image1">Image 1:</label>
                        <input type="text" id="image" name="image1"><br>

                        <label for="image2">Image 2:</label>
                        <input type="text" id="image" name="image2"><br>

                        <label for="image3">Image 3:</label>
                        <input type="text" id="image" name="image3" ><br>

                        <label for="image4">Image 4:</label
                        <input type="text" id="image" name="image4"><br>

                        <label for="transactionFee">Transaction Fee:</label>
                        <input type="radio" value="seller" name="Transaction_fee" required>Seller
                        <input type="radio" value="buyer" name="Transaction_fee">Buyer<br>
                        <label for="contactMethod">Contact Method:</label>
                        <input type="text" id="contactMethod" name="Contact_Method" required><br>
                        <label for="hiddenContent">Hidden Content:</lahidden_contentbel>
                            <input type="text" id="hiddenContent" name="hidden_content" required><br>

                            <input type="submit" value="ADD">
                            </form>
                            </div>
                            </div>

                            </div>

                            <script>
                                $(document).ready(function () {
                                    // Ẩn form khi trang được tải
                                    $("#addProductForm").hide();
                                    // Xử lý sự kiện khi nhấn nút "Add Product"
                                    $("#addProductButton").click(function () {
                                        $("#addProductForm").show();
                                        $("#ProductDisplay").hide();
                                    });
                                    $("#allProductButton").click(function () {
                                        $("#addProductForm").hide();
                                        $("#ProductDisplay").show();
                                    });
                                });
                                function toggleOptions(productId) {
                                    const options = document.getElementById(productId).querySelector('.options');
                                    options.style.display = options.style.display === 'block' ? 'none' : 'block';
                                }
                            </script>
                            </body>
                            </html>