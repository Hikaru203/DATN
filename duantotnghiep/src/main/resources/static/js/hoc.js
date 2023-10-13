// Đăng ký module
var app = angular.module('detail-app', []);

app.controller('detail-controller', function ($scope, $http, $window) {

    $scope.DangKy = {};
    $scope.check = {};
    $scope.hoc = {};
    var idNguoiDung = null;
    var idKhoaHoc = null;
    // Hàm để lấy giá trị từ cookie bằng tên
    function getCookieValue(name) {
        var value = "; " + document.cookie;
        var parts = value.split("; " + name + "=");
        if (parts.length === 2)
            return parts.pop().split(";").shift();
    }

    // Lấy id từ cookie
    var id = getCookieValue("id");
    console.log(id);


    $scope.checkCourse = function (IdUser,id) {
        $http({
            method: 'GET',
            url: '/api/courseOnline/check/' + IdUser + '/' + id
        }).then(function (response) {
            $scope.check = response.data;
        }, function (response) {
            console.log(response);
            $scope.check=null;
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
            console.log($scope.hoc);
            $scope.checkCourse(1,idKhoaHoc);


        }, function (response) {
            console.log(response);
        });

        // Lấy thông tin người dùng
        $http.get("/Admin/rest/NguoiDung/1")
            .then(function (resp) {
                idNguoiDung = resp.data.id;
                console.log(idNguoiDung);
            });

    }

    $scope.getid = function(id) {
		$window.sessionStorage.setItem('videoId', id);
		$window.location.href = '/courseOnline/video';
		// Chuyển đổi số nguyên thành chuỗi JSON
	}

    $scope.continueCourse = function (id) {
        alert("Bạn đã đăng ký khóa học này rồi");
        console.log(id);
        $scope.getid(id);
    }

    $scope.addCourse = function (id) {
        console.log(id);
        $scope.check="";
        $scope.checkCourse(1,id);
        // Lấy thông tin người dùng
        $http.get("/Admin/rest/NguoiDung/1")
            .then(function (resp) {
                $scope.DangKy.nguoiDung = resp.data;
                $scope.DangKy.khoaHoc = $scope.hoc.courseOnline;
                $scope.DangKy.ngayDangKy = new Date();
                $scope.DangKy.tienDo = 0;
                $scope.DangKy.trangThai = 0;
                console.log($scope.DangKy);
                // Gửi POST request để đăng ký khóa học
                $http.post("/api/courseOnline", $scope.DangKy)
                    .then(function (response) {
                        $scope.init();
                        console.log(response);
                        $scope.getid(id);
                    }, function (response) {
                        console.log(response);
                    });
            });

    }

    // Gọi hàm init để khởi tạo thông tin khóa học
    $scope.init();
});