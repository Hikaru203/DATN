var app = angular.module("myApp", []);
app.controller("KhoaHoc-ctrl", function ($scope, $http, $window) {
    $scope.itemsKhoaHoc = [];
    $scope.formKhoaHoc = {};
    $scope.courses = []; // Mảng để lưu trữ các khóa học
    $scope.initialize = function () {
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
        
        
    }

    // Khởi đầu
    $scope.initialize();
    

    //  // Thêm  mới 
    //  $scope.create = function () {
    //     $scope.newCourse.trangThai = "false";
    //     var currentDate = new Date();
    //     $scope.newCourse.ngayTao = currentDate ;
       
       

    //     console.log("mới thêm"+ $scope.newCourse.hinhAnh.name)

    //     $scope.newCourse.hinhAnh = $scope.newCourse.hinhAnh.name;

    //     var item = angular.copy($scope.newCourse);

    //     console.log("mới thêm2"+ $scope.newCourse.hinhAnh)
        
    //     $http.post('/rest/admin/KhoaHoc', item).then(resp => {
    //         $scope.itemsKhoaHoc.push(resp.data);
    //         alert("Thêm mới sản phẩm thành công!");
    //     }).catch(error => {
    //         alert("Lỗi thêm mới sản phẩm!");
    //         console.log("Error", error)
    //     })
    // }
    
    $scope.create = function () {
        $scope.newCourse.trangThai = "false";
        var currentDate = new Date();
        $scope.newCourse.ngayTao = currentDate;
        console.log("mới thêm"+ $scope.newCourse.hinhAnh.name)
        
        var formData = new FormData();
        formData.append('hinhAnh', $scope.newCourse.hinhAnh);
        $scope.newCourse.hinhAnh = $scope.newCourse.hinhAnh.name;
        formData.append('khoaHoc', new Blob([JSON.stringify($scope.newCourse)], { type: "application/json" }));
    
        $http.post('/rest/admin/KhoaHoc', formData, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            $scope.itemsKhoaHoc.push(resp.data);
            alert("Thêm mới sản phẩm thành công!");
        }).catch(error => {
            alert("Lỗi thêm mới sản phẩm!");
            console.log("Error", error)
        });
    }
})
app.directive('fileModel', ['$parse', function($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;

            element.bind('change', function() {
                scope.$apply(function() {
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);
// app.directive('fileModel', ['$parse', function($parse) {
//     return {
//         restrict: 'A',
//         link: function(scope, element, attrs) {
//             var model = $parse(attrs.fileModel);
//             var modelSetter = model.assign;

//             element.bind('change', function() {
//                 scope.$apply(function() {
//                     var formData = new FormData();
//                     formData.append('hinhAnh', element[0].files[0]);
//                     modelSetter(scope, formData);
//                 });
//             });
//         }
//     };
// }]);
