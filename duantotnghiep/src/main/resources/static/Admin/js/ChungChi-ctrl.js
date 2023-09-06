var app = angular.module("myApp", ['ui.bootstrap']);
app.controller("ChungChi-ctrl", function ($scope, $http, $window) {
    $scope.itemsChungChi = [];
    $scope.formTaiLieu = {};

    $scope.itemsKhoaHoc = [];
    $scope.formKhoaHoc = {};
    $scope.inputString = [];
    $scope.itemsNguoiDung = [];

    $scope.currentPage = 1; // Trang hiện tại
    $scope.itemsPerPage = 5; // Số hàng trên mỗi trang
    $scope.totalItems = 0; // Tổng số tài liệu

    $scope.initialize = function () {

        // load tài liệu
        $http.get("/rest/ChungChi").then(resp => {
            $scope.itemsChungChi = resp.data;
            console.log($scope.itemsChungChi);

            $scope.loadDocuments();

        }).catch(error => {
            console.error("An error occurred:", error);
        });

        $http.get("/rest/KhoaHoc").then(resp => {
            $scope.itemsKhoaHoc = resp.data;
            console.log($scope.itemsKhoaHoc);
        });

        $http.get("/rest/NguoiDung").then(resp => {
            $scope.itemsNguoiDung = resp.data;
            console.log($scope.itemsNguoiDung);
        });
    };

    // Khởi đầu
    $scope.initialize();

    $scope.loadDocuments = function () {
        var url = "/rest/ChungChi";

        if ($scope.selectedCourse && $scope.selectedUser) {
            url = "/rest/ChungChi/" + $scope.selectedCourse + "/" + $scope.selectedUser;
        } else if ($scope.selectedCourse) {
            url = "/rest/ChungChi/" + $scope.selectedCourse;
        } else if ($scope.selectedUser) {
            url = "/rest/ChungChi/nguoidung/" + $scope.selectedUser;
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
