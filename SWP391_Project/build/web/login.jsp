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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <br>
        <br>
        <script>

        </script>
        <div class="cont" style="height: 650px;">
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

                        <div class="input-group-prepend">
                            <div style="display: flex;">
                                <img id="captchaImage" src="captchaimage" alt="CAPTCHA image" style="margin-left: 5em;" />
                                <button type="button" onclick="refreshCaptcha()" class="btn btn-light" style="width: 50px; background-color: white;">
                                    <i class="fa fa-refresh" style="color: black;"></i>
                                </button>
                            </div>

                            <input type="text" placeholder="" name="capchaRespone" />
                        </div>
                    </label>

                    <a href="forgot"><p class="forgot-pass">Forgot password?</p></a>
                    <button type="submit" class="submit">Sign In</button>
                </form>

                <button type="button" class="submit" style="background-color: #ac2925;" >
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=profile+email&redirect_uri=http://localhost:9999/SWP391_Project/loginGoogleHandler&response_type=code&client_id=351960657846-lejfsvfrmte5906hvkrj70out2u775s0.apps.googleusercontent.com&approval_prompt=force" style="color: white; text-decoration: none;">
                        <i class="fab fa-google"></i>
                    </a>
                </button>
                <button type="button" class="submit" style="background-color: gray">
                    <a href="home.jsp" style="text-decoration: none; color: white"><i class="fa fa-home"></i></a>
                </button>
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
                                                    <label>
                                                        <span id="mess-error" style="color: red;"></span>
                                                    </label>
                                                </form>
                                            </div>
                                            </div>
                                            </div>
                                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                                            <script>

                                    $(document).ready(function () {
                                        $('#loginForm').submit(function (e) {
                                            e.preventDefault(); // 

                                            var formData = {
                                                user: $('#username').val(),
                                                pass: $('#password').val(),
                                                email: $('#email').val()
                                            };

                                            $.ajax({
                                                type: 'POST',
                                                url: 'VerifyUser',
                                                data: formData,

                                                success: function (response) {
                                                    if (response === "success") {
                                                        window.location.href = "verify.jsp";
                                                    } else {
                                                        $("#mess-error").html(response);
                                                    }
                                                },
                                                error: function (error) {
                                                    console.log(error);
                                                }
                                            });
                                        });
                                    });

                                    function refreshCaptcha() {

                                        $.get('refreshcaptcha', function () {

                                            $('#captchaImage').attr('src', 'captchaimage?' + new Date().getTime());
                                        });
                                    }
                                            </script>
                                            <script>
                                                document.querySelector('.img__btn').addEventListener('click', function () {
                                                    document.querySelector('.cont').classList.toggle('s--signup');
                                                });
                                            </script>

                                            <script src="jscript/login_logout.js"></script>
                                            </body>
                                            </html>
