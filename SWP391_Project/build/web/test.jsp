<%-- 
    Document   : test
    Created on : 21 thg 2, 2024, 14:42:54
    Author     : Nguyen Minh Khoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .modal3 {
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.6); /* Màu nền mờ */
                display: block; /* Ẩn modal ban đầu */
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
            .container-complain {
                display: flex;
                flex-direction: column;
            }

            .form-row {
                display: flex;
                align-items: baseline; /* Đảm bảo các input thẳng hàng theo baseline của label */
                margin-bottom: 10px; /* Khoảng cách giữa các cặp label và input */
            }

            .form-row label {
                width: 30%; /* Độ rộng của label */
                margin-right: 10px; /* Khoảng cách giữa label và input */
            }

            .form-row input {
                flex: 1; /* Input mở rộng để lấp đầy phần còn lại của container */
            }
             .modal-content3 label,
            .modal-content3 input,            
            .modal-content3 textarea {
                margin-bottom: 10px; /* Khoảng cách giữa các phần tử */
            }

            .modal-content3 input,
            .modal-content3 textarea {

                width: calc(50% - 40px); /* Độ rộng của input và textarea */
                padding: 10px; /* Khoảng cách giữa nội dung và viền */
                border-radius: 5px; /* Bo tròn các góc */
                border: 1px solid #ccc; /* Viền */
            }

            .modal-content3 textarea {
                height: 150px; /* Độ cao của textarea */
            }
        </style>
    </head>
    <body>



        <div style="height: 700px" class="modal" id="modal">

            <div id="myModalComplain" class="modal3">
                <h2>Order Information</h2>
                <div class="modal-content3">
                    <span class="close">&times;</span>
                    <div class="container-complain">
                        <form id="detailOrderForm">
                            <h2 style="text-align: center;">Detail Order Report</h2>
                            <div class="form-row">
                                <label for="orderCode">Order code:</label>
                                <input type="text" id="orderCode" value="" readonly><br>
                            </div>

                            <div class="form-row">
                                <label for="productName">Product Name:</label>
                                <input type="text" id="productName" value="2000" readonly><br>
                            </div>
                            <div class="form-row">
                                <label for="price">Price:</label>
                                <input type="text" id="price" value="" readonly><br>
                            </div>

                            <label for="productImage">Product Image:</label>
                            <img style="max-width: 150px; max-height: 150px" id="img1" src="" >
                            <img style="max-width: 150px; max-height: 150px" id="img2" src="" >
                            <img style="max-width: 150px; max-height: 150px" id="img3" src="" >
                            <img style="max-width: 150px; max-height: 150px" id="img4" src="" ><br>
                            <div class="form-row">
                                <label for="description">Description:</label>
                                <input id="description" value="" readonly></input><br>
                            </div>
                            <div class="form-row">
                                <label for="hiddenContent">Hidden Content:</label>
                                <input type="text" id="hiddenContent" value=""  readonly><br>
                            </div>
                            <div class="form-row">
                                <label for="party">Buyer:</label>                          
                                <input type="text" id="partyBuyer" name="party" value="" readonly><br>
                            </div>
                            <div class="form-row">
                                <label for="party">Seller:</label>                          
                                <input type="text" id="partySeller" name="party" value="" readonly><br>
                            </div>
                            <div class="form-row">
                                <label for="contactMethod">Contact Method:</label><br>
                                <input type="text" id="contactMethod" value=""  readonly><br>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>