app.controller('DanhMuc-Ctrl', function ($scope, $http) {
    $scope.danhmuc = {};
    $scope.khoaHoc = {};
         $scope.idLogin = document.getElementById("idLogin").value;
 $scope.email = document.getElementById("email");
    $scope.selectLoai = function () {
        $http.get("/api/khoahoc/loaiKhoaHoc").then(function (response) {
            $scope.danhmuc = response.data;
            console.log($scope.danhmuc);
        });
        $http.get('/rest/admin/NguoiDung/' + $scope.idLogin)
                                            .then(function (response) {
                                                $scope.user = response.data;
                                                console.log($scope.user);
                                            })
                                            .catch(function (error) {
                                                console.error('Lỗi khi gửi yêu cầu:', error);
                                            });
    }
    $scope.showLoai = function (loai) {
        $scope.khoaHoc = {};
        $http.get("/api/khoahoc/byLoai/" + loai.id).then(function (response) {
            console.log(response.data);
            $scope.khoaHoc = response.data;
        })
    };

		
    $scope.selectLoai();
});