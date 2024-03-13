<%-- 
    Document   : withdrawal
    Created on : Mar 13, 2024, 7:04:13 AM
    Author     : tudo7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
        
    </head>
    <body>
        <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card-group">
                            <div class="card">
                                <div class="card-header">
                                    <div class="pull-left">
                                        <h3 class="mb-0">Yêu cầu rút tiền</h3>
                                    </div>
                                    <div class="pull-right">
                                        
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div autocomplete="off">
                                        <div class="position-relative row form-group">
                                            <div class="form-label-horizontal col-md-3">
                                                <label class=""><b>Số tiền rút (*)</b></label>
                                            </div>
                                            <div class="col-md-9">
                                                <input placeholder="Input number" type="text" class="form-control" value="100,000" inputmode="numeric">
                                                <div class=""></div>
                                            </div>
                                        </div>
                                        <div class="position-relative row form-group">
                                            <div class="form-label-horizontal col-md-3">
                                                <label class=""><b>Số tài khoản (*)</b></label>
                                            </div><div class="col-md-9">
                                                <input placeholder="" type="text" class="form-control" value="">
                                            </div>
                                        </div>
                                        <div class="position-relative row form-group">
                                            <div class="form-label-horizontal col-md-3">
                                                <label class=""><b>Chủ tài khoản (*)</b></label>
                                            </div>
                                            <div class="col-md-9">
                                                <input placeholder="" type="text" class="form-control" value="">
                                            </div>
                                        </div>
                                        <div class="position-relative row form-group">
                                            <div class="form-label-horizontal col-md-3">
                                                <label class=""><b>Tên ngân hàng (*)</b></label>
                                            </div>
                                            <div class="col-md-9">
                                                <input placeholder="VD: Tiên Phong Bank (TPB) , Vietcombank (VCB)" type="text" class="form-control" value="">
                                            </div>
                                        </div>
                                        <div class="position-relative row form-group">
                                            <div class="form-label-horizontal col-md-3">
                                                <label class=""><b>Chi nhánh </b></label>
                                            </div>
                                            <div class="col-md-9">
                                                <input placeholder="VD: Chi nhánh Phạm Hùng" type="text" class="form-control" value="Không rõ">
                                            </div></div><div style="display: flex; justify-content: center; align-items: center;">
                                            <button type="button" class="mr-1 btn-white-space btn btn-success"><i class="fa fa-plus"></i> Gửi yêu cầu</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" style="left: 2%">Back to home</button>
                <button type="button" class="btn btn-secondary">Close</button>
            </div>
        </div>
        </div>
    </body>
</html>
