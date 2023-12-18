// Trong file JavaScript của bạn
var app = angular.module("myApp", []);

app.controller("HocVienCtrl", function ($scope, $http) {
    $scope.itemsHocVien = [];

    $scope.initialize = function () {
        // Tải danh sách học viên từ API REST
        $http.get("/rest/admin/HocVien/HocVien").then(function (response) {
            $scope.itemsHocVien = response.data;
        });
    };
	
    // Khởi đầu
    $scope.initialize();

    $scope.pager = {
        page: 0,
        size: 5,
        get itemsHocVien() {
            var start = this.page * this.size;
            return $scope.itemsHocVien.slice(start, start + this.size);
        },

        get count() {
            return Math.ceil(1.0 * $scope.itemsHocVien.length / this.size);
        },

        first() {
            this.page = 0;
        },
        prev() {
            this.page--;
            if (this.page < 0) {
                this.last();
            }
        },
        next() {
            this.page++;
            if (this.page >= this.count) {
                this.first();
            }
        },
        last() {
            this.page = this.count - 1;
        }
    }
});
