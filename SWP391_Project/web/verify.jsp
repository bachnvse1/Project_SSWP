<%-- 
    Document   : verify
    Created on : Jan 12, 2024, 9:56:40 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/verify.css"/>
    </head>
    <body>
    <div class="container">
    <div class="row justify-content-md-center">
      <div class="col-md-4 text-center">
        <div class="row">
          <div class="col-sm-12 mt-5 bgWhite">
            <div class="title">
              Verify OTP
            </div>
            
            <form action="" class="mt-5">
              <input class="otp" type="text" oninput='digitValidate(this)' onkeyup='tabChange(1)' maxlength=1 >
              <input class="otp" type="text" oninput='digitValidate(this)' onkeyup='tabChange(2)' maxlength=1 >
              <input class="otp" type="text" oninput='digitValidate(this)' onkeyup='tabChange(3)' maxlength=1 >
              <input class="otp" type="text" oninput='digitValidate(this)'onkeyup='tabChange(4)' maxlength=1 >
            </form>
            <hr class="mt-4">
            <button class='btn btn-primary btn-block mt-4 mb-4 customBtn'>Verify</button>
          </div>
        </div>
      </div>
  </div>
</div>
    </body>
</html>
