<%-- 
    Document   : Deposite
    Created on : Mar 12, 2024, 10:39:30 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>

        <link rel="stylesheet" href="css/https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"/>
        <link rel="stylesheet" href="css/Deposite.css"/>
        
    </head>
    <body>

        <div class="container">
            <div class="row">

                <div class="col-12 mt-4">
                    <div class="card p-3">
                        <h2>Yêu cầu nạp tiền</h2>
                    </div>
                </div>
                <div class="col-12">
                    <div class="card p-3" id="form1" >
                        <div class="card-body border p-0">
                            <p>
                                <a class="btn btn-primary p-2 w-100 h-100 d-flex align-items-center justify-content-between"
                                   data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="true"
                                   aria-controls="collapseExample">
                                    <span class="fw-bold">Nạp tiền</span>
                                    <span class="">
                                        <span class="fab fa-cc-amex"></span>
                                        <span class="fab fa-cc-mastercard"></span>
                                        <span class="fab fa-cc-discover"></span>
                                    </span>
                                </a>
                            </p>
                            <div class="collapse show p-3 pt-0" id="collapseExample">
                                <div class="row">
                                    <div class="col-lg-5 mb-lg-0 mb-3">
                                        <p class="mb-0"><span class="fw-bold">Phương thức</span><span class="c-green">: Cổng thanh toán VNPAY</span>
                                        </p>
                                        <p class="mb-0">Thu thêm 3000đ cho những đơn hàng dưới 100.000đ. Quý khách vui lòng nhập đúng thông tin tránh sai sót không đáng có !</p>
                                        <div  style="background-color: white; margin-top: 10%;">

                                            <a href="home" style="background-color: #008000; color: white; border: 0; padding: 10px; text-decoration: none; ">Quản lí thanh toán</a>
                                        </div>

                                    </div>
                                    <div class="col-lg-7">
                                        <form class="form" id="vnpayForm">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="form__div">
                                                        <input name="amount" id="amountVnpay" type="text" class="form-control" placeholder=" ">
                                                        <label for="" class="form__label">Số tiền:</label>
                                                    </div>
                                                </div>


                                                <div class="col-12">
                                                    <div class="form__div">
                                                        <input name="description" id="desVnpay" type="text" class="form-control" placeholder="">
                                                        <label for="" class="form__label">Mô tả khoản nạp</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="btn btn-primary payment" style="background-color: white;">
                                                        <input type="submit" value="Nạp tiền" style="background-color: rgb(28, 106, 207); color: white; border: 0; padding: 10px;">
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>


                </div>

            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="jscript/vnpay.js"></script>
    </body>
</html>
