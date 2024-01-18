<%-- 
    Document   : login
    Created on : Jan 12, 2024, 7:58:18 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/Login.css"/>

    </head>
    <body>
    <br>
    <br>
    <div class="cont">
        <div class="form sign-in">
            <h2>Welcome</h2>
            <form action="login">
            <label>
                <span>User</span>
                <input type="text" name="user"/>
            </label>
            <label>
                <span>Password</span>
                <input type="password" name="password" />
            </label>
               

            <button type="button" class="submit">Sign In</button>
            </form>
             <button><a href="forgot"><p class="forgot-pass">Forgot password?</p></a></button>
            <button type="button" class="submit" style="background-color: gray" id="homeButton">Home Page</button>
            <button type="button" class="submit" style="background-color: gray" > <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:9999/SWP391_Project/loginGoogleHandler&response_type=code&client_id=351960657846-lejfsvfrmte5906hvkrj70out2u775s0.apps.googleusercontent.com&approval_prompt=force" style="color: white; text-decoration: none;">Login with google</a></button>
        </div>
        <div class="sub-cont">
            <div class="img">
                <div class="img__text m--up">
                 
                    <h3>Don't have an account? Please Sign up!<h3>
                </div>
                <div class="img__text m--in">
                
                    <h3>If you already has an account, just sign in.<h3>
                </div>
                <div class="img__btn">
                    <span class="m--up">Sign Up</span>
                    <span class="m--in">Sign In</span>
                </div>
            </div>
            <div class="form sign-up">
                <form id="loginForm">
                    <h2>Create your Account</h2>
                <label>
                    <span>User</span>
                    <input type="text" id="username" name="user" required=""/>
                </label>
                <label>
                    <span>Password</span>
                    <input type="password" id="password" name="pass" required=""/>
                </label>
                <label>
                    <span>Email</span>
                    <input type="text" id="email" name="email" required=""/>
                </label>
                    <button type="submit" class="submit">Sign Up</button>
                    <div id="error-message">
                    </div>
                </form>
        </div>
    </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#homeButton").click(function(){
                $.ajax({
                    type: 'GET',
                    url:"home.jsp",
                    success: function(response){
                            $("body").html(response);
                    },
                    error: function () {
                    // Xử lý lỗi nếu có
                        alert("Đã xảy ra lỗi khi tải trang");
                    }    
                });
            });
        }); 
        
        $(document).ready(function () {
            $('#loginForm').submit(function (e) {
                e.preventDefault(); // Prevents the default form submission

                var formData = {
                    user: $('#username').val(),
                    pass: $('#password').val(),
                    email: $('#email').val()
                };

                $.ajax({
                    type: 'POST',
                    url: 'VerifyUser', // Replace 'MyServlet' with the actual URL of your servlet
                    data: formData,
                    
                    success: function (response) {
                        if(response == "success") {
                            window.location.href = "verify.jsp";
                        } else {
                            $("#error-message").html("<label><span>Invalid infomation </span></label>");
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            });
        });
    </script>
    
    
    <script>
        document.querySelector('.img__btn').addEventListener('click', function() {
            document.querySelector('.cont').classList.toggle('s--signup');
        });
    </script>
    </body>
</html>
