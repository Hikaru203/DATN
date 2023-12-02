var app = angular.module("myApp", []);
app.controller("KhoaHoc-ctrl", function ($scope, $http, $window) {
    $scope.itemsKhoaHoc = [];
    $scope.itemsKenhKhoaHoc = [];
    $scope.formKhoaHoc = {};
    $scope.courses = []; // Mảng để lưu trữ các khóa học
    $scope.nguoiTao = [];
    $scope.btnThemKhoaHoc = true;
    $scope.btnSuaKhoaHoc = true;
    $scope.btnXoaKhoaHoc = true;

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
            $scope.btnThemKhoaHoc = true;
            $scope.btnSuaKhoaHoc = false;
            $scope.btnXoaKhoaHoc = false;
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
        // Xóa giá trị của input file
        var input = document.getElementById('imageInput');
        input.value = '';
        // Xóa nội dung của phần tử preview
        var preview = document.getElementById('preview');
        preview.innerHTML = '';

        // Hiển thị ảnh mặc định
        var preview = document.getElementById('preview');
        preview.innerHTML = '<img  src="/Admin/img/gallery.png" alt="Default Image" height="100px" width="100px">';

        $scope.btnThemKhoaHoc = true;
        $scope.btnSuaKhoaHoc = false;
        $scope.btnXoaKhoaHoc = false;
    }

    // Hiển thị lên formKhoaHoc
    $scope.editbr = function (item) {
        $scope.formKhoaHoc = angular.copy(item);
        
        let anh = $scope.formKhoaHoc.hinhAnh;
        var preview = document.getElementById('preview');
        preview.innerHTML = '<img  src="/Admin/img/'+ anh +'" alt="Default Image" height="324px" width="576px">';

        $scope.btnThemKhoaHoc = false;
        $scope.btnSuaKhoaHoc = true;
        $scope.btnXoaKhoaHoc = true;

        $(".nav-tabs button:eq(1)").tab('show');
    }    
    //Thêm mới
    $scope.create = function () {
        $scope.hassError = false;
        if ($scope.validate()) {
        //trạng thái hiển thị khoa học
        $scope.formKhoaHoc.trangThai = "false";

        $scope.formKhoaHoc.nguoiTao.id = $scope.nguoiTao.id;
        

        var currentDate = new Date();
        $scope.formKhoaHoc.ngayTao = currentDate;
        

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
            alert("Thêm mới thành công!");
        }).catch(error => {
            alert("Lỗi thêm mới!");
            console.log("Error", error)
        });
    }
    }
     // Xóa 
     $scope.deleteKhoaHoc = function (item) {
        $http.delete(`/rest/admin/KhoaHoc/${item.id}`).then(resp => {
            var index = $scope.itemsKhoaHoc.findIndex(
                p => p.id == item.id);
            $scope.itemsKhoaHoc.splice(index, 1);
            $scope.resetKhoaHoc();
            alert("Xóa  thành công!");
        })
            .catch(error => {
                alert("Lỗi xóa !");
            })
    }
     // Cập nhật 
     $scope.updateKhoaHoc = function () {
        var item = angular.copy($scope.formKhoaHoc);
        

        // Chuyển đổi định dạng của chuỗi ngày tháng
        $scope.formKhoaHoc.ngayTao = item.ngayTao;
        item.ngayTao = moment(item.ngayTao).utcOffset(7).format('YYYY-MM-DD');
        


        var formData = new FormData();

        formData.append('hinhAnh', $scope.formKhoaHoc.hinhAnh);
        $scope.formKhoaHoc.hinhAnh = $scope.formKhoaHoc.hinhAnh.name;

        formData.append('khoaHoc', new Blob([JSON.stringify($scope.formKhoaHoc)], { type: "application/json" }));

        $http.put(`/rest/admin/KhoaHoc/${item.id}`, formData, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            var index = $scope.itemsKhoaHoc.findIndex(
                p => p.id == item.id);
            $scope.itemsKhoaHoc[index] = item;

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
            alert("Cập nhật thành công!");
        })
        .catch(error => {
                alert("Lỗi cập nhật !");
                console.log("Error", error)
            })
           
        
    
}
    
     // Duyệt khóa học
     $scope.duyet = function (items) {
        var item = angular.copy(items);
        item.ngayTao = moment(item.ngayTao).utcOffset(7).format('YYYY-MM-DD');
        item.duyet = true;

        var formData = new FormData();

        formData.append('hinhAnh', item.hinhAnh);
        
    
        formData.append('khoaHoc', new Blob([JSON.stringify(item)], { type: "application/json" }));

        $http.put(`/rest/admin/KhoaHoc/${item.id}`, formData, {
            transformRequest: angular.identity,
            headers: { 'Content-Type': undefined }
        }).then(resp => {
            var index = $scope.itemsKhoaHoc.findIndex(
                p => p.id == item.id);
            $scope.itemsKhoaHoc[index] = item;

             // load kênh Khóa học
            $http.get("/rest/admin/KhoaHoc/Duyet").then(resp => {
                // Chuyển đổi ngày giờ sang múi giờ Việt Nam
                resp.data.forEach(item => {
                    item.ngayTao = moment(item.ngayTao).utcOffset(7).format('YYYY-MM-DD HH:mm:ss');
                });

                $scope.itemsKenhKhoaHoc = resp.data;
                $('#table').bootstrapTable('load', $scope.itemsKenhKhoaHoc);
            });
            alert("Duyệt thành công!");
        })
        .catch(error => {
                alert("Lỗi !");
                console.log("Error", error)
        })
}

 // Cập nhật trạng thái khóa học
 $scope.trangThaiKhoaHoc = function (items) {
    var item = angular.copy(items);
    item.ngayTao = moment(item.ngayTao).utcOffset(7).format('YYYY-MM-DD');
    
    if(item.trangThai == "true"){
        item.trangThai = "false";
    }
    else if(item.trangThai == "false"){
        item.trangThai = "true"; 
    }
    var formData = new FormData();

    formData.append('hinhAnh', $scope.formKhoaHoc.hinhAnh);
    $scope.formKhoaHoc.hinhAnh = $scope.formKhoaHoc.hinhAnh.name;

    formData.append('khoaHoc', new Blob([JSON.stringify(item)], { type: "application/json" }));

    
    $http.put(`/rest/admin/KhoaHoc/${item.id}`, formData, {
        transformRequest: angular.identity,
        headers: { 'Content-Type': undefined }
    }).then(resp => {
        var index = $scope.itemsKhoaHoc.findIndex(
            p => p.id == item.id);
        $scope.itemsKhoaHoc[index] = item;
        if(item.trangThai == "true"){
            alert("Mở khóa thành công!");
        }
        else if(item.trangThai == "false"){
            alert("Khóa thành công!");
        }
        
    })
    .catch(error => {
            alert("Lỗi !");
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

    //validate
    $scope.KhoaHocMessages = {
        id: "ID is required",
        nameNull: "Tên khóa học không được rỗng",
        hocPhiNull: "Học phí khóa học không được rỗng",
        hocPhiiNaN: "Học phí khóa học phải là số",
        hinhAnhNull: "Bạn chưa chọn ảnh cho khóa học",
        // ...
    };

    $scope.validate = function () {
        $scope.message1 = "";
        $scope.message2 = "";
        $scope.message3 = "";
        $scope.checkV = false;
        if ($scope.formKhoaHoc.tenKhoaHoc === undefined) {
            $scope.hassError = true;
            $scope.message1 = $scope.KhoaHocMessages.nameNull;
            $scope.checkV = true;
        }

        if ($scope.formKhoaHoc.chiPhi === undefined) {
            $scope.hassError = true;
            $scope.message2 = $scope.KhoaHocMessages.hocPhiNull;
            $scope.checkV = true;
        }
        if ($scope.formKhoaHoc.hinhAnh === undefined) {
            $scope.hassError = true;
            $scope.message3 = $scope.KhoaHocMessages.hinhAnhNull;
            $scope.checkV = true;
        }

        
        
        if ($scope.checkV === true) {
            return false;
        } else {
            return true;
        }

    }

    $scope.itemsVideoKhoaHoc = [];
    $scope.videoKhoaHoc = {};
    $scope.loadVideoKhoaHoc = function (item) {
        $http.get(`/rest/admin/Videos/${item.id}`).then(resp => {
            $scope.itemsVideoKhoaHoc = resp.data;
            let tieuDeVideo = "";
    angular.element(document.getElementById('tieude')).text(tieuDeVideo);
            let videoUrl = "";
            // Đặt thuộc tính src của video-iframe
    let videoIframe = document.getElementById('video-iframe');
    videoIframe.src = "https://www.youtube.com/embed/" + videoUrl;
        })
    }
    
// Hiển thị video
$scope.xem = function (item) {
    $scope.videoKhoaHoc = angular.copy(item);
    
    let videoUrl = $scope.videoKhoaHoc.linkVideo;
    let tieuDeVideo = $scope.videoKhoaHoc.tenVideo;
    angular.element(document.getElementById('tieude')).text(tieuDeVideo);
    // Đặt thuộc tính src của video-iframe
    let videoIframe = document.getElementById('video-iframe');
    videoIframe.src = "https://www.youtube.com/embed/" + videoUrl;
    $(".nav-tabs button:eq(1)").tab('show');
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



