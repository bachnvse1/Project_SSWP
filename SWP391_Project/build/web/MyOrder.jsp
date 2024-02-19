<%-- 
    Document   : MyOrder
    Created on : Jan 31, 2024, 5:10:34 PM
    Author     : tudo7
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="css/font-awesome.min.css"/>
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
            .reportButton, .verifyButton {
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

            /* Modal */
            /* Modal */
            .modal3 {
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.6); /* Màu nền mờ */
                display: none; /* Ẩn modal ban đầu */
            }

            /* Modal Content */
            .modal-content3 {
                background-color: #fefefe;
                margin: 10% auto; /* Độ cao từ trên xuống modal */
                padding: 20px;
                border: 1px solid #888;
                width: 60%; /* Độ rộng của modal */
                border-radius: 10px; /* Bo tròn các góc */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Hiệu ứng đổ bóng */
                display: flex; /* Sử dụng flexbox để sắp xếp các cột hàng dọc */
                flex-direction: column; /* Sắp xếp các phần tử thành cột hàng dọc */
            }

            /* Close Button */
            .close {
                color: #aaa;
                align-self: flex-end; /* Đẩy nút đóng về phía cuối cùng của modal */
                font-size: 28px;
                font-weight: bold;
                margin-bottom: 10px; /* Khoảng cách giữa nút đóng và các phần tử khác */
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

            /* Các phần tử trong modal */
            .modal-content3 label,
            .modal-content3 input,
            .modal-content3 textarea {
                margin-bottom: 10px; /* Khoảng cách giữa các phần tử */
            }

            .modal-content3 input,
            .modal-content3 textarea {
                width: calc(100% - 40px); /* Độ rộng của input và textarea */
                padding: 10px; /* Khoảng cách giữa nội dung và viền */
                border-radius: 5px; /* Bo tròn các góc */
                border: 1px solid #ccc; /* Viền */
            }

            .modal-content3 textarea {
                height: 150px; /* Độ cao của textarea */
            }




            #myModalVerify {
                text-align: center;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

            #titleorder {
                margin-bottom: 20px;
                color: #333;
            }

            .options1 {
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }

            .option1 {
                padding: 10px 20px;
                margin: 0 10px;
                border: 2px solid #007bff;
                border-radius: 20px;
                background-color: transparent;
                color: #007bff;
                cursor: pointer;
                transition: background-color 0.3s, color 0.3s;
            }

            .option1:hover {
                background-color: #007bff;
                color: white;
            }

            .hidden {
                display: none;
            }

            .loader {
                border: 4px solid #f3f3f3;
                border-top: 4px solid #3498db;
                border-radius: 50%;
                width: 20px;
                height: 20px;
                display: none;
                margin: 10px auto;
                animation: spin 1s linear infinite;
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
                            <li><a id="allProductButton" >All product</a></li>
                            <li><a id="addProductButton" >Add product</a></li>
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
                            <li><a id="order-complete">Đã hoàn thành</a></li>
                            <li><a id="order-checking">Đang xử lí</a></li>
                            <li><a >Đã hủy</a></li>
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
                            <li><a >Đã hoàn thành</a></li>
                            <li><a >Đang xử lí</a></li>
                            <li><a >Đã hủy</a></li>
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
                                                <th>Time</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-body" id="cell-info">

                                        </tbody>
                                    </table>
                                    
                                    <table class="table" id="orderBuy-complete">
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
                                                <th>Time</th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-body" id="cell-info1">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <table id="Filter" class="text-nowrap mb-0 table" border="1">
                    <tr>
                        <th>Filter by code</th>
                        <th>Filter by Name</th>
                        <th>Filter by Price</th>
                        <th>Filter by Status</th>
                        <th>Filter by Party</th>
                    </tr>
                    <tr>
                        <th><input name="filter_code"></th>
                        <th><input name="filter_name"></th>
                        <th><select name="filter_price">
                                <option value="100000">Dưới 100.000</option>
                                <option value="1000000">Dưới 1.000.000</option>
                                <option value="10000000">Dưới 10.000.000</option>
                                <option value="10000000">Trên 10.000.000</option>
                            </select></th>
                        <th><input name="filter_status"></th>
                        <th><select name="filter_party">
                                <option value="1">Bên bán</option>
                                <option value="0">Bên mua</option>
                            </select></th>
                    </tr>
                </table>
                <table id="ProductDisplay" class="text-nowrap mb-0 table" border="1">

                    <thead class="table-light">
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
                    <tbody>

                        <c:forEach items="${productOrderPairs}" var="p">
                            <tr>
                                <td>${p.getOrder().getCode()}</td>
                                <td>${p.getProduct().getName()}</td>
                                <td>${p.getProduct().getPrice()}</td>
                                <td>${p.getOrder().getTotal_received_amount()}</td>
                                <td>${p.getOrder().getTotal_paid_amount()}</td>
                                <td>${p.getOrder().getIntermediary_fee()}</td>
                                <td>${p.getOrder().getStatus()}</td>
                                <td>${p.getProduct().isTransaction_fee() ? "Bên bán" : "Bên mua"}</td>
                                <td>  <a class="productInfo" data-action="view"  href="#" data-product-id="${p.getOrder().getId()}"> <i style="color: #0061f2" class="fa fa-info-circle"></i></a>  
                                    <a class="updateproduct" data-action="update" href="#" data-product-id="${p.getProduct().getId()}">  <i style="color: #34ce57" class="fa fa-pencil"></i> </a>
                                    <a><i style="color: red" class="fa fa-trash"></i></a>  </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div id="addProductForm" class="addProduct">
                    <h2>Add Product</h2>

                    <form id="addForm">                     
                        <label for="name">Name:</label>
                        <input type="text" name="nameProduct" required><br>

                        <label for="price">Price:</label>
                        <input type="text" name="priceProduct" required><br>

                        <label for="category">Category:</label>

                        <select name="categoryID">
                            <c:forEach items="${category}" var="c">
                                <option value="${c.getId()}">${c.getName()}</option>
                            </c:forEach>
                        </select><br>

                        <label for="description">Description:</label>
                        <input id="description" name="Description" rows="4" required></input><br>

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
                            <div class="overlay" id="overlay"></div>
                            <div style="height: 700px" class="modal" id="modal">
                                <h2>Order Information</h2>
                                <form>
                                    <label for="orderCode">Order code:</label>
                                    <input type="text" id="orderCode" value="" readonly><br>

                                    <label for="productName">Product Name:</label>
                                    <input type="text" id="productName" value="" readonly><br>

                                    <label for="price">Price:</label>
                                    <input type="text" id="price" value="" readonly><br>

                                    <label for="intermediaryFee">Intermediary Fee:</label>
                                    <input type="text" id="intermediaryFee" value="" readonly><br>

                                    <label for="party">Party bears the fee:</label><br>
                                    <input type="radio" id="partySeller" name="party" value="seller" readonly> Seller
                                    <input type="radio" id="partyBuyer" name="party" value="buyer" readonly> Buyer<br>

                                    <label for="receivedAmount">Total received amount:</label>
                                    <input type="text" id="receivedAmount" value="" readonly><br>

                                    <label for="paidAmount">Total paid amount:</label>
                                    <input type="text" id="paidAmount" value="" readonly><br>

                                    <label for="productImage">Product Image:</label><br>
                                    <img style="max-width: 150px; max-height: 150px" id="img1" src="" >
                                    <img style="max-width: 150px; max-height: 150px" id="img2" src="" >
                                    <img style="max-width: 150px; max-height: 150px" id="img3" src="" >
                                    <img style="max-width: 150px; max-height: 150px" id="img4" src="" ><br>

                                    <label for="description">Description:</label>
                                    <input id="description" value="" readonly></input><br>

                                    <label for="hiddenContent">Hidden Content:</label>
                                    <input type="text" id="hiddenContent" value=""  readonly><br>

                                    <label for="contactMethod">Contact Method:</label>
                                    <input type="text" id="contactMethod" value=""  readonly><br>

                                    <label for="status">Status:</label>
                                    <input type="text" id="status" value="" readonly><br>

                                    <label for="buyer">Buyer:</label>
                                    <input type="text" id="buyer" value="" readonly><br>
                                    <label for="buyer">Create At:</label>
                                    <input type="text" id="create_at" value="" readonly><br>
                                    <label for="buyer">Update At:</label>
                                    <input type="text" id="update_at" value="" readonly><br>

                                    <button onclick="hideProductModal()">OK</button>
                                </form>

                            </div>


                            <!--        /////////////////              -->                        
                            <div style="height: 700px" class="modal" id="modal2">
                                <h2>Update Order Information</h2>
                                <form>
                                    <label for="orderCode">Order code:</label>
                                    <input type="text" id="orderCode_ud" value="${productOrderPair.getOrder().getCode()}" readonly ><br>

                                    <label for="productName">Product Name:</label>
                                    <input type="text" id="productName_ud" value="${productOrderPair.getProduct().getName()}" ><br>

                                    <label for="price">Price:</label>
                                    <input type="text" id="price_ud" value="${productOrderPair.getProduct().getPrice()}" ><br>

                                    <label for="intermediaryFee">Intermediary Fee:</label>
                                    <input type="text" id="intermediaryFee_ud" value="${productOrderPair.getOrder().getIntermediary_fee()}" readonly><br>

                                    <label for="party">Party bears the fee:</label><br>
                                    <input type="radio" id="partySeller_ud" name="party" value="seller"> Seller
                                    <input type="radio" id="partyBuyer_ud" name="party" value="buyer"> Buyer<br>

                                    <label for="receivedAmount">Total received amount:</label>
                                    <input type="text" id="receivedAmount_ud" value="${productOrderPair.getOrder().getTotal_received_amount()}"readonly ><br>

                                    <label for="paidAmount">Total paid amount:</label>
                                    <input type="text" id="paidAmount_ud" value="${productOrderPair.getOrder().getTotal_paid_amount()}" readonly><br>

                                    <label for="productImage">Product Image:</label><br>
                                    <label for="image1">Image 1:</label>
                                    <input type="text" id="img1_ud" name="image1" value=""><br>

                                    <label for="image2">Image 2:</label>
                                    <input type="text" id="img2_ud" name="image2" value=""><br>

                                    <label for="image3">Image 3:</label>
                                    <input type="text" id="img3_ud" name="image3" value="" ><br>

                                    <label for="image4">Image 4:</label>
                                    <input type="text" id="img4_ud" name="image4" value=""><br>

                                    <label for="description">Description:</label>
                                    <input id="description_ud" value="" ></input><br>

                                    <label for="hiddenContent">Hidden Content:</label>
                                    <input type="text" id="hiddenContent_ud" value=""  ><br>

                                    <label for="contactMethod">Contact Method:</label>
                                    <input type="text" id="contactMethod_ud" value=""  ><br>

                                    <label for="status">Status:</label>
                                    <input type="text" id="status_ud" value="" ><br>

                                    <label for="buyer">Buyer:</label>
                                    <input type="text" id="buyer_ud" value="" readonly ><br>
                                    <label for="buyer">Create At:</label>
                                    <input type="text" id="create_at_ud" value="" readonly><br>
                                    <label for="buyer">Update At:</label>
                                    <input type="text" id="update_at_ud" value="" readonly><br>

                                    <button onclick="hideProductModal()">Close</button>
                                    <button style="background-color:  #34ce57 " id="updateButton">Update</button>
                                </form>
                            </div>

                            <div id="myModalComplain" class="modal3">
                                <div class="modal-content3">
                                    <span class="close">&times;</span>
                                    <div class="container-complain">
                                        <form id="complaintForm">
                                            <h2 style="text-align: center;">Complain Order</h2>
                                            <input type="text" id="order_id" name="order_id" readonly="" hidden=""><br>
                                            <input type="text" id="pro_id" name="pro_id" readonly="" hidden=""><br>
                                            <label for="order_code">Intermediate Orders Code</label><br>
                                            <input type="text" id="order_code" name="code" value="" readonly><br>
                                            <label for="hidden_info">Hidden Information</label><br>
                                            <input type="text" id="hidden_info" name="" value="" readonly><br>
                                            <label for="description">Description</label><br>
                                            <textarea id="description1" name="description" placeholder="Write something, as detailed as possible..." style="height:200px" required></textarea><br>
                                            <input type="submit" value="Submit">
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div id="myModalVerify" class="modal4">
                                <span class="close">&times;</span></br></br>
                                <h3>Verify Order</h3>
                                <p>Order matches the description</p>
                                <form id="authForm">
                                    <input type="text" id="pro_id" name="pro_id" hidden="">
                                    <div class="options1">
                                        <button type="submit" class="option1 yes">Yes</button>
                                        
                                    </div>
                                    <div class="loader" id="loader"></div>
                                </form>
                            </div>
                            </div>
                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                            <script src="jscript/myorder.js"></script>
                            </body>
                            </html>

