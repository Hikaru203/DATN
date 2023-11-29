var app = angular.module("myApp", []);
app.controller("KhoaHoc-ctrl", function ($scope, $http, $window) {
    $scope.itemsKhoaHoc = [];
    $scope.itemsKenhKhoaHoc = [];
    $scope.formKhoaHoc = {};
    $scope.courses = []; // Mảng để lưu trữ các khóa học
    $scope.nguoiTao = [];
    $scope.initialize = function () {
        // load thông tin người dùng từ session
        $http.get("/rest/admin/KhoaHoc/getUserInfo").then(response => {
            // Dùng thông tin người dùng ở đây
            console.log(response.data +"tên2")
            
            $scope.nguoiTao =response.data ;
            $scope.formKhoaHoc = {
                nguoiTao:{
                    id: $scope.nguoiTao.id
                }
                
            } 
        });

        // load Khóa học
        $http.get("/rest/admin/KhoaHoc").then(resp => {
            // Chuyển đổi ngày giờ sang múi giờ Việt Nam
            resp.data.forEach(item => {
                item.ngayTao = moment(item.ngayTao).utcOffset(7).format('YYYY-MM-DD HH:mm:ss');
            });

            $scope.itemsKhoaHoc = resp.data;
            console.log($scope.itemsKhoaHoc)
            $('#table').bootstrapTable('load', $scope.itemsKhoaHoc);
        });

        // load kênh Khóa học
        $http.get("/rest/admin/KhoaHoc/Duyet").then(resp => {
            // Chuyển đổi ngày giờ sang múi giờ Việt Nam
            resp.data.forEach(item => {
                item.ngayTao = moment(item.ngayTao).utcOffset(7).format('YYYY-MM-DD HH:mm:ss');
            });

            $scope.itemsKenhKhoaHoc = resp.data;
            console.log($scope.itemsKenhKhoaHoc)
            $('#table').bootstrapTable('load', $scope.itemsKenhKhoaHoc);
        });
    }

    // Khởi đầu
    $scope.initialize();

    // Xóa formKhoaHoc
    $scope.resetKhoaHoc = function () {
        $scope.formKhoaHoc = {};
    }

    // Hiển thị lên formKhoaHoc
    $scope.editbr = function (item) {
        $scope.formKhoaHoc = angular.copy(item);
        $(".nav-tabs button:eq(1)").tab('show');
    }    
    //Thêm mới
    $scope.create = function () {
        $scope.formKhoaHoc.trangThai = "false";  
        $scope.formKhoaHoc.nguoiTao.id = $scope.nguoiTao.id;
        console.log($scope.formKhoaHoc.nguoiTao.id +" ID")
        var currentDate = new Date();
        $scope.formKhoaHoc.ngayTao = currentDate;
        console.log("mới thêm" + $scope.formKhoaHoc.hinhAnh.name)

        var formData = new FormData();
        formData.append('hinhAnh', $scope.formKhoaHoc.hinhAnh);
        $scope.formKhoaHoc.hinhAnh = $scope.formKhoaHoc.hinhAnh.name;
        
        formData.append('khoaHoc', new Blob([JSON.stringify($scope.formKhoaHoc)], { type: "application/json" }));

        $http.post('/rest/admin/KhoaHoc', formData, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            $scope.itemsKhoaHoc.push(resp.data);
             // load Khóa học
        $http.get("/rest/admin/KhoaHoc").then(resp => {
            // Chuyển đổi ngày giờ sang múi giờ Việt Nam
            resp.data.forEach(item => {
                item.ngayTao = moment(item.ngayTao).utcOffset(7).format('YYYY-MM-DD HH:mm:ss');
            });

            $scope.itemsKhoaHoc = resp.data;
            console.log($scope.itemsKhoaHoc)
            $('#table').bootstrapTable('load', $scope.itemsKhoaHoc);
        });
            $scope.resetKhoaHoc();
            alert("Thêm mới sản phẩm thành công!");
        }).catch(error => {
            alert("Lỗi thêm mới sản phẩm!");
            console.log("Error", error)
        });
    }
     // Xóa 
     $scope.deleteKhoaHoc = function (item) {
        $http.delete(`/rest/admin/KhoaHoc/${item.id}`).then(resp => {
            var index = $scope.itemsKhoaHoc.findIndex(
                p => p.id == item.id);
            $scope.itemsKhoaHoc.splice(index, 1);
            $scope.resetKhoaHoc();
            alert("Xóa sản phẩm thành công!");
        })
            .catch(error => {
                alert("Lỗi xóa sản phẩm!");
            })
    }
     // Cập nhật 
     $scope.updateKhoaHoc = function () {
        var item = angular.copy($scope.formKhoaHoc);
        item.ngayTao = moment(item.ngayTao).utcOffset(7).format('YYYY-MM-DD');
        $http.put(`/rest/admin/KhoaHoc/${item.id}`, item).then(resp => {
            var index = $scope.itemsKhoaHoc.findIndex(
                p => p.id == item.id);
            $scope.itemsKhoaHoc[index] = item;
            alert("Cập nhật sản phẩm thành công!");
        })
        .catch(error => {
                alert("Lỗi cập nhật sản phẩm!");
                console.log("Error", error)
            })
    
}
    
     // Duyệt khóa học
     $scope.duyet = function (items) {
        var item = angular.copy(items);
        item.ngayTao = moment(item.ngayTao).utcOffset(7).format('YYYY-MM-DD');
        item.duyet = true;
        $http.put(`/rest/admin/KhoaHoc/${item.id}`, item).then(resp => {
            var index = $scope.itemsKenhKhoaHoc.findIndex(
                p => p.id == item.id);
            $scope.itemsKenhKhoaHoc[index] = item;
            alert("Cập nhật sản phẩm thành công!");
        })
        .catch(error => {
                alert("Lỗi cập nhật sản phẩm!");
                console.log("Error", error)
            })
    
}


    $scope.pager = {
        page: 0,
        size: 5,
        get itemsKhoaHoc() {
            var start = this.page * this.size;
            return $scope.itemsKhoaHoc.slice(start, start + this.size);
        },

        get count() {
            return Math.ceil(1.0 * $scope.itemsKhoaHoc.length / this.size);
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
//Chuyển trang kênh khóa học
    $scope.trang = {
        page: 0,
        size: 5,
        get itemsKenhKhoaHoc() {
            var start = this.page * this.size;
            return $scope.itemsKenhKhoaHoc.slice(start, start + this.size);
        },

        get count() {
            return Math.ceil(1.0 * $scope.itemsKenhKhoaHoc.length / this.size);
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

})
app.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function (scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;

            element.bind('change', function () {
                scope.$apply(function () {
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);
