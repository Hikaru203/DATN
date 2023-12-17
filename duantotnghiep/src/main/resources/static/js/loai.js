app.controller('DanhMuc-Ctrl', function ($scope, $http) {
    $scope.danhmuc = {};
    $scope.khoaHoc = {};
    $scope.selectLoai = function () {
        $http.get("/api/khoahoc/loaiKhoaHoc").then(function (response) {
            $scope.danhmuc = response.data;
            console.log($scope.danhmuc);
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