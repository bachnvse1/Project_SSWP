<%-- 
    Document   : password
    Created on : Jan 17, 2024, 10:09:12 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
       <title>Edit Profile</title>
  <style>
           .forpass {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        label {
            display: block;
            margin-bottom: 5px;
        }

        
                   input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #808080;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #808080;
        }

        .error-message {
            color: red;
            margin-top: -10px;
            margin-bottom: 10px;
        }

        .info-message {
            color: blue;
            margin-top: -10px;
            margin-bottom: 10px;
        }
    
        </style>
    </head>
    <body>
          <!-- Navigation-->
        <%@include file="components/navBar.jsp" %>
        <form action="ChangePassword" method="post" class="forpass">

            <label for="username">Username: </label>
            <input type="text" name="username" value="${sessionScope.displayname}"><br>
            <label for="oldPassword">Old Password:</label>
            <input type="password" name="oldPassword" required><br>

            <label for="newPassword">New Password:</label>
            <input type="password" name="newPassword" required><br>

            <label for="confirmPassword">Confirm New Password:</label>
            <input type="password" name="confirmPassword" required><br>
            <label style="color: red">${requestScope.fail}</label><br/>
             <label style="color: green">${requestScope.done}</label><br/>
            <input type="submit" value="Change Password">
        </form>
             <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    </body>
</html>
