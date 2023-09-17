var app = angular.module("myApp", ['ui.bootstrap']);
app.controller("ChungChi-ctrl", function ($scope, $http, $window) {
    $scope.itemsChungChi = [];
    $scope.formTaiLieu = {};

    $scope.itemsKhoaHoc = [];
    $scope.formKhoaHoc = {};
    $scope.inputString = [];
    $scope.itemsNguoiDung = [];
    $scope.select2ChosenText = ''; // Biến này lưu trữ nội dung của <span class='select2-chosen'>


    $scope.currentPage = 1; // Trang hiện tại
    $scope.itemsPerPage = 5; // Số hàng trên mỗi trang
    $scope.totalItems = 0; // Tổng số tài liệu

    $scope.initialize = function () {

        // load tài liệu
        $http.get("/Admin/rest/ChungChi").then(resp => {
            $scope.itemsChungChi = resp.data;
            console.log($scope.itemsChungChi);

            $scope.loadDocuments();

        }).catch(error => {
            console.error("An error occurred:", error);
        });

        $http.get("/Admin/rest/KhoaHoc").then(resp => {
            $scope.itemsKhoaHoc = resp.data;
            console.log($scope.itemsKhoaHoc);
        });

        $http.get("/Admin/rest/NguoiDung").then(resp => {
            $scope.itemsNguoiDung = resp.data;
            console.log($scope.itemsNguoiDung);
        });

    };
    $scope.$watch('select2ChosenText', function (newVal, oldVal) {
        // Xử lý sự kiện khi nội dung của <span class='select2-chosen'> thay đổi
        if (newVal !== oldVal) {
            loadDocuments();
        }
    });

    // Khởi đầu
    $scope.initialize();

    $scope.loadDocuments = function (data) {
        var url = "/Admin/rest/ChungChi";
        console.log(data);

        for (var i = 0; i < $scope.itemsNguoiDung.length; i++) { // Sửa điều kiện lặp
            if ($scope.itemsNguoiDung[i].hoTen == data.text.trim()) {
                $scope.selectedUser = $scope.itemsNguoiDung[i].id; // Gán selectedUser
                $scope.selectedCourse = null;
                console.log($scope.selectedUser);
                break;
            } else {
                $scope.selectedCourse = data.id;
                $scope.selectedUser = null;
            }
        }
        if ($scope.selectedUser !== null) {
            $scope.selectedUser = $scope.selectedUser;
        }
        if ($scope.selectedCourse !== null) {
            $scope.selectedCourse = $scope.selectedCourse;
        }

        if ($scope.selectedCourse && $scope.selectedUser) {
            console.log("1");
            url = "/Admin/rest/ChungChi/" + $scope.selectedCourse + "/" + $scope.selectedUser;
        } else if ($scope.selectedCourse) {
            url = "/Admin/rest/ChungChi/" + $scope.selectedCourse;
        } else if ($scope.selectedUser) {
            url = "/Admin/rest/ChungChi/nguoidung/" + $scope.selectedUser;
        }

        $http.get(url).then(function (resp) {
            $scope.itemsChungChi = resp.data;

            // Định dạng ngày tháng
            for (var i = 0; i < $scope.itemsChungChi.length; i++) {
                var rawDate = new Date($scope.itemsChungChi[i].ngayCap);
                var formattedDate = `${rawDate.getDate()}/${rawDate.getMonth() + 1}/${rawDate.getFullYear()}`;
                console.log(formattedDate);
                $scope.itemsChungChi[i].ngayCapFormatted = formattedDate;
            }

            $scope.totalItems = $scope.itemsChungChi.length;
        });
    };

    $scope.itemsChungChi = []; // Danh sách chứng chỉ
    $scope.currentIndex = 0; // Chỉ số hiện tại của chứng chỉ đang hiển thị

    $scope.changeCertificate = function (offset) {
        $scope.currentIndex += offset;
        $scope.currentIndex = Math.min(Math.max($scope.currentIndex, 0), $scope.itemsChungChi.length - 1);
    };


});
