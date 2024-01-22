<%-- 
    Document   : EditAccountByAdmin
    Created on : 21 thg 1, 2024, 19:24:37
    Author     : Nguyen Minh Khoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Account</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="modal-title">Chỉnh sửa tài khoản</h4>
                        </div>
                        <div class="card-body">
                            <form id="editAccGgByAdmin" action="EditAccGgByAdmin" method="post">
                               
                                <div class="form-group">
                                    <label for="id">ID</label>
                                    <input value="${userGoogle.idgg}" type="text" class="form-control" id="ids" name="ids" readonly>
                                </div>

                                <div class="form-group">
                                    <label for="id">Name</label>
                                    <input value="${userGoogle.given_name}" type="text" class="form-control" id="username" name="username" readonly>
                                </div>

                                <div class="form-group">
                                    <label for="id">Email</label>
                                    <input value="${userGoogle.email}" type="text" class="form-control" id="email" name="email" readonly>
                                </div>

                                <label for="is_Active">Is_Active</label>
                                <div class="form-check">
                                    <input type="radio" class="form-check-input" id="activeRadio" name="isActiveValue" value="true">
                                    <label class="form-check-label" for="activeRadio">Active</label>
                                </div>
                                <div class="form-check">
                                    <input type="radio" class="form-check-input" id="deactiveRadio" name="isActiveValue" value="false">
                                    <label class="form-check-label" for="deactiveRadio">Deactive</label>
                                </div>
                        </div>
                        <div class="modal-footer">
                            <a class="btn btn-secondary" href="ManageAccount">Cancel</a>
                            <button type="submit" class="btn btn-success"> Save</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    
</body>


</html>




