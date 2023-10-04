var app = angular.module("myApp", []);
app.controller("KhoaHoc-ctrl", function ($scope, $http, $window) {
    $scope.itemsKhoaHoc = [];
    $scope.formKhoaHoc = {};
    $scope.initialize = function () {
        // load Khóa học
        $http.get("/Admin/rest/KhoaHoc").then(resp => {
           // Chuyển đổi ngày giờ sang múi giờ Việt Nam
        resp.data.forEach(item => {
            item.ngayTao = moment(item.ngayTao).utcOffset(7).format('YYYY-MM-DD HH:mm:ss');
        });
        
        $scope.itemsKhoaHoc = resp.data;
        console.log($scope.itemsKhoaHoc)
        $('#table').bootstrapTable('load', $scope.itemsKhoaHoc);
        });
        
        
    }

    // Khởi đầu
    $scope.initialize();
})