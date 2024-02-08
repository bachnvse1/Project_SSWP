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
                         <tr>
                            <td>${a}</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                         </tr>
                      <c:forEach items="${productOrderPairs}" var="p">
                        <tr>
                            <td>${p.getOrder().getCode()}</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
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
                            <option value="1">Account</option>
                             <option value="2">Keys</option>
                              <option value="3">Document</option>
                               <option value="4">Others</option>
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

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="jscript/myorder.js"></script>
    </body>
</html>