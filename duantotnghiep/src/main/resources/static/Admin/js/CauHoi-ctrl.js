var app = angular.module("myApp", ['ui.bootstrap']);
app.controller("CauHoi-ctrl", function ($scope, $http, $window) {
    $scope.itemsCauHoi = [];
    $scope.formTaiLieu = {};

    $scope.itemsKhoaHoc = [];
    $scope.formKhoaHoc = {};
    $scope.inputString = [];

    $scope.currentPage = 1; // Trang hiện tại
    $scope.itemsPerPage = 5; // Số hàng trên mỗi trang
    $scope.totalItems = 0; // Tổng số tài liệu

    $scope.initialize = function () {

        // load tài liệu
        $http.get("/rest/CauHoi").then(resp => {
            $scope.itemsCauHoi = resp.data;
            $scope.totalItems = $scope.itemsCauHoi.length;
            $scope.pageChanged(); // Hiển thị trang đầu tiên
            console.log($scope.itemsCauHoi);

            // Tạo mảng mới chứa thông tin câu hỏi, câu trả lời và mảng đáp án
            const questionAnswerArray = [];

            for (const item of $scope.itemsCauHoi) {
                if (item.cauTraLoi) {
                    const splitAnswers = item.cauTraLoi.split(',').map(answer => answer.trim());

                    // Tạo đối tượng chứa thông tin và đưa vào mảng mới
                    const questionObject = {
                        cauHoi: item.cauHoi,
                        cauTraLoi: splitAnswers,
                        dapAn: item.dapAn
                    };

                    questionAnswerArray.push(questionObject);
                } else {
                    console.log("'cauTraLoi' does not exist or has no value for an item.");
                }
            }

            console.log("Question and answer array:", questionAnswerArray);
        }).catch(error => {
            console.error("An error occurred:", error);
        });






        $http.get("/rest/KhoaHoc").then(resp => {
            $scope.itemsKhoaHoc = resp.data;
            console.log($scope.itemsKhoaHoc);
        });



    };

    // Khởi đầu
    $scope.initialize();

    $scope.loadDocuments = function () {
        if ($scope.selectedCourse) {
            $http.get("/rest/CauHoi/" + $scope.selectedCourse).then(resp => {
                $scope.itemsCauHoi = resp.data;
                $scope.totalItems = $scope.itemsCauHoi.length;
                $scope.pageChanged(); // Hiển thị trang đầu tiên
            });
        } else {
            $http.get("/rest/CauHoi").then(resp => {
                $scope.itemsCauHoi = resp.data;
                $scope.totalItems = $scope.itemsCauHoi.length;
                $scope.pageChanged(); // Hiển thị trang đầu tiên
            });
        }
    };

    $scope.pageChanged = function () {
        var startIndex = ($scope.currentPage - 1) * $scope.itemsPerPage;
        var endIndex = startIndex + $scope.itemsPerPage;
        $scope.displayedItems = $scope.itemsCauHoi.slice(startIndex, endIndex);
        console.log($scope.itemsCauHoi);
        console.log($scope.displayedItems);
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
