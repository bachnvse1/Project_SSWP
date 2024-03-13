

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>A
    <head>
        <meta charset="ISO-8859-1">
        <title>Quản Lý report</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ------>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/styles.css" rel="stylesheet" type="text/css"/> 

        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
        <!-- Material Design Bootstrap -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
        <!-- Material Design Bootstrap Ecommerce -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
        <!-- Your custom styles (optional) -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ------>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/styles.css" rel="stylesheet" type="text/css"/> 
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>

        <!--           <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"> -->
        <!--         <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"> -->
        <!--       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
        <!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">  -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            body {
                margin: 0;
                padding: 0;
            }
        </style>
        <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"><link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb5/3.8.1/compiled.min.css"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb-plugins-gathered.min.css"><style>
            body {
                background-color: #fbfbfb;
            }
            @media (min-width: 991.98px) {
                main {
                    padding-left: 240px;
                }
            }

            /* Sidebar */
            .sidebar {
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                padding: 58px 0 0; /* Height of navbar */
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
                width: 240px;
                z-index: 600;
            }

            @media (max-width: 991.98px) {
                .sidebar {
                    width: 100%;
                }
            }
            .sidebar .active {
                border-radius: 5px;
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
            }



            .sidebar-sticky {
                position: relative;
                top: 0;
                height: calc(100vh - 48px);
                padding-top: 0.5rem;
                overflow-x: hidden;
                overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
            }

            /* Modal Content */
            .modal-content3 {
                background-color: #fefefe;
                margin: 5% auto; /* Độ cao từ trên xuống modal */
                padding: 20px;
                border: 1px solid #888;
                width: 90%; /* Độ rộng của modal */
                border-radius: 10px; /* Bo tròn các góc */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Hiệu ứng đổ bóng */
                display: flex; /* Sử dụng flexbox để sắp xếp các cột hàng dọc */
                flex-direction: column; /* Sắp xếp các phần tử thành cột hàng dọc */
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

        <!--Main Navigation-->
        <header>
            <jsp:include page="LeftAdmin.jsp"></jsp:include>
            </header>
            <!--Main Navigation-->

            <!--Main layout-->
            <!-- Modal -->




            <!-- QUẢN LÝ  -->
            <main>



                <div class="container pt-4">

                    <!--Section: Quan Ly -->
                    <section class="mb-4">
                        <div class="card">
                            <div class="card-header py-3 row">
                                <div class="col-sm-3">
                                    <h5 class="mb-0 text-left" id="">
                                        <strong>QUẢN LÝ BÁO CÁO</strong>
                                    </h5>
                                </div>

                            </div>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover text-nowrap">
                                        <thead>
                                            <tr>
                                                <th scope="col">Order_ID</th>
                                                <th scope="col">Type_Report</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Description</th>
                                                <th scope="col">Created_by</th>                                                
                                                <th scope="col">Created_at</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listR}" var="r" varStatus="loop">
                                            <c:if test="${r.type_report == 1}">
                                                <tr>

                                                    <td>${r.orderID}</td>
                                                    <td>${r.type_report}</td>
                                                    <td>${r.status}</td>
                                                    <td>${r.description}</td>
                                                    <td>${r.create_by}</td>
                                                    <td>${r.create_At}</td>

                                                    <td>
                                                        <c:if test="${r.type_report == 1}">
                                                            <c:choose>
                                                                <c:when test="${r.status == true}">
                                                                    <a class="btn btn-success edit-btn" data-toggle="modal" data-target="#confirmationModal_${loop.index}">
                                                                        Done
                                                                    </a>
                                                                </c:when>
                                                                <c:when test="${r.status != true}">
                                                                    <a class= "btn btn-danger edit-btn" data-toggle="modal" data-target="#confirmationModal_${loop.index}">
                                                                        Pending
                                                                    </a>
                                                                </c:when>
                                                            </c:choose>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <span class="info-icon" data-toggle="modal" data-target="#detailModal_${loop.index}">&#8505;</span>
                                                    </td>
                                                </tr>
                                            <div class="modal fade" id="confirmationModal_${loop.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Manage Report</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Have you processed this report yet?</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <div class="modal-footer">
                                                                <a href="#" class="btn btn-secondary" onclick="updateReportStatus(${r.id}, false);" data-dismiss="modal">No</a>
                                                                <a href="#" class="btn btn-primary" onclick="updateReportStatus(${r.id}, true);" data-dismiss="modal">Yes</a>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Modal for displaying details -->
                                            <div class="modal fade" id="detailModal_${loop.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Detail Information</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-content3">
                                                            
                                                            
                                                            <!-- Add your input fields for Name, Price, Image, Content here -->
                                                            <div class="form-row">
                                                                <label for="orderCode">Order code:</label>
                                                                <input type="text" id="orderCode" value="${r.orderID}" readonly><br>
                                                            </div>

                                                            <div class="form-row">
                                                                <label for="productName">Product Name:</label>
                                                                <input type="text" id="productName" value="" readonly><br>
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
                                                                <input id="description" value="${r.description}" readonly></input><br>
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

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End of Modal -->
                                        </c:if>


                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </section>
                <!--Section: Quan Ly -->
            </div>


        </main>





        <script src="js/manager.js" type="text/javascript"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!--Main layout-->
        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
        <!-- MDB Ecommerce JavaScript -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript" src="js/script.js"></script>
        <script src="https://mdbootstrap.com/api/snippets/static/download/MDB5-Free_3.8.1/js/mdb.min.js"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>


        <script type="text/javascript" src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/js/plugins/mdb-plugins-gathered.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript" src="js/script.js"></script>  
        <script>
                                                                    function updateReportStatus(id, status) {
                                                                        // Gọi servlet với các tham số id và status
                                                                        window.location.href = 'EditReportStatus?id=' + id + '&status=' + status;
                                                                    }
        </script>
    </body>
</html>
