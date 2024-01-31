/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



/* global Swal */

$(document).ready(function () {
    $("#signin-Button").click(function () {
        $.ajax({
            type: 'GET',
            url: "signin.jsp",
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


function SignIn()
{
    var username = $("#user-Signin").val();
    var password = $("#password-field").val();
    var captcha = $("#captcha").val();
    $.ajax({
        type: "POST",
        url: "login",
        data: {
            username: username,
            password: password,
            capchaRespone: captcha
        },
        success: function (response) {
            if (response === "success") {
                Swal.fire({
                    position: "bot-end",
                    icon: "success",
                    title: "Login success!",
                    showConfirmButton: false,
                    timer: 1000
                });
                setTimeout(function () {
                    window.location.href = "home"; // thế cái này chạy tới đâu home, cai nay la dang nhap tk cus ? ho
                }, 1000);
            } else if (response === "admin") {
                window.location.href = "ManageAccount"; // cai nay dnhap tk admin 
            } else if (response === "verify") {
                window.location.href = "verify.jsp"; // cai nay dnhap tk admin 
            } else {

                refreshCaptcha();

                Swal.fire({
                    icon: "error",
                    title: "Error...",
                    text: response

                });
            }
        }
    });
};

function refreshCaptcha()
{
    // Sử dụng AJAX để làm mới ảnh CAPTCHA
    $.get('refreshcaptcha', function () {
        // Thay đổi src của ảnh để làm mới
        $('#captchaImage').attr('src', 'captchaimage?' + new Date().getTime());
    });
}
;



