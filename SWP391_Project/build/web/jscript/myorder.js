/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* global l1 */

$(document).ready(function () {
    // Ẩn form khi trang được tải
//    $("#addProductForm").hide();
//    $("#orderBuy").hide();
//    $("#myModalComplain").hide();
//    $("#myModalVerify").hide();
//    $("#orderBuy-complete").hide();
//    $("#exampleModalCreate").hide();
//    $("#ProductCompleteDisplay").hide();
//    $("#ProductProcessingDisplay").hide();  
    // Xử lý sự kiện khi nhấn nút "Add Product"
    $("#addProductButton").click(function () {
        $("#addProductForm").show();
        $("#ProductDisplay").hide();
        $("#Filter").hide();
        $("#orderBuy").hide();
        $("#myModalComplain").hide();
        $("#myModalVerify").hide();
        $("#orderBuy-complete").hide();
        $("#exampleModalCreate").hide();
        $("#ProductCompleteDisplay").hide();
        $("#ProductProcessingDisplay").hide();
    });
    $("#allProductButton").click(function () {
        $("#addProductForm").hide();
        $("#ProductDisplay").show();
        $("#orderBuy").hide();
        $("#orderBuy-complete").hide();
        $("#Filter").show();
        $("#myModalComplain").hide();
        $("#myModalVerify").hide();
        $("#exampleModalCreate").hide();
        $("#ProductCompleteDisplay").hide();
        $("#ProductProcessingDisplay").hide();
    });
    $("#completedorder").click(function () {
        $("#addProductForm").hide();
        $("#ProductDisplay").hide();
        $("#orderBuy").hide();
        $("#orderBuy-complete").hide();
        $("#Filter").show();
        $("#myModalComplain").hide();
        $("#myModalVerify").hide();
        $("#exampleModalCreate").hide();
        $("#ProductCompleteDisplay").show();
        $("#ProductProcessingDisplay").hide();
    });
    $("#processingorder").click(function () {
        $("#addProductForm").hide();
        $("#ProductDisplay").hide();
        $("#orderBuy").hide();
        $("#orderBuy-complete").hide();
        $("#Filter").show();
        $("#myModalComplain").hide();
        $("#myModalVerify").hide();
        $("#exampleModalCreate").hide();
        $("#ProductCompleteDisplay").hide();
    $("#ProductProcessingDisplay").show();
    });
});
function toggleOptions(productId) {
    const options = document.getElementById(productId).querySelector('.options');
    options.style.display = options.style.display === 'block' ? 'none' : 'block';
}

$(document).ready(function () {
    $('#addForm').submit(function (e) {
        e.preventDefault(); // Ngăn chặn hành động mặc định của form

        // Hiển thị hộp thoại xác nhận của SweetAlert2
        Swal.fire({
            title: "Are you sure?",
            text: "Posting a product will cost 500 VND for the posting fee !",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, add it!",
            width: 600, // Độ rộng của hộp thoại
            height: 600, // Chiều cao của hộp thoại

        }).then((result) => {
            // Nếu người dùng xác nhận
            if (result.isConfirmed) {
                var formData = $('#addForm').serialize(); // Thu thập dữ liệu từ form
                $.ajax({
                    url: 'addProduct', // Đường dẫn tới file xử lý form
                    type: 'POST', // Phương thức POST
                    data: formData, // Dữ liệu được thu thập từ form
                    success: function (response) {
                        // Xử lý phản hồi từ máy chủ nếu cần
                        if (response === "success") {
                            Swal.fire({
                                title: "Success!",
                                text: "Product has been added.",
                                icon: "success"
                            }).then(() => {
                                window.location.href = 'manageMyOrder';
                            });
                        } else if (response === "Insufficient_balance") {
                            Swal.fire({
                                title: "Error!",
                                text: "Insufficient balance.",
                                icon: "error"
                            }).then(() => {
                                window.location.href = 'manageMyOrder';
                            })
                                    ;
                        } else if (response === "price") {
                            Swal.fire({
                                title: "Error!",
                                text: "Please re-enter the price",
                                icon: "error"
                            });

                        }
                    },
                    error: function (xhr, status, error) {
                        // Xử lý lỗi nếu có
                        console.error(xhr.responseText);
                    }
                });
            }
        });
    });
});

$(document).ready(function () {
    $('.productInfo').click(function (event) {
        event.preventDefault();
                document.getElementById("overlay").style.display = "block";
                document.getElementById("modal").style.display = "block";
        var productId = $(this).data('product-id');
        var action = $(this).data('action');
        $.ajax({
            type: 'POST',
            url: 'manageMyOrder',
            data: {pid: productId, action: action},
            success: function (response) {
                

                var responseData = response.split(";");
                document.getElementById("orderCode").value = responseData[0];
                document.getElementById("productName").value = responseData[1];
                document.getElementById("price").value = responseData[2];
                document.getElementById("intermediaryFee").value = responseData[3];
                document.getElementById("party").value = responseData[4];
                document.getElementById("receivedAmount").value = responseData[5];
                document.getElementById("paidAmount").value = responseData[6];
                document.getElementById("img1").src = responseData[7];
                document.getElementById("img2").src = responseData[8];
                document.getElementById("img3").src = responseData[9];
                document.getElementById("img4").src = responseData[10];
                document.getElementById("description").value = responseData[11];
                document.getElementById("hiddenContent_info").value = responseData[12];
                document.getElementById("contactMethod").value = responseData[13];
                document.getElementById("status").value = responseData[14];
                document.getElementById("buyer_info").value = responseData[15];
                document.getElementById("create_at").value = responseData[16];
                document.getElementById("update_at").value = responseData[17];
            }
        });
    });

$('.productInfo1').click(function (event) {
    console.log("Clicked on productInfo");
    // Các lệnh xử lý khác ở đây
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
                if (responseData[4] === 'Bên Bán') {
                    document.getElementById("partySeller_ud").checked = true;
                } else if (responseData[4] === 'Bên Mua') {
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

            code: $('#orderCode_ud').val(),
            productName: $('#productName_ud').val(),
            price: $('#price_ud').val(),
            party: $('input[name=party]:checked').val(),
            img1: $('#img1_ud').val(),
            img2: $('#img2_ud').val(),
            img3: $('#img3_ud').val(),
            img4: $('#img4_ud').val(),
            description: $('#description_ud').val(),
            hiddenContent: $('#hiddenContent_ud').val(),
            contactMethod: $('#contactMethod_ud').val()
        };

        // Gửi dữ liệu đến servlet bằng AJAX
        $.ajax({
            type: 'POST',
            url: 'updateOrder',
            data: formData,
            success: function (response) {
                if (response === 'success') {
                    alert("success");
                    window.location.href = 'manageMyOrder';
                } else {
                    alert(response);
                }
            },
            error: function (xhr, status, error) {
                // Xử lý lỗi (nếu có)
                alert("loi");
                console.error(xhr.responseText);
            }
        });
    });
});
const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
        confirmButton: "btn btn-success",
        cancelButton: "btn btn-danger"
    },
    buttonsStyling: false
});

$('.deleteProductButton').click(function () {
    // Thu thập dữ liệu từ form
    var orderID = $(this).data('product-id');

    // Hiển thị hộp thoại xác nhận
    swalWithBootstrapButtons.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Yes, delete it!",
        cancelButtonText: "No, cancel!",
        reverseButtons: true
    }).then((result) => {
        if (result.isConfirmed) {
            // Nếu người dùng chấp nhận xóa, thực hiện AJAX
            $.ajax({
                type: 'POST',
                url: 'deleteProduct',
                data: {oid: orderID},
                success: function (response) {
                    if (response === "success") {
                        swalWithBootstrapButtons.fire({
                            title: "Deleted!",
                            text: "Your file has been deleted.",
                            icon: "success"
                        }).then(() => {
                            window.location.href = 'manageMyOrder';
                        });
                    }
                },
                error: function (xhr, status, error) {
                    // Xử lý lỗi (nếu có)
                    swalWithBootstrapButtons.fire({
                        title: "Error!",
                        text: "An error occurred while deleting the product.",
                        icon: "error"
                    });
                }
            });
        } else if (result.dismiss === Swal.DismissReason.cancel) {
            // Nếu người dùng hủy bỏ xóa
            swalWithBootstrapButtons.fire({
                title: "Cancelled",
                text: "Your imaginary file is safe :)",
                icon: "error"
            });
        }
    });
});
function hideProductModal() {
    event.preventDefault();
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
        $("#ProductProcessingDisplay").hide();
        $("#ProductCompleteDisplay").hide();
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
        $("#ProductProcessingDisplay").hide();
        $("#ProductCompleteDisplay").hide();
        $.ajax({
            type: 'POST',
            url: "orderChecking",
            success: function (response) {
                $("#cell-info1").html(response);
            },
            error: function () {
                // Xử lý lỗi nếu có
                alert("Đã xảy ra lỗi khi tải trang2");
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
        var productName = $(this).data("productname");
        var Price = $(this).data("price");
        var Imtermediary = $(this).data("inter");
        var party = $(this).data("party");
        var totalPaid = $(this).data("totalpaids");
        var productImg = $(this).data("proimg");
        var des = $(this).data("des");
        var hiddenInfo = $(this).data("hiddeninfo");
        var contact = $(this).data("contact");
        var status = $(this).data("status1");
        var buyer = $(this).data("buyers");
        var createTime = $(this).data("create");
        
        $("#order_id").val(orderId); // Cập nhật giá trị của trường input
        $("#order_code").val(orderCode); // Cập nhật giá trị của trường input
        $("#productName1").val(productName);
       
        $("#Price").val(Price);
        $("#inter").val(Imtermediary);
        $("#party1").val(party);
        $("#totalPaid1").val(totalPaid);
        $("#img1").val(productImg);
        $("#des").val(des);
        $("#hidden_info").val(hiddenInfo);
        $("#contact").val(contact);
        $("#status1").val(status);
        $("#buyer1").val(buyer);
        $("#create").val(createTime);
        
        $("#myModalComplain").show();

    });

    $(document).on("click", ".verifyButton", function (e) {
        e.preventDefault();
        var orderId = $(this).data("orderid");
        var proid = $(this).data("proid");
        $("#order_id").val(orderId); // Cập nhật giá trị của trường input // Cập nhật giá trị của trường input
        $("#pro_id1").val(proid);
        $("#myModalVerify").show();
    });


    // Khi người dùng nhấn vào nút đóng (×), đóng modal
    $(".close").click(function () {
        $("#myModalComplain").hide();
        
        
    });

    $(".close1").click(function () {
        $("#myModalVerify").hide();
        $("#exampleModalCreate").hide();
        window.location.href = "manageMyOrder";
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
            description: $("#description1").val(),
            pro_id: $("#pro_id1").val()
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
                console.error(xhr.responseText);
            }
        });
    });

    $("#authForm").submit(function (e) {
        e.preventDefault(); // Ngăn chặn chuyển hướng mặc định khi nhấn nút submit
        var formData = {
            id: $("#order_id").val(),
            pro_id: $("#pro_id1").val()
        };
        $.ajax({
            type: 'POST',
            url: 'verifyOrder', // Đường dẫn đến servlet xử lý
            data: formData, // Gửi dữ liệu của form sang servlet
            success: function (response) {
                if (response === "success") {
                    
                    alert("Verify order success");

                    // Hiển thị modal example sau khi nhấp OK
                    $("#exampleModalCreate").show();

                    // Chuyển hướng đến trang home
                    //window.location.href = 'manageMyOrder';
                } else {
                    $("#exampleModalCreate").hide();
                    alert("You have already verified this order!");
                }
            },
            error: function (xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
    });

});

$(document).ready(function () {
    $(".filterBtn").click(function (e) {
        e.preventDefault(); // Ngăn chặn hành động mặc định của nút submit
        sendData();
    });

    $("select").change(function () {
        sendData();
    });

    function sendData() {
        var formData = {
            filter_code: $("#filter_code").val(),
            filter_name: $("#filter_name").val(),
            filter_price: $("#filter_price").val(),
            filter_status: $("#filter_status").val(),
            filter_party: $("#filter_party").val()
        };

        $.ajax({
            type: "POST",
            url: "filtermyorder",
            data: formData,
            success: function (response) {
                // Xử lý dữ liệu trả về nếu cần
                console.log(response);
            },
            error: function (xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
    }
});