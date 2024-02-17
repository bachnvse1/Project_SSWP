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
        <title>My Order</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
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

        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/myorder.css"/>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            .reportButton {
                display: inline-block;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                text-align: center;
                text-decoration: none;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border: none;
                border-radius: 8px;
                display: inline-block; /* Hiển thị các button cạnh nhau */
                margin-right: 5px;
            }
            .buttonContainer {
                white-space: nowrap; /* Ngăn chặn button từ việc xuống dòng */
            }

            .table {
                width: 100%; /* Đảm bảo bảng chiếm toàn bộ chiều rộng của container */
                border-collapse: collapse; /* Gộp viền của các ô */
            }

            .table th, .table td {
                text-align: center; /* Căn giữa nội dung trong các ô */
                vertical-align: middle; /* Căn giữa nội dung theo chiều dọc trong các ô */
                padding: 8px; /* Thêm khoảng cách giữa nội dung và viền của các ô */
                border: 1px solid #dddddd; /* Tạo viền cho các ô */
            }

            .table th {
                line-height: 1.5;
                background-color: #f2f2f2; /* Màu nền cho tiêu đề */
            }
        </style>
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
                            <li><a id="order-checking">Đang xử lí</a></li>
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
                            <li><a>Đang xử lí</a></li>
                            <li><a href="#">Đã hủy</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="table-responsive" style="margin-left: 5%">
                <div class="container mt-5">
                    <div class="d-flex justify-content-center row">
                        <div class="col-md-10">
                            <div class="rounded">
                                <div class="table-responsive table-borderless">

                                    <table class="table" id="orderBuy">
                                        <thead>
                                            <tr>
                                                <th>Code</th>
                                                <th>Status</th>
                                                <th>Seller</th>                        
                                                <th>Category</th>
                                                <th>Contact</th>
                                                <th>Price</th>
                                                <th>Transaction Fees</th>
                                                <th>Intermediary payers</th>
                                                <th>Total paid amount</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-body" id="cell-info">

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
                            <option value="7">Account</option>
                            <option value="8">Keys</option>
                            <option value="9">Document</option>
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
                        <label for="hiddenContent">Hidden Content:</label>
                        <input type="text" id="hiddenContent" name="hidden_content" required><br>

                        <input type="submit" value="ADD">
                    </form>
                </div>
            </div>

        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>

                        $(document).ready(function () {
                            // Ẩn form khi trang được tải
                            $("#addProductForm").hide();
                            $("#orderBuy").hide();
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

                        $(document).ready(function () {
                            $("#order-checking").click(function () {
                                $("#orderBuy").show();
                                $.ajax({
                                    type: 'GET',
                                    url: "orderChecking",
                                    success: function (response) {
                                        $("#cell-info").html(response);
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