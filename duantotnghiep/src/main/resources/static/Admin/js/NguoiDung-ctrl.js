app.controller("NguoiDungCtrl", function ($scope, $http) {
    $scope.nguoiDungList = [];

    // Lấy danh sách người dùng
    $scope.getAllNguoiDung = function () {
        $http.get("/rest/admin/NguoiDung")
            .then(function (response) {
                $scope.nguoiDungList = response.data;
                // Thêm logic sắp xếp, đặt số thứ tự nếu cần
            })
            .catch(function (error) {
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
var addAccountBtn = document.getElementById('addAccountBtn');
if (addAccountBtn) {
    addAccountBtn.addEventListener('click', function (event) {
        event.preventDefault(); // Ngăn chặn hành vi mặc định của form

        // Lấy dữ liệu từ các trường nhập và thực hiện các xử lý khác
        var taiKhoan = document.getElementById('taiKhoanInput').value;
        var hoTen = document.getElementById('hoTenInput').value;
        var email = document.getElementById('emailInput').value;
        var soDienThoai = document.getElementById('soDienThoaiInput').value;
        var chucVu = document.getElementById('selectedValueInput').value;

        // Gửi dữ liệu lên server (sử dụng AJAX, ví dụ: fetch API)
        fetch('/rest/admin/NguoiDung/them1', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                taiKhoan: taiKhoan,
                hoTen: hoTen,
                email: email,
                soDienThoai: soDienThoai,
                chucVu: chucVu,
                trangThai: true,
                thoiGianTao: new Date(),
                xacMinh: true,
                thongBao: true,
                nhanThongBao: false,
            })
        })
        .then(function (response) {
            if (!response.ok) {
                throw new Error('Có lỗi khi thêm tài khoản.');
            }
            return response.json();
        })
        .then(function (data) {
            // Xử lý kết quả từ server, có thể cập nhật giao diện nếu cần
            console.log('Thêm tài khoản thành công:', data);

            // Hiển thị thanh thông báo
            var notification = document.getElementById('notification');
            notification.textContent = 'Thêm tài khoản thành công!';
            notification.style.display = 'block';

            // Ẩn thông báo sau 3 giây (3000 miligiây)
            setTimeout(function() {
                notification.style.display = 'none';
            }, 3000);

            // Load lại trang sau 3 giây
            setTimeout(function() {
                location.reload();
            }, 3000);
        })
        .catch(function (error) {
            console.error('Lỗi khi thêm tài khoản:', error);
        });
    });
}

  

$scope.showNguoiDungInfo = function() {
    // Gán giá trị cho các input
    $scope.taiKhoanInput = $scope.selectedNguoiDung.taiKhoan;
    $scope.matKhauInput = $scope.selectedNguoiDung.matKhau;
    $scope.hoTenInput = $scope.selectedNguoiDung.hoTen;
    $scope.emailInput = $scope.selectedNguoiDung.email;
    $scope.soDienThoaiInput = $scope.selectedNguoiDung.soDienThoai;
    $scope.chucVuInput = $scope.selectedNguoiDung.chucVu;
    // ... Gán giá trị cho các input khác ...
};
    $scope.deleteNguoiDung = function(nguoiDung) {
        $http.delete('/rest/admin/NguoiDung/xoa' + nguoiDung.id)
            .then(function(response) {
                $scope.getAllNguoiDung();  
                console.log('Người dùng đã bị xóa:', nguoiDung);
            })
            .catch(function(error) {
                console.error('Lỗi khi xóa người dùng:', error);
            });
    };
     
$scope.selectNguoiDung = function(nguoiDung) {
    // Gán thông tin người dùng được chọn vào selectedNguoiDung
    $scope.selectedNguoiDung = nguoiDung;
    // Hiển thị thông tin người dùng trên các input
    $scope.showNguoiDungInfo();
};