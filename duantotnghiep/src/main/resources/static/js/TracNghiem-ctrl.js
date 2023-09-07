var app = angular.module("myApp", []);
app.controller("TracNghiem-ctrl", function($scope, $http, $window) {
    $scope.itemsCauHoi = [];

    $scope.initialize = function () {
        // Gọi API để tải dữ liệu câu hỏi từ đường dẫn "/rest/TracNghiem"
        $http.get("/rest/tracnghiem").then(resp => {
            $scope.itemsCauHoi = resp.data;
            console.log("API Response:", resp.data);
        });
    }

    // Gọi hàm initialize để khởi tạo dữ liệu khi trang được tải
    $scope.initialize();
}); 