// Trong file JavaScript của bạn
var app = angular.module("myApp", []);

app.controller("HocVienCtrl", function ($scope, $http) {
    $scope.itemsHocVien = [];

    $scope.initialize = function () {
        // Tải danh sách học viên từ API REST
        $http.get("/rest/admin/HocVien/HocVien").then(function (response) {
            $scope.itemsHocVien = response.data;
        });
        
        $http.get("/rest/admin/KhoaHoc").then(function (response) {
            $scope.itemsKhoaHoc = response.data;
        });
    };
	$scope.showHocVienByKhoaHoc = function (khoaHocId) {
        $http.get("/rest/admin/HocVien/danh-sach-khoa-hoc/" + khoaHocId).then(function (response) {
            $scope.itemsHocVien = response.data;
        });
    };
     $scope.showDetails = function (hocVienId) {
        $http.get("/rest/admin/HocVien/" + hocVienId).then(function (response) {
            $scope.selectedHocVien = response.data;
        });
    };

    // Khởi đầu
    $scope.initialize();
});

