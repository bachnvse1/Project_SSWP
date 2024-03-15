<%-- 
    Document   : withdrawal
    Created on : Mar 13, 2024, 7:04:13 AM
    Author     : tudo7
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    </head>
    <body>
 <%@include file="components/navBar.jsp" %>
<!--        <table id="withdrawalTable" class="display">
            <thead>
                <tr>
                    <td>Mã yêu cầu</td>
                    <td>Trạng thái xử lí</td>
                    <td>Số tiền rút</td>
                    <td>Số tài khoản</td>
                    <td>Chủ tài khoản</td>
                    <td>Tên ngân hàng</td>
                    <td>Chi nhánh ngân hàng</td>
                    <td>Phản hồi</td>
                    <td>Thời gian tạo</td>
                    <td>Cập nhật</td>
                    <td>Hành động</td>               
                </tr>
            </thead>
            <tbody>           
                <tr>
                    <td>Mã yêu cầu</td>
                    <td>Trạng thái xử lí</td>
                    <td>Số tiền rút</td>
                    <td>Số tài khoản</td>
                    <td>Chủ tài khoản</td>
                    <td>Tên ngân hàng</td>
                    <td>Chi nhánh ngân hàng</td>
                    <td>Phản hồi</td>
                    <td>Thời gian tạo</td>
                    <td>Cập nhật</td>
                    <td>Hành động</td>               
                </tr>

            </tbody>
        </table>-->
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card-group">
                                <div class="card">
                                    <div class="card-header">
                                        <h3>Yêu cầu rút tiền</h3>
                                    </div>
                                    <div class="card-body">
                                        <div autocomplete="off">
                                            <form id="withdrawalForm">
                                                <div class="position-relative row form-group">
                                                    <div class="form-label-horizontal col-md-3">
                                                        <label class=""><b>Số tiền rút (*)</b></label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <input placeholder="Nhập vào số tiền cần rút" name="amount" id="amountInput" type="text" class="form-control" value="" inputmode="numeric">
                                                        <div id="textOutput" class="text"></div>
                                                    </div>
                                                </div>
                                                <div class="position-relative row form-group">
                                                    <div class="form-label-horizontal col-md-3">
                                                        <label class=""><b>Số tài khoản (*)</b></label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <input id="accountNumberInput" name="accountNumber" placeholder="" type="text" class="form-control" value="">
                                                    </div>
                                                </div>
                                                <div class="position-relative row form-group">
                                                    <div class="form-label-horizontal col-md-3">
                                                        <label class=""><b>Chủ tài khoản (*)</b></label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <input id="accountHolderInput" name="accountHolder" placeholder="" type="text" class="form-control" value="">
                                                    </div>
                                                </div>
                                                <div class="position-relative row form-group">
                                                    <div class="form-label-horizontal col-md-3">
                                                        <label class=""><b>Tên ngân hàng (*)</b></label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <input id="bankNameInput" name="bankName" placeholder="VD: Tiên Phong Bank (TPB) , Vietcombank (VCB)" type="text" class="form-control" value="">
                                                    </div>
                                                </div>
                                                <div class="position-relative row form-group">
                                                    <div class="form-label-horizontal col-md-3">
                                                        <label class=""><b>Chi nhánh </b></label>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <input id="bankBranchInput" name="bankBranch" placeholder="VD: Chi nhánh Phạm Hùng (Có thể bỏ trống)" type="text" class="form-control" value="">
                                                    </div>
                                                </div>
                                                <div style="display: flex; justify-content: center; align-items: center;">
                                                    <button id="withdrawal_Button" type="submit" class="mr-1 btn-white-space btn btn-success">
                                                        <i class="fa fa-plus"></i> Gửi yêu cầu
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" style="left: 2%"><a href="home"> Back to home</a></button>
                    <button type="button" class="btn btn-secondary">Close</button>
                </div>
            </div>
        </div>
    </body>

    <script>
       $(document).ready(function () {
    $('#withdrawalForm').submit(function (e) {
        e.preventDefault(); 
        var confirmation = confirm("Xác nhận đúng thông tin TK Ngân hàng? Nếu thông tin bị sai thì bạn sẽ mất 10% khoản tiền yêu cầu rút");
        
        // Nếu người dùng xác nhận
        if (confirmation) {
            var formData = $(this).serialize(); 
            $.ajax({
                url: 'withdrawal', 
                type: 'POST', 
                data: formData, 
                success: function (response) {
                    // Xử lý phản hồi từ máy chủ nếu cần
                    if (response === "success") {
                        alert("Thành công!");
                        window.location.href = 'withdrawal';
                    }else if(response === "less than 100000"){
                        alert("Số tiền rút không được nhỏ hơn 100,000 VND!");
                    }else if(response ==="blank"){
                        alert("Không được để trống (Số tài khoản,Chủ tài khoản,Tên ngân hàng)!");
                    }else if(response ==="Insufficient balance"){
                        alert("Số dư không đủ!");
                    }else{
                        alert("Vui lòng kiểm tra lại số tiền!");
                    }
                },
                error: function (xhr, status, error) {
            
                    console.error(xhr.responseText);
                }
            });
        }
    });
});
    </script>
</html>
