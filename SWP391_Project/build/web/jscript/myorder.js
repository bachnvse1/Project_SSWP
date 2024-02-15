/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

    $(document).ready(function(){
            // Ẩn form khi trang được tải
             $("#addProductForm").hide();
            // Xử lý sự kiện khi nhấn nút "Add Product"
            $("#addProductButton").click(function(){
                $("#addProductForm").show();
                $("#ProductDisplay").hide();
            });
            $("#allProductButton").click(function(){
                $("#addProductForm").hide();
                $("#ProductDisplay").show();
            });
        });
            function toggleOptions(productId) {
                const options = document.getElementById(productId).querySelector('.options');
                options.style.display = options.style.display === 'block' ? 'none' : 'block';
            }
            
$(document).ready(function(){
    $('#addForm').submit(function(e){
        e.preventDefault(); // Ngăn chặn hành động mặc định của form
        var formData = $(this).serialize(); // Thu thập dữ liệu từ form
        $.ajax({
            url: 'addProduct', // Đường dẫn tới file xử lý form
            type: 'POST', // Phương thức POST
            data: formData, // Dữ liệu được thu thập từ form
            success: function(response){
                // Xử lý phản hồi từ máy chủ nếu cần
                if(response==="success"){
                    window.location.href = 'MyOrder.jsp';
                }else{
                    
                    alert("Loi");
                }
                
            },
            error: function(xhr, status, error){
                // Xử lý lỗi nếu có
                console.error(xhr.responseText);
            }
        });
    });
});
