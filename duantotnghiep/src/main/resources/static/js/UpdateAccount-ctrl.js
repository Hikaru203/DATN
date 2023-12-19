var app = angular.module('myApp', []);
app.controller('MyController', ['$scope', '$http', function($scope, $http) {
	$scope.itemuser = {};

	$scope.formuser = {};
	$scope.selectedFileName = {};

	$scope.initialize  = function() {
		$http.get("/api/account/info").then(resp => {
			$scope.itemuser = resp.data;
			
		});
		$scope.itemuser

	}
$scope.initialize();
$scope.fileChanged = function () {
    var fileInput = document.getElementById('avatarInput');
    var selectedFileName = fileInput.files[0] ? fileInput.files[0].name : '';
    $scope.selectedFileName = selectedFileName;
     alert($scope.selectedFileName)
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
		// Thực hiện hiển thị thông báo dựa trên loại (type)
		// Ví dụ: Sử dụng thư viện SweetAlert
		Swal.fire({
			icon: type,
			title: message,
			showConfirmButton: false,
			timer: 2000 // Thời gian hiển thị thông báo (ms)
		});
	}

	// Rest of your code...


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


	

}

]);

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
	
  $scope.update = function() {
               if (!$scope.email || !$scope.hoTen || !$scope.matKhau || !$scope.soDienThoai || !$scope.formuser.hinhAnh) {
            showAlert('error', 'Vui lòng nhập đầy đủ thông tin.');
            return;
        }
                if (!isValidEmail($scope.email)) {
            showAlert('error', 'Định dạng email không hợp lệ.');
            return;
        }
                if ($scope.matKhau.length < 6) {
            showAlert('error', 'Mật khẩu phải có ít nhất 6 ký tự.');
            return;
        }
        if (!isValidPhoneNumber($scope.soDienThoai)) {
            showAlert('error', 'Số điện thoại không hợp lệ.');
            return;
        }
    };
 // Hàm kiểm tra định dạng email
    function isValidEmail(email) {
           return /\S+@\S+\.\S+/.test(email);
    }
 // Hàm kiểm tra định dạng số điện thoại
    function isValidPhoneNumber(phoneNumber) {
              return /^\d{10}$/.test(phoneNumber);
    }