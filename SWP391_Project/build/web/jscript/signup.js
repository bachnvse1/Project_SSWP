/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function () {
    $("#signup-Button").click(function () {
        $.ajax({
            type: 'GET',
            url: "signup.jsp",
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
    $('#signupForm').submit(function (e) {
        e.preventDefault(); // 
        $("signup-button2").prop("disable", true);
        var formData = {
            user: $('#username').val(),
            pass: $('#password-signup').val(),
            confirmPass: $("#confirm-Pass").val(),
            email: $('#email').val(),
            capchaRespone: $("#captcha").val()
        };

        $.ajax({
            type: 'POST',
            url: 'VerifyUser',
            data: formData,

            success: function (response) {
                if (response === "success") {
                    window.location.href = "verify.jsp";
                    $("signup-button2").prop("disable", false);
                    refreshCaptcha();
                } else {
                    refreshCaptcha();
                    $("signup-button2").prop("disable", false);
                    alert(response);
                }
            },
            error: function (error) {
                refreshCaptcha();
                console.log(error);
            }
        });
    });
});

$(document).ready(function () {
    $("#backHome").click(function () {
        $.ajax({
            type: 'GET',
            url: "home.jsp",
            success: function (response) {
                window.location.href = "home.jsp";
            },
            error: function () {
                // Xử lý lỗi nếu có
                alert("Đã xảy ra lỗi khi tải trang");
            }
        });
    });
});



