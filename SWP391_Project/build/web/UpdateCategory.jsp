<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Category</title>
        <style>
            .btn-color{
                background-color: #0e1c36;
                color: #fff;

            }

            .profile-image-pic{
                height: 300px;
                width: 300px;
                object-fit: cover;
            }



            .cardbody-color{
                background-color: #ebf2fa;
            }

            a{
                text-decoration: none;
            }
            body {
                background: white;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
            }

            form {
                text-align: center;
            }
        </style>

    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <h2 class="text-center text-dark mt-5">Update Category</h2>
                    <div class="card my-5">

                        <c:set var="c" value="${updatecate}"/>
                        <form action="updatecategory" method="post">

                            <div class="text-center" >
                                <img src="https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295397__340.png" class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3"
                                     width="400px" alt="profile">
                            </div>
                            <br>

                            <div class="mb-3" style="display: flex; flex-direction: column;">

                               ID  <input readonly="" type="text" name="id1" id="id1" value="${c.id}">
                                <br>

                              NAME  <input type="text" name="name" id="name" value="${c.name}">
                                <br>
                                <button>Update</button>
                            </div>

                        </form>
                    </div>

                </div>

            </div>
        </div>
    </body>
</html>
