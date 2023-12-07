var app = angular.module("myApp", []);
let urlNguoiDung = "/rest/admin/NguoiDung";

app.controller("NguoiDungCtrl", function($scope, $http) {
    $scope.nguoiDungList = [];
    $scope.nguoiDung = {};
    $scope.selectedFileName = "";
    $scope.selectedUser = {};
    $scope.isEditing = false;

    // Lấy danh sách người dùng
    $scope.getAllNguoiDung = function() {
        $http.get("/rest/admin/NguoiDung")
            .then(function(response) {
                $scope.nguoiDungList = response.data;

                // Sắp xếp danh sách theo id tăng dần
                $scope.nguoiDungList.sort(function(a, b) {
                    return a.id - b.id;
                });

                // Đặt số thứ tự cho mỗi người dùng
                for (var i = 0; i < $scope.nguoiDungList.length; i++) {
                    $scope.nguoiDungList[i].stt = i + 1;
                }
            })
            .catch(function(error) {
                console.error("Lỗi khi lấy danh sách người dùng: " + error);
            });
    };

    // Hàm để chỉnh sửa người dùng
    $scope.editUser = function(nguoiDung) {
        $scope.isEditing = true;
        $scope.selectedUser = angular.copy(nguoiDung);
    };
// Thêm Người Dùng
$scope.addNguoiDung = function() {
    // Gửi yêu cầu POST đến máy chủ để thêm người dùng mới
    $http.post(urlNguoiDung + "/addNguoiDung", $scope.selectedUser)
        .then(function(response) {
            // Xử lý kết quả thành công
            // Thêm người dùng vào danh sách
            $scope.nguoiDungList.push(response.data);
            // Đặt lại form
            $scope.resetForm();
        })
        .catch(function(error) {
            // Xử lý lỗi
            console.error("Lỗi khi thêm người dùng: " + error);
        });
};


// Chỉnh sửa Người Dùng
$scope.editNguoiDung = function() {
    // Gửi yêu cầu PUT đến máy chủ để cập nhật thông tin người dùng
    $http.put(urlNguoiDung + "/" + $scope.selectedUser.id, $scope.selectedUser)
        .then(function(response) {
            // Xử lý kết quả thành công
            // Cập nhật thông tin người dùng trong danh sách
            var index = $scope.nguoiDungList.findIndex(function(nguoiDung) {
                return nguoiDung.id === response.data.id;
            });
            if (index !== -1) {
                $scope.nguoiDungList[index] = response.data;
            }
            // Đặt lại form
            $scope.resetForm();
        })
        .catch(function(error) {
            // Xử lý lỗi
            console.error("Lỗi khi chỉnh sửa người dùng: " + error);
        });
};

// Xóa Người Dùng
$scope.deleteNguoiDung = function(nguoiDung) {
    // Gửi yêu cầu DELETE đến máy chủ để xóa người dùng
    $http.delete(urlNguoiDung + "/" + nguoiDung.id)
        .then(function() {
            // Xử lý kết quả thành công
            // Xóa người dùng khỏi danh sách
            var index = $scope.nguoiDungList.indexOf(nguoiDung);
            if (index !== -1) {
                $scope.nguoiDungList.splice(index, 1);
            }
        })
        .catch(function(error) {
            // Xử lý lỗi
            console.error("Lỗi khi xóa người dùng: " + error);
        });
};

    // Reset form
    $scope.resetForm = function() {
        $scope.nguoiDung = {};
        $scope.selectedFileName = "";
    };

    // Hàm để đặt lại form chỉnh sửa
    $scope.resetEditForm = function() {
        $scope.isEditing = false;
        $scope.selectedUser = {};
        $scope.resetForm(); // Đặt lại cả form khi kết thúc chỉnh sửa
    };

app.controller('UpdateAccount', function($scope, $http) {
  $scope.nguoiDung = {}; // Đối tượng chứa thông tin người dùng

  $scope.updateAccount = function() {
    // Gửi request HTTP PUT để cập nhật tài khoản
    $http.put('/rest/admin/NguoiDung' + $scope.nguoiDung.id, $scope.nguoiDung)
      .then(function(response) {
        // Xử lý kết quả trả về từ server (nếu cần)
        console.log(response.data);
      })
      .catch(function(error) {
        // Xử lý lỗi (nếu có)
        console.error(error);
      });
  };
});
    // Gọi hàm lấy danh sách người dùng khi trang web được tải
    $scope.getAllNguoiDung();
});
