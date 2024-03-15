/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function () {
    $('#vnpayForm').submit(function (e) {
        e.preventDefault(); // 
        var formData = {
            amount: $('#amountVnpay').val(),
            description: $('#desVnpay').val()
        };

        $.ajax({
            type: 'post',
            url: 'ajaxServlet',
            data: formData,
            success: function (response) {
                window.location.href = response;
            },
            error: function (error) {
                refreshCaptcha();
                console.log(error);
            }
        });
    });
});