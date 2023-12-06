var app = angular.module("myApp", ['ui.bootstrap']);

app.controller("NguoiDung-ctrl", function($scope, $http) {
	// Initialize the nguoiDungList as an empty array
	$scope.nguoiDungList = [];

	// Function to fetch nguoiDung data
	function loadNguoiDung() {
		$http.get("/rest/NguoiDung").then(function(resp) {
			$scope.nguoiDungList = resp.data;
		});
	}

	// Function to populate input fields when the "Edit" button is clicked
	$scope.editUser = function(nguoiDung) {
		$scope.selectedUser = nguoiDung; // Store the selected user data
	};

	// Call the function to load nguoiDung data initially
	loadNguoiDung();
});
// Function to insert a new user
$scope.addUser = function() {
    // Tạo một đối tượng người dùng mới với các thông tin từ form
    var newUser = {
        id: $scope.selectedUser.id,
        hoTen: $scope.selectedUser.hoTen,
        matKhau: $scope.selectedUser.matKhau,
        soDienThoai: $scope.selectedUser.soDienThoai,
        email: $scope.selectedUser.email,
        chucVu: $scope.selectedUser.role, // Lấy từ dropdown Role
        hinhAnh: $scope.selectedUser.imageico, // Tên hình ảnh từ input file
        trangThai: $scope.selectedUser.trangThai === 'Yes' ? true : false // Chuyển đổi giá trị Yes/No thành true/false
    };

 $scope.chooseImage = function() {
    const imageInput = document.getElementById("fileInput");
    imageInput.click();

    imageInput.addEventListener("change", function() {
        const selectedImage = imageInput.files[0];
        // Kiểm tra xem đã chọn tệp ảnh hay chưa
        if (selectedImage) {
            // Lưu tên tệp ảnh vào biến selectedFileName
            $scope.selectedFileName = selectedImage.name;
        }
    });
};

    // Thêm người dùng mới vào danh sách
    $scope.nguoiDungList.push(newUser);

    // Xóa các thông tin trong form
    $scope.selectedUser = {};
};

	$scope.editUser = function() {
		// Implement the logic for editing a user here
		// You can use $scope.selectedUser to access the selected user's data
	};
	$scope.deleteUser = function() {
		    var index = $scope.nguoiDungList.indexOf(nguoiDung);
    if (index !== -1) {
        $scope.nguoiDungList.splice(index, 1); // Xóa người dùng khỏi danh sách
    }
	};
	// Push the new user object into the nguoiDungList

function chooseImage() {
  const imageInput = document.getElementById("imageInput");
  imageInput.click(); // Khi nút "Chọn ảnh" được nhấp, kích hoạt sự kiện click của input[type="file"]
  
  // Lắng nghe sự kiện khi người dùng chọn ảnh
  imageInput.addEventListener("change", function() {
    const selectedImage = imageInput.files[0]; // Lấy file ảnh được chọn (chỉ lấy 1 file)
    
    // Ở đây, bạn có thể xử lý file ảnh được chọn, ví dụ hiển thị nó trên giao diện hoặc thực hiện các thao tác khác.
    // Ví dụ, hiển thị tên file ảnh lên màn hình:
    alert(`Bạn đã chọn ảnh: ${selectedImage.name}`);
  });
}
