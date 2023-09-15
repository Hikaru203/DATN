var app = angular.module("myApp", ['ui.bootstrap']);
app.controller("TaiLieu-ctrl", function ($scope, $http, $window) {
    $scope.itemsTaiLieu = [];
    $scope.formTaiLieu = {};

    $scope.itemsKhoaHoc = [];
    $scope.formKhoaHoc = {};

    $scope.currentPage = 1; // Trang hiện tại
    $scope.itemsPerPage = 5; // Số hàng trên mỗi trang
    $scope.totalItems = 0; // Tổng số tài liệu

    $scope.initialize = function () {
        // load tài liệu
        $http.get("/Admin/rest/TaiLieu").then(resp => {
            $scope.itemsTaiLieu = resp.data;
            $scope.totalItems = $scope.itemsTaiLieu.length;
            $scope.pageChanged(); // Hiển thị trang đầu tiên
        });

        $http.get("/Admin/rest/KhoaHoc").then(resp => {
            $scope.itemsKhoaHoc = resp.data;
        });
    };

    // Khởi đầu
    $scope.initialize();

    $scope.loadDocuments = function () {
        if ($scope.selectedCourse) {
            $http.get("/Admin/rest/TaiLieu/" + $scope.selectedCourse).then(resp => {
                $scope.itemsTaiLieu = resp.data;
                $scope.totalItems = $scope.itemsTaiLieu.length;
                $scope.pageChanged(); // Hiển thị trang đầu tiên
            });
        } else {
            $http.get("/Admin/rest/TaiLieu").then(resp => {
                $scope.itemsTaiLieu = resp.data;
                $scope.totalItems = $scope.itemsTaiLieu.length;
                $scope.pageChanged(); // Hiển thị trang đầu tiên
            });
        }
    };

    $scope.pageChanged = function () {
        var startIndex = ($scope.currentPage - 1) * $scope.itemsPerPage;
        var endIndex = startIndex + $scope.itemsPerPage;
        $scope.displayedItems = $scope.itemsTaiLieu.slice(startIndex, endIndex);
    };

    $scope.goToFirstPage = function () {
        $scope.currentPage = 1;
        $scope.pageChanged();
    };

    $scope.goToPreviousPage = function () {
        if ($scope.currentPage > 1) {
            $scope.currentPage--;
            $scope.pageChanged();
        }
    };

    $scope.goToNextPage = function () {
        if ($scope.currentPage < $scope.totalItems / $scope.itemsPerPage) {
            $scope.currentPage++;
            $scope.pageChanged();
        }
    };

    $scope.goToLastPage = function () {
        $scope.currentPage = Math.ceil($scope.totalItems / $scope.itemsPerPage);
        $scope.pageChanged();
    };


});
