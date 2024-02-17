<%-- 
    Document   : VerifyOrder
    Created on : Feb 17, 2024, 7:50:39 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Xác thực</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #f0f0f0;
            }

            .container {
                text-align: center;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }

            h2 {
                margin-bottom: 20px;
                color: #333;
            }

            .options {
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }

            .option {
                padding: 10px 20px;
                margin: 0 10px;
                border: 2px solid #007bff;
                border-radius: 20px;
                background-color: transparent;
                color: #007bff;
                cursor: pointer;
                transition: background-color 0.3s, color 0.3s;
            }

            .option:hover {
                background-color: #007bff;
                color: white;
            }

            .hidden {
                display: none;
            }

            .loader {
                border: 4px solid #f3f3f3;
                border-top: 4px solid #3498db;
                border-radius: 50%;
                width: 20px;
                height: 20px;
                display: none;
                margin: 10px auto;
                animation: spin 1s linear infinite;
            }

        </style>

    </head>
    <body>
        <div class="container">
            <h2>Verify Order</h2>
            <p>Order code ${dao.getOrderByID(id).getCode()} matches the description</p>
            <form id="authForm">
                <div class="options">
                    <button type="button" class="option yes" ty>Yes</button>
                    <button type="button" class="option no">No</button>
                </div>
                <button type="submit" id="submitButton" class="hidden">Xác nhận</button>
                <div class="loader" id="loader"></div>
            </form>
        </div>

    </body>
</html>

