<%-- 
    Document   : Complain
    Created on : Feb 15, 2024, 10:40:27 PM
    Author     : ADMIN
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

        <style>
            input[type=text], select, textarea {
                width: 100%; /* Full width */
                padding: 12px; /* Some padding */
                border: 1px solid #ccc; /* Gray border */
                border-radius: 4px; /* Rounded borders */
                box-sizing: border-box; /* Make sure that padding and width stays in place */
                margin-top: 6px; /* Add a top margin */
                margin-bottom: 16px; /* Bottom margin */
                resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
            }

            /* Style the submit button with a specific background color etc */
            input[type=submit] {
                background-color: #04AA6D;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            /* When moving the mouse over the submit button, add a darker green color */
            input[type=submit]:hover {
                background-color: #45a049;
            }

            /* Add a background color and some padding around the form */
            .container-complain {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
                min-height: 440px; /* hoặc bất kỳ giá trị nào phù hợp với nội dung của bạn */
            }

        </style>
    </head>
    <body>
        <%@include file="components/navBar.jsp" %>
        <div class="container-complain">
            <form action="report" method="post">
                <label for="fname">ID</label>
                <input type="text" name="id" value="${id}" readonly="">
                <label for="fname">Intermediate Orders Code</label>
                <input type="text" name="code" value="${code}" readonly="">
                <label for="subject">Description</label>
                <textarea name="desciption" placeholder="Write something, as detailed as possible..." style="height:200px" required=""></textarea>
                <input type="submit" value="Submit">
            </form>
        </div>
        <%@include file="components/footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="jscript/login_logout.js">
        </script>
    </body>
</html>
