<%-- 
    Document   : withdrawalProcessing
    Created on : Mar 15, 2024, 9:22:06 PM
    Author     : tudo7
--%>

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
        <style>
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
        </style>
    
           
       <header>
          <jsp:include page="LeftAdmin.jsp"></jsp:include>
        </header>
        
       
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
       
    </tbody>
    </table>
           
        <script>
    $(document).ready(function() {
        $('#drawalProcessing').DataTable();
    });
</script>
    </body>
</html>
