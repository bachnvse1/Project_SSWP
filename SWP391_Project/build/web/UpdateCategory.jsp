<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Category</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #17a2b8;
                height: 100vh;
            }
            #login .container #login-row #login-column #login-box {
                margin-top: 120px;
                max-width: 600px;
                height: 320px;
                border: 1px solid #9C9C9C;
                background-color: #EAEAEA;
            }
            #login .container #login-row #login-column #login-box #login-form {
                padding: 20px;
            }
            #login .container #login-row #login-column #login-box #login-form #register-link {
                margin-top: -85px;
            }
        </style>

    </head>
    <body>

     

                       
                                  <div id="login">
        <h3 class="text-center text-white pt-5">Update Category</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                          <c:set var="c" value="${updatecate}"/>
                        <form id="login-form" class="form" action="updatecategory" method="post">
                            <h3 class="text-center text-info">Update</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">ID:</label><br>
                                <input type="text" name="id1" id="id1" value="${c.id}" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Name</label><br>
                                <input type="text" name="name" id="name" value="${c.name}" class="form-control">
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

                    
    </body>
</html>
