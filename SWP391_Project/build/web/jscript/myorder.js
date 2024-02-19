/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* global modal1 */

$(document).ready(function () {
    // Ẩn form khi trang được tải
    $("#addProductForm").hide();
    $("#orderBuy").hide();
    $("#myModalComplain").hide();
    $("#myModalVerify").hide();
    // Xử lý sự kiện khi nhấn nút "Add Product"
    $("#addProductButton").click(function () {
        $("#addProductForm").show();
        $("#ProductDisplay").hide();
        $("#Filter").hide();
        $("#orderBuy").hide();
        $("#myModalComplain").hide();
        $("#myModalVerify").hide();
    });
    $("#allProductButton").click(function () {
        $("#addProductForm").hide();
        $("#ProductDisplay").show();
        $("#orderBuy").hide();
        $("#myModalComplain").hide();
        $("#myModalVerify").hide();
    });
});
function toggleOptions(productId) {
    const options = document.getElementById(productId).querySelector('.options');
    options.style.display = options.style.display === 'block' ? 'none' : 'block';
}

$(document).ready(function () {
    $('#addForm').submit(function (e) {
        e.preventDefault(); // Ngăn chặn hành động mặc định của form
        var formData = $(this).serialize(); // Thu thập dữ liệu từ form
        $.ajax({
            url: 'addProduct', // Đường dẫn tới file xử lý form
            type: 'POST', // Phương thức POST
            data: formData, // Dữ liệu được thu thập từ form
            success: function (response) {
                // Xử lý phản hồi từ máy chủ nếu cần
                if (response === "success") {
                    window.location.href = 'manageMyOrder';
                } else {
                    alert("Loi");
                }

            },
            error: function (xhr, status, error) {
                // Xử lý lỗi nếu có
                console.error(xhr.responseText);
            }
        });
    });
});

$(document).ready(function () {
    $('.productInfo').click(function (event) {
        event.preventDefault();

        var productId = $(this).data('product-id');
        var action = $(this).data('action');
        $.ajax({
            type: 'POST',
            url: 'manageMyOrder',
            data: {pid: productId, action: action},
            success: function (response) {
                document.getElementById("overlay").style.display = "block";
                document.getElementById("modal").style.display = "block";

                var responseData = response.split(";");
                document.getElementById("orderCode").value = responseData[0];
                document.getElementById("productName").value = responseData[1];
                document.getElementById("price").value = responseData[2];
                document.getElementById("intermediaryFee").value = responseData[3];
                if (responseData[4] === 'Bên bán') {
                    document.getElementById("partySeller").checked = true;
                } else if (responseData[4] === 'Bên mua') {
                    document.getElementById("partyBuyer").checked = true;
                }
                document.getElementById("receivedAmount").value = responseData[5];
                document.getElementById("paidAmount").value = responseData[6];
                document.getElementById("img1").src = responseData[7];
                document.getElementById("img2").src = responseData[8];
                document.getElementById("img3").src = responseData[9];
                document.getElementById("img4").src = responseData[10];
                document.getElementById("description").value = responseData[11];
                document.getElementById("hiddenContent").value = responseData[12];
                document.getElementById("contactMethod").value = responseData[13];
                document.getElementById("status").value = responseData[14];
                document.getElementById("buyer").value = responseData[15];
                document.getElementById("create_at").value = responseData[16];
                document.getElementById("update_at").value = responseData[17];
            }
        });
    });


    $('.updateproduct').click(function (event) {
        event.preventDefault();
        var productId = $(this).data('product-id');
        var action = $(this).data('action');
        $.ajax({
            type: 'POST',
            url: 'manageMyOrder',
            data: {pid: productId, action: action},
            success: function (response) {
                document.getElementById("overlay").style.display = "block";
                document.getElementById("modal2").style.display = "block";

                // Code xử lý dữ liệu phản hồi cho modal2
                var responseData = response.split(";");
                document.getElementById("orderCode_ud").value = responseData[0];
                document.getElementById("productName_ud").value = responseData[1];
                document.getElementById("price_ud").value = responseData[2];
                document.getElementById("intermediaryFee_ud").value = responseData[3];
                if (responseData[4] === 'Bên bán') {
                    document.getElementById("partySeller_ud").checked = true;
                } else if (responseData[4] === 'Bên mua') {
                    document.getElementById("partyBuyer_ud").checked = true;
                }
                document.getElementById("receivedAmount_ud").value = responseData[5];
                document.getElementById("paidAmount_ud").value = responseData[6];
                document.getElementById("img1_ud").value = responseData[7];
                document.getElementById("img2_ud").value = responseData[8];
                document.getElementById("img3_ud").value = responseData[9];
                document.getElementById("img4_ud").value = responseData[10];
                document.getElementById("description_ud").value = responseData[11];
                document.getElementById("hiddenContent_ud").value = responseData[12];
                document.getElementById("contactMethod_ud").value = responseData[13];
                document.getElementById("status_ud").value = responseData[14];
                document.getElementById("buyer_ud").value = responseData[15];
                document.getElementById("create_at_ud").value = responseData[16];
                document.getElementById("update_at_ud").value = responseData[17];
            }
        });
    });
});
$(document).ready(function () {
    $('#updateButton').click(function () {
        // Thu thập dữ liệu từ form
        var formData = {

            productName: $('#productName_ud').val(),
            price: $('#price_ud').val(),
            party: $('input[name=party]:checked').val(),
            img1: $('#img1_ud').val(),
            img2: $('#img2_ud').val(),
            img3: $('#img3_ud').val(),
            img4: $('#img4_ud').val(),
            description: $('#description_ud').val(),
            hiddenContent: $('#hiddenContent_ud').val(),
            contactMethod: $('#contactMethod_ud').val(),
            status: $('#status_ud').val()
        };

        // Gửi dữ liệu đến servlet bằng AJAX
        $.ajax({
            type: 'POST',
            url: 'updateOrder',
            data: formData,
            success: function (response) {
                alert("success");
            },
            error: function (xhr, status, error) {
                // Xử lý lỗi (nếu có)
            }
        });
    });
});
function hideProductModal() {
    document.getElementById("overlay").style.display = "none";
    document.getElementById("modal").style.display = "none";
    document.getElementById("modal2").style.display = "none";
}

$(document).ready(function () {
    $("#order-checking").click(function () {
        $("#orderBuy").show();
        $("#orderBuy-complete").hide();
        $("#ProductDisplay").hide();
        $("#Filter").hide();
        $("#addProductForm").hide();
        $.ajax({
            type: 'GET',
            url: "orderChecking",
            success: function (response) {
                $("#cell-info").html(response);
            },
            error: function () {
                // Xử lý lỗi nếu có
                alert("Đã xảy ra lỗi khi tải trang");
            }
        });
    });
});

$(document).ready(function () {
    $("#order-complete").click(function () {
        $("#orderBuy-complete").show();
        $("#orderBuy").hide();
        $("#ProductDisplay").hide();
        $("#Filter").hide();
        $("#addProductForm").hide();
        $.ajax({
            type: 'POST',
            url: "orderChecking",
            success: function (response) {
                $("#cell-info1").html(response);
            },
            error: function () {
                // Xử lý lỗi nếu có
                alert("Đã xảy ra lỗi khi tải trang");
            }
        });
    });
});

$(document).ready(function () {
    // Khi người dùng nhấn vào button, mở modal
    $(document).on("click", ".reportButton", function (e) {
        e.preventDefault();
        var orderId = $(this).data("orderid");
        var orderCode = $(this).data("ordercode");
        var hiddenInfo = $(this).data("hiddeninfo");
        $("#order_id").val(orderId); // Cập nhật giá trị của trường input
        $("#order_code").val(orderCode); // Cập nhật giá trị của trường input
        $("#hidden_info").val(hiddenInfo);
        $("#myModalComplain").show();

    });

    $(document).on("click", ".verifyButton", function (e) {
        e.preventDefault();
        var orderId = $(this).data("orderid");
        var proid = $(this).data("proid");
        $("#order_id").val(orderId); // Cập nhật giá trị của trường input // Cập nhật giá trị của trường input
        $("#pro_id").val(proid);
        $("#myModalVerify").show();
    });


    // Khi người dùng nhấn vào nút đóng (×), đóng modal
    $(".close").click(function () {
        $("#myModalComplain").hide();
    });

    $(".close").click(function () {
        $("#myModalVerify").hide();
    });
    // Khi người dùng nhấp bất kỳ đâu ngoài modal, đóng modal
    $(window).click(function (event) {
        if (event.target === $("#myModalComplain")[0]) {
            $("#myModalComplain").hide();
        }
    });


    $("#complaintForm").submit(function (e) {
        e.preventDefault(); // Ngăn chặn chuyển hướng mặc định khi nhấn nút submit
        var formData = {
            order_id: $("#order_id").val(),
            description: $("#description1").val()
        };
        $.ajax({
            type: 'POST',
            url: 'report', // Đường dẫn đến servlet xử lý
            data: formData, // Gửi dữ liệu của form sang servlet
            success: function (response) {
                if (response === "success") {
                    alert("Complain success! Please wainting response from system!");
                } else {
                    alert("You have already complained about this order");
                }
            },
            error: function (xhr, status, error) {
                alert("ưe");
            }
        });
    });

    $("#authForm").submit(function (e) {
        e.preventDefault(); // Ngăn chặn chuyển hướng mặc định khi nhấn nút submit
        var formData = {
            id: $("#order_id").val(),
            pro_id: $("#pro_id").val()
        };
        $.ajax({
            type: 'POST',
            url: 'verifyOrder', // Đường dẫn đến servlet xử lý
            data: formData, // Gửi dữ liệu của form sang servlet
            success: function (response) {
                if (response === "success") {
                    $("#myModalVerify").hide();
                    alert("Verify order sucess");

                } else {
                    alert("You have already verify this order!");
                }
            },
            error: function (xhr, status, error) {
                alert("ưe");
            }
        });
    });
});

