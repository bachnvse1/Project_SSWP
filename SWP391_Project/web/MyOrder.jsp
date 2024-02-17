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
                            <li><a id="allProductButton" href="#">All product</a></li>
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
                                <td>  <a class="productInfo" data-action="view"  href="#" data-product-id="${p.getProduct().getId()}"> <i style="color: #0061f2" class="fa fa-info-circle"></i></a>  
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
                        <label for="hiddenContent">Hidden Content:</lahidden_contentbel>
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
                            </div>

                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                            <script src="jscript/myorder.js"></script>
                            </body>
                            </html>