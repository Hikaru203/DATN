function submitForm(event) {
    event.preventDefault();

   
    var email = document.getElementById('email').value;
    var hoTen = document.getElementById('hoTen').value;
    var matKhau = document.getElementById('matKhau').value;
    var soDienThoai = document.getElementById('soDienThoai').value;

    var formData = {
  
        email: email,
        hoTen: hoTen,
        matKhau: matKhau,
        soDienThoai: soDienThoai
    };

    var xhr = new XMLHttpRequest();
    xhr.open("PUT", "/api/account/update", true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    xhr.onload = function () {
    if (xhr.status === 200) {
        var response = JSON.parse(xhr.responseText);
        console.log("Cập nhật thành công:", response);
        // Gọi hàm hiển thị thông báo và đăng xuất
        showSuccessMessageAndLogout();
    } else {
        console.error("Lỗi khi cập nhật. Mã lỗi:", xhr.status);
        showAlert('error', 'Lỗi cập nhật. Mã lỗi: ' + xhr.status);
    }
};
    xhr.onerror = function () {
        console.error("Lỗi mạng khi cập nhật.");
        showAlert('error', 'Lỗi mạng khi cập nhật.');
    };

    xhr.send(JSON.stringify(formData));
}


// Hàm lấy thông tin người dùng từ server và hiển thị
function getAccountInfo() {
    $.ajax({
        type: 'GET',
        url: '/api/account/info',
        success: function(response) {
            // Hiển thị tên đăng nhập trong thẻ span
            $('#spanTaiKhoan').text(response.taiKhoan);
            // Cập nhật giá trị các trường khác trong form
            $('#email').val(response.email);
            $('#hoTen').val(response.hoTen);
            $('#matKhau').val(response.matKhau);
            $('#soDienThoai').val(response.soDienThoai);
            // Các trường khác
        },
        error: function(error) {
            console.error('Lỗi khi lấy thông tin người dùng:', error);
        }
    });
}

// Gọi hàm lấy thông tin người dùng khi trang tải
$(document).ready(function() {
    getAccountInfo();
});


function showSuccessMessageAndLogout() {
    // Hiển thị thông báo SweetAlert
    Swal.fire({
        icon: 'success',
        title: 'Cập nhật thành công!',
        showConfirmButton: false,
        timer: 2000 // Thời gian hiển thị thông báo (ms)
    }).then(() => {
        // Thực hiện chuyển hướng hoặc đăng xuất người dùng
        window.location.href = '/logoff'; // Điều chỉnh URL tùy thuộc vào cách bạn xử lý đăng xuất
    });
}


