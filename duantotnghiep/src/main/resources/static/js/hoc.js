// Đăng ký module
var app = angular.module('detail-app', []);

app.controller('detail-controller', function ($scope, $http, $window) {

    $scope.DangKy = {};
    $scope.check = {};
    $scope.hoc = {};
    $scope.idNguoiDung2 = {};
    $scope.TenNguoiDung = {};
    var idNguoiDung = null;
    var idKhoaHoc = null;
    // Hàm để lấy giá trị từ cookie bằng tên
    function getCookieValue(name) {
        var value = "; " + document.cookie;
        var parts = value.split("; " + name + "=");
        if (parts.length === 2)
            return parts.pop().split(";").shift();
    }
    // Lấy phần tử input bằng ID
    var inputElement = document.getElementById('idLogin');



    if (inputElement == null || inputElement == "") {
        value = 0;
    }
    else {
        // Lấy giá trị của input
        var value = inputElement.value;
        value = inputElement.value;
    }

    // Lấy id từ cookie
    var id = getCookieValue("id");


    $scope.checkCourse = function (IdUser, id) {
        $http({
            method: 'GET',
            url: '/api/courseOnline/check/' + IdUser + '/' + id
        }).then(function (response) {
            $scope.check = response.data;
        }, function (response) {
            console.log(response);
            $scope.check = null;
        });
    }

    // Hàm để khởi tạo thông tin khóa học
    $scope.init = function () {
        // Gửi yêu cầu GET đến API với id lấy từ cookie
        $http({
            method: 'GET',
            url: '/api/courseOnline/detail/' + id
        }).then(function (response) {
            // Gán dữ liệu khóa học cho biến $scope.hoc
            $scope.hoc = response.data;
            idKhoaHoc = $scope.hoc.courseOnline.id;

            $scope.checkCourse(value, idKhoaHoc);


        }, function (response) {
            console.log(response);
        });

        // Lấy thông tin người dùng
        if (value != 0) {
            $http.get("/rest/admin/NguoiDung/" + value)
                .then(function (resp) {
                    idNguoiDung = resp.data.id;
                    console.log(idNguoiDung + " :id Người dùng");

                });
        }
        else {
            idNguoiDung = 0;
            $scope.check = null;
        }
    }
    $scope.getIdNguoiDung = function () {
        $http({
            method: 'GET',
            url: "/rest/admin/NguoiDung/" + value
        }).then(function (response) {
            // Gán dữ liệu người dùng cho biến $scope.idNguoiDung2
            $scope.idNguoiDung2 = response.data.id;
            $scope.TenNguoiDung = response.data.hoTen;

        }, function (response) {

        });
    };

    $scope.getid = function (id) {
        $window.sessionStorage.setItem('videoId', id);
        $window.location.href = '/courseOnline/video/' + id;
    }

    $scope.continueCourse = function (id) {
        $scope.getid(id);
    }

    $scope.addCourse = function (id) {
        if (value === 0) {
            console.log("Bạn chưa đăng nhập");
            window.location.href = 'http://localhost:8080/courseOnline/dangnhap';
        } else {
            $http({
                method: 'GET',
                url: '/api/Checkout/check/' + value + '/' + id
            }).then(function (response) {
                console.log(response.data);
                if (!response.data.trangThai) {
                    // Chưa thanh toán, chuyển hướng đến trang Checkout
                    window.location.href = '/courseOnline/CheckOut';
                } else {

                }
            }, function (response) {
                console.log(response);
            });
        }
    }


    // Gọi hàm init để khởi tạo thông tin khóa học
    $scope.init();
});
