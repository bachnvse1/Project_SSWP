<%-- 
    Document   : EditAccount
    Created on : Jan 16, 2024, 4:54:38 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/editAccount.css"/>
    </head>
    <body>
        <div class="container">
        <form id="contactus" action="" method="post">
        <h3>Edit Information</h3>
        <fieldset> <input placeholder="username" type="text" tabindex="1" required autofocus readonly=""> </fieldset>
        <fieldset> <input placeholder="password" type="text" tabindex="1" required autofocus> </fieldset>
        <fieldset> <input placeholder="Email Address" type="email" tabindex="2" required> </fieldset>
        <fieldset> <input placeholder="Phone Number" type="tel" tabindex="3" required> </fieldset>
        <fieldset> <button name="submit" type="submit" id="contactus-submit" data-submit="...Sending"><i id="icon" class=""></i> Edit Now</button> </fieldset>
    </form>
</div>
    </body>
</html>
