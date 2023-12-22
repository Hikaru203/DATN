var app = angular.module('myApp', []);

app.controller('MyController', ['$scope', '$http', function ($scope, $http) {
    $scope.itemuser = {};
    $scope.formuser = {};
    $scope.selectedFileName = {};

    $scope.initialize = function () {
        $http.get("/api/account/info").then(resp => {
            $scope.itemuser = resp.data;
        });
    };

    $scope.initialize();

    $scope.fileChanged = function () {
        var fileInput = document.getElementById('avatarInput');
        var selectedFileName = fileInput.files[0] ? fileInput.files[0].name : '';
        $scope.selectedFileName = selectedFileName;
        $scope.formuser.hinhAnh = fileInput.files[0]; // Lưu đối tượng file vào $scope.formuser.hinhAnh
    };

    $scope.update = function () {
        var email = document.getElementById('email').value;
        var hoTen = document.getElementById('hoTen').value;
        var matKhau = document.getElementById('matKhau').value;
        var soDienThoai = document.getElementById('soDienThoai').value;

        $scope.formuser.email = email;
        $scope.formuser.hoTen = hoTen;
        $scope.formuser.matKhau = matKhau;
        $scope.formuser.soDienThoai = soDienThoai;

        // Kiểm tra điều kiện bắt buộc và hiển thị thông báo lỗi nếu cần
        if (!$scope.formuser.email || !$scope.formuser.hoTen || !$scope.formuser.matKhau || !$scope.formuser.soDienThoai || !$scope.formuser.hinhAnh) {
            showAlert('error', 'Vui lòng nhập đầy đủ thông tin.');
            return;
        }

        // Kiểm tra định dạng email
        if (!isValidEmail($scope.formuser.email)) {
            showAlert('error', 'Định dạng email không hợp lệ.');
            return;
        }

        // Kiểm tra độ dài mật khẩu
        if ($scope.formuser.matKhau.length < 6) {
            showAlert('error', 'Mật khẩu phải có ít nhất 6 ký tự.');
            return;
        }

        // Kiểm tra định dạng số điện thoại
        if (!isValidPhoneNumber($scope.formuser.soDienThoai)) {
            showAlert('error', 'Số điện thoại không hợp lệ.');
            return;
        }

        var formData = new FormData();
        formData.append('hinhAnh', $scope.formuser.hinhAnh);
        $scope.formuser.hinhAnh = $scope.formuser.hinhAnh.name;

        formData.append('user', new Blob([JSON.stringify($scope.formuser)], { type: "application/json" }));

        $http.put("/api/account/update", formData, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            showSuccessMessageAndLogout();
            console.log(1);
        });
    };

    // Hàm hiển thị thông báo
    function showAlert(type, message) {
        Swal.fire({
            icon: type,
            title: message,
            showConfirmButton: false,
            timer: 2000
        });
    }

    // Hàm lấy thông tin người dùng từ server và hiển thị
    function getAccountInfo() {
        $http.get("/api/account/info").then(resp => {
            $scope.itemuser = resp.data;
            $('#spanTaiKhoan').text($scope.itemuser.taiKhoan);
            $('#email').val($scope.itemuser.email);
            $('#hoTen').val($scope.itemuser.hoTen);
            $('#matKhau').val($scope.itemuser.matKhau);
            $('#soDienThoai').val($scope.itemuser.soDienThoai);
            $('#avatar').attr('src', '/api/account/image/' + $scope.itemuser.hinhAnh);
        }).catch(error => {
            console.error('Lỗi khi lấy thông tin người dùng:', error);
        });
    }

    // Gọi hàm lấy thông tin người dùng khi trang tải
    $(document).ready(function () {
        getAccountInfo();
    });

    // Hàm kiểm tra định dạng email
    function isValidEmail(email) {
        return /\S+@\S+\.\S+/.test(email);
    }

    // Hàm kiểm tra định dạng số điện thoại
    function isValidPhoneNumber(phoneNumber) {
        return /^\d{10}$/.test(phoneNumber);
    }
}]);

app.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function (scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;

            element.bind('change', function () {
                scope.$apply(function () {
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);

function showSuccessMessageAndLogout() {
    Swal.fire({
        icon: 'success',
        title: 'Cập nhật thành công!',
        showConfirmButton: false,
        timer: 2000
    }).then(() => {
        window.location.href = '/logoff';
    });
}
