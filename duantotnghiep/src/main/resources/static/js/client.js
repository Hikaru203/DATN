var app = angular.module('myApp', []);
    app.controller('KhoaHocController', function($scope, $http, $window) {
        $scope.khoaHocList = []; // Khởi tạo mảng rỗng để lưu danh sách khóa học

        // Gọi API để lấy danh sách khóa học từ server
        $http.get('/api/khoahoc')
            .then(function(response) {
                $scope.khoaHocList = response.data;
            })
            .catch(function(error) {
                console.error('Error fetching data:', error);
            });

        // Hàm chuyển đến trang chi tiết khi nhấn vào tên khoá học
        $scope.goToKhoaHocDetail = function(khoaHocId) {
            $window.location.href = '/detail/' + khoaHocId;
        };
    });