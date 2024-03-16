<%-- 
    Document   : withdrawalProcessing
    Created on : Mar 15, 2024, 9:22:06 PM
    Author     : tudo7
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Withdrawal Processing</title>
        <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/styles.css" rel="stylesheet" type="text/css"/> 
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">


    </head>
    <body>                                     
        <table id="drawalProcessing" class="display" style="width:100%">
            <thead>
                <tr>
                    <th>Mã yêu cầu</th>
                    <th>Người yêu cầu</th>
                    <th>Trạng thái xử lí</th>
                    <th>Số tiền rút</th>
                    <th>Số tài khoản</th>
                    <th>Chủ tài khoản</th>
                    <th>Tên ngân hàng</th>
                    <th>Chi nhánh ngân hàng</th>
                    <th>Phản hồi</th>
                    <th>Thời gian tạo</th>
                    <th>Cập nhật</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listWithdrawal}" var="lw">
                    <tr>
                        <th scope="row">${lw.getCode()}</th>
                        <th>${lw.getCreated_by()}</th>
                        <th>
                            <c:choose>
                                <c:when test="${lw.getStatus() eq 'Hoàn thành'}">
                                    <a href="#" class="btn btn-success">${lw.getStatus()}</a>
                                </c:when>
                                <c:when test="${lw.getStatus() eq 'Mới tạo'}">
                                    <a href="#" class="btn btn-info">${lw.getStatus()}</a>
                                </c:when>
                                <c:when test="${w.getStatus() eq 'Bị từ chối'}">
                                    <a href="#" class="btn btn-danger">${lw.getStatus()}</a>
                                </c:when>                                                                                                                          
                                <c:when test="${w.getStatus() eq 'Bị lỗi'}">
                                    <a href="#" class="btn btn-warning">${lw.getStatus()}</a>
                                </c:when>
                                <c:when test="${w.getStatus() eq 'Chờ chuyển khoản'}">
                                    <a href="#" class="btn btn-color">${lw.getStatus()}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="#" class="btn btn-secondary">${lw.getStatus()}</a>
                                </c:otherwise>
                            </c:choose>
                        </th>
                        <th><c:out value="${String.format('%,.0f', lw.getAmount())}" /></th>
                        <th>${lw.getAccount_number()}</th>
                        <th>${lw.getAccount_holder()}</th>
                        <th>${lw.getBankname()}</th>
                        <th>${lw.getBankbranch()}</th>
                        <th>${lw.getResponse()}</th>
                        <th>${lw.getCreated_at()}</th>
                        <th>${lw.getUpdated_at()}</th>
                        <th><button id="updateWithdrawalButton" type="button" class="btn btn-success" data-lw-id="${lw.getId()}>
                                <i class="fas fa-pencil-alt"> Update
                            </button></th>
                    </tr>
                </c:forEach>
            </tbody>

        </table>
        <div class="modal fade" id="updateForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Update Form</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="updateWithdrawalForm">
                            <div class="form-group">
                                <label for="code">Mã yêu cầu</label>
                                <input type="text" class="form-control" id="code" name="code">
                            </div>
                            <div class="form-group">
                                <label for="amount">Số tiền rút</label>
                                <input type="text" class="form-control" id="amount" name="amount">
                            </div>
                            <div class="form-group">
                                <label for="accountNumber">Số tài khoản</label>
                                <input type="text" class="form-control" id="accountNumber" name="accountNumber">
                            </div>
                            <div class="form-group">
                                <label for="accountHolder">Chủ tài khoản</label>
                                <input type="text" class="form-control" id="accountHolder" name="accountHolder">
                            </div>
                            <div class="form-group">
                                <label for="bankName">Tên ngân hàng</label>
                                <input type="text" class="form-control" id="bankName" name="bankName">
                            </div>
                            <div class="form-group">
                                <label for="status">Trạng thái</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="status" id="status1" value="Hoàn thành">
                                    <label class="form-check-label" for="status1">Hoàn thành</label>
                                </div>                                
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="status" id="status3" value="Bị từ chối">
                                    <label class="form-check-label" for="status2">Từ chối</label>
                                </div>
                                 <div class="form-check">
                                     <input class="form-check-input" type="radio" name="status" id="status3" value="Chờ chuyển khoản" checked>
                                    <label class="form-check-label" for="status3">Chờ chuyển khoản</label>
                                </div>
                                 <div class="form-check">
                                    <input class="form-check-input" type="radio" name="status" id="status3" value="Bị lỗi">
                                    <label class="form-check-label" for="status3">Bị Lỗl</label>
                                </div>
                               
                            </div>
                            <div class="form-group">
                                <label for="response">Phản hồi</label>
                                <input type="text" class="form-control" id="response" name="response">
                            </div>
                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                // Initialize DataTable
                $('#drawalProcessing').DataTable();

                // Show modal when "Update" button is clicked
                $('#drawalProcessing').on('click', '#updateWithdrawalButton', function () {
                     var withdrawalid = $(this).data('lw-id');
                  
                     $.ajax({
            type: 'GET',
            url: 'withdrawalprocessing',
            data: {wid: withdrawalid},
            success: function (response) {
                    $('#updateForm').modal('show');
                    
                // Code xử lý dữ liệu phản hồi cho modal2
                var responseData = response.split(";");
              
            }
        });
                });
            });
        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
