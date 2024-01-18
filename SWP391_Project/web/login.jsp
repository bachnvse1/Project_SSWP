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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <br>
        <br>
        <script>
            
        </script>
        <div class="cont" style="height: 600px">
            <div class="form sign-in">
                <h2>Welcome</h2>
                <form action="login" method="post">
                    <div style="color: red;size: 10px;text-align: center">${mess}</div>
                    <label>
                        <span>User</span>
                        <input type="text" name="user" value="${username}"/>
                    </label>
                    <label>
                        <span>Password</span>
                        <input type="password" name="password" value="${pass}" />
                    </label>
                    <label>
                        
                        <div class="input-group-prepend" style="display: flex">
                            <img id="captchaImage" src="captchaimage" alt="CAPTCHA image" />
                            <input type="text" placeholder="Captcha" name="capchaRespone" />
                            <button type="button" onclick="refreshCaptcha()" class="btn btn-light" style="width: 15%"><i class="fa fa-refresh" style="color: black;"></i></button>
                           </div>
                    </label>
                    
                    <p class="forgot-pass">Forgot password?</p>

                    <button type="submit" class="submit">Sign In</button>
                </form>
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
                                                </form>
                                            </div>
                                            </div>
                                            </div>
                                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
           <script>
                               
         $(document).ready(function () {
                                                    $("#homeButton").click(function () {
                                                        $.ajax({
                                                            type: 'GET',
                                                            url: "home.jsp",
                                                            success: function (response) {
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
                                                                if (response === "success") {
                                                                    window.location.href = "verify.jsp";
                                                                } else {
                                                                    alert("          Check format infomation!!!\n          Ex:\n          User: not contain special characters\n          Password: must contain special characters and digit\n          Email: abc@xyz.com");
                                                                   
                                                                }
                                                            },
                                                            error: function (error) {
                                                                console.log(error);
                                                            }
                                                        });
                                                    });
                                                });
                                                
                                                function refreshCaptcha() {
                // Sử dụng AJAX để làm mới ảnh CAPTCHA
                $.get('refreshcaptcha', function () {
                    // Thay đổi src của ảnh để làm mới
                    $('#captchaImage').attr('src', 'captchaimage?' + new Date().getTime());
                });
            }
                                            </script>
<script>
        document.querySelector('.img__btn').addEventListener('click', function () {
        document.querySelector('.cont').classList.toggle('s--signup');
});
   </script>
         </body>
        </html>
