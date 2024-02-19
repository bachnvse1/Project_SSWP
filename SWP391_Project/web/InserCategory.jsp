<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Category</title>
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
                    <h2 class="text-center text-dark mt-5">Add Category</h2>
                    <div class="card my-5">

                        <form action="editcategory" method="post" class="card-body cardbody-color p-lg-5">

                            <div class="text-center" >
                                <img src="https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295397__340.png" class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3"
                                     width="400px" alt="profile">
                            </div>
                            <br>
                     
                                <div class="mb-3">
                                    <input input type="text" name="category"   placeholder="NAME" class="form-control" id="Username" required="" >
                                       <br>
                                        <br>
                                    <div class="text-center"><button type="submit" class="btn btn-color px-5 mb-5 w-100">Insert</button></div>
                                </div>
                   
                        </form>
                    </div>

                </div>

            </div>
        </div>
    </div>
</body>
</html>
