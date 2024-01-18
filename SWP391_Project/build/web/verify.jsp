<%-- 
    Document   : verify
    Created on : Jan 12, 2024, 9:56:40 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Verify OTP</title>
        <link rel="stylesheet" href="css/verify.css">
    </head>
    <body>
        <div class="otp-box">
            <form action="VerifyCode" method="post">
                <div class="img">
                    <img src="https://t.ly/7CuFm" alt="" width="100px">
                </div>
                <div class="content-box">
                    <h2>Verification code</h2>
                    <p>We just send a Verification code to your email</p>
                </div>
                <div class="inputs">
                    <input type="text" maxlength="5" name="otp_code" required="">
                </div>
                <div class="verify-button">
                    <button type="submit">Verify</button>
                </div>
            </form>
        </div>
    </body>
</html>
