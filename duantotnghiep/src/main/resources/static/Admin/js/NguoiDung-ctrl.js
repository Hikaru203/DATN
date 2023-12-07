app.controller("NguoiDungCtrl", function($scope, $http) {
    $scope.nguoiDungList = [];

    // Lấy danh sách người dùng
    $scope.getAllNguoiDung = function() {
        $http.get("/rest/admin/NguoiDung")
            .then(function(response) {
                $scope.nguoiDungList = response.data;
                // Thêm logic sắp xếp, đặt số thứ tự nếu cần
            })
            .catch(function(error) {
                console.error("Lỗi khi lấy danh sách người dùng: " + error);
            });
    };

    // Gọi hàm lấy danh sách người dùng khi trang web được tải
    $scope.getAllNguoiDung();
});

// Hàm để cập nhật giá trị của input ID
function updateIdInput(id) {
    var inputElement = document.getElementById('idInput');
    inputElement.value = id;
}
document.addEventListener('DOMContentLoaded', function() {
    var addAccountBtn = document.getElementById('addAccountBtn');
    if (addAccountBtn) {
        addAccountBtn.addEventListener('click', function(event) {
            event.preventDefault(); // Ngăn chặn hành vi mặc định của form

            // Lấy dữ liệu từ các trường nhập và thực hiện các xử lý khác
            var taiKhoan = document.getElementById('taiKhoanInput').value;
            var matKhau = document.getElementById('matKhauInput').value;
            var hoTen = document.getElementById('hoTenInput').value;
            var email = document.getElementById('emailInput').value;
            var soDienThoai = document.getElementById('soDienThoaiInput').value;
            var chucVu = document.getElementById('chucVuInput').value;
            var hinhAnh = document.getElementById('hinhAnhInput').value;
            var trangThai = document.getElementById('trangThaiInput').value;
            

            // Gửi dữ liệu lên server (sử dụng AJAX, ví dụ: fetch API)
            fetch('/api/them-tai-khoan', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    taiKhoan: taiKhoan,
                    matKhau: matKhau,
                    hoTen: hoTen,
                    email: email,
                    soDienThoai: soDienThoai,
                    chucVu: chucVu,
                    hinhAnh: hinhAnh,
                    trangThai: trangThai,
               
                })
            })
            .then(function(response) {
                return response.json();
            })
            .then(function(data) {
                // Xử lý kết quả từ server, có thể cập nhật giao diện nếu cần
                console.log('Thêm tài khoản thành công:', data);
            })
            .catch(function(error) {
                console.error('Lỗi khi thêm tài khoản:', error);
            });
        });
    }
});

  









