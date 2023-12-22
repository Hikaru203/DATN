// Đăng ký module
var app = angular.module('detail-app', []);

app.controller('detail-controller', function ($scope, $http, $window) {

    $scope.DangKy = {};
    $scope.check = {};
    $scope.hoc = {};
    $scope.chungChiList = {};
    $scope.idNguoiDung2 = {};
    $scope.TenNguoiDung = {};
    $scope.khoaHoc = {};
    var idNguoiDung = null;
    var idKhoaHoc = null;
    $scope.trangThai = null;
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

        $http({
            method: 'GET',
            url: '/api/tiendokhoahoc/' + IdUser + '/' + id
        }).then(function (response) {
            $scope.trangThai = response.data.trangThai;
        }, function (response) {
            console.log(response);
        });


    }
    $scope.slicedArray = {};
    $scope.remainingArray = {};
    $scope.videoDaXem = {};
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
            console.log($scope.hoc)
            $scope.hoc.dangKyKhoaHoc.forEach(function (khoaHoc) {
                if (value == khoaHoc.nguoiDung.id) {
                    $scope.videoDaXem = khoaHoc.tienDoToiDa;
                    console.log($scope.videoDaXem);
                }
            });

            // Tìm chỉ số của phần tử trong mảng có linkVideo tương đương với $scope.videoDaXem
            var index = $scope.hoc.videoKhoaHoc.findIndex(function (item) {
                return item.linkVideo === $scope.videoDaXem;
            });
            if (value == 0) {
                $scope.slicedArray = [];
            } else {
                if (index !== -1 && $scope.videoDaXem != null) {
                    // Lấy linkVideo từ phần tử cuối cùng của slicedArray
                    var linkVideoSlicedArray = $scope.hoc.videoKhoaHoc[index].linkVideo;
                    // Kiểm tra xem linkVideo của video đó có tương đương với tienDoToiDa hay không
                    if (linkVideoSlicedArray === $scope.videoDaXem) {
                        // Cắt chuỗi từ $scope.hoc.videoKhoaHoc đến linkVideoSlicedArray (tienDoToiDa)
                        if (Array.isArray($scope.hoc.videoKhoaHoc)) {
                            $scope.slicedArray = $scope.hoc.videoKhoaHoc.slice(0, index + 1); // Cắt mảng từ vị trí 0 đến index + 1

                            // In ra phần tử đã cắt
                            console.log($scope.slicedArray);

                            // In ra phần còn lại của mảng sau vị trí index + 1
                            $scope.remainingArray = $scope.hoc.videoKhoaHoc.slice(index + 1);
                            console.log($scope.remainingArray);
                        } else {
                            console.log("$scope.hoc.videoKhoaHoc không phải là một mảng.");
                        }

                    } else {
                        console.log("Không tìm thấy linkVideo tương đương với $scope.videoDaXem làm tienDoToiDa.");
                    }
                } else if ($scope.videoDaXem == null || $scope.videoDaXem == 0) {
                    $scope.slicedArray = [];
                } else {
                    console.log("Không tìm thấy linkVideo tương đương với $scope.videoDaXem trong mảng.");
                }
            }



            $scope.checkCourse(value, idKhoaHoc);
            $scope.showTaiLieu(idKhoaHoc);

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

        $http.get("/rest/ChungChi/" + id + '/' + value)
            .then(function (resp) {
                $scope.chungChiList = resp.data; // Lưu trữ mảng dữ liệu vào $scope.chungChiList

                for (var i = 0; i < $scope.chungChiList.length; i++) {
                    var rawDate = new Date($scope.chungChiList[i].ngayCap);
                    var formattedDate = `${rawDate.getDate()}/${rawDate.getMonth() + 1}/${rawDate.getFullYear()}`;
                    console.log(formattedDate);
                    $scope.chungChiList[i].ngayCapFormatted = formattedDate;
                }
            });


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

    $scope.getid2 = function (id, id2) {
        console.log(id);
        $window.location.href = '/courseOnline/video/' + id;
        $window.sessionStorage.setItem('khoaHocId', id);
        $window.sessionStorage.setItem('videoIdKhoaHoc', id2);
    }

    $scope.continueCourse = function (id) {
        $scope.getid(id);
        $window.location.href = '/courseOnline/video/' + id;
    }

    $scope.showTaiLieu = function (id) {
        $http.get("/rest/admin/TaiLieu/" + id)
            .then(function (resp) {
                $scope.tailieu = resp.data;
            });
    }

    $scope.baseFileURL = '/pdf/'; // Đường dẫn cơ sở tới thư mục chứa file

    $scope.downloadPDF = function (fileName, tentailieu) {
        var fileURL = $scope.baseFileURL + fileName;
        console.log(fileURL)
        fetch(fileURL)
            .then(response => response.blob())
            .then(blob => {
                saveAs(blob, tentailieu + '.pdf'); // Lưu file với tên tài liệu
            })
            .catch(error => {
                console.error('Lỗi khi tải file:', error);
                // Xử lý lỗi tại đây nếu cần thiết
            });
    };
    $scope.goToLoginForm = function () {
        // Chuyển hướng đến form đăng nhập
        window.location.href = '/courseOnline/dangnhap'; // Thay đổi đường dẫn tùy theo định dạng URL của bạn
    };

    $scope.showSuccessMessage = function (title, message, onConfirm, onCancel) {
        Swal.fire({
            icon: 'success',
            title: title,
            text: message,
            showCancelButton: true,
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy',
        }).then((result) => {
            if (result.isConfirmed && typeof onConfirm === 'function') {
                onConfirm(); // Gọi hàm callback khi người dùng xác nhận
            } else if (result.dismiss === Swal.DismissReason.cancel && typeof onCancel === 'function') {
                onCancel(); // Gọi hàm callback khi người dùng hủy
            }
        });
    };


    $scope.addCourse = function (id) {
        $http.get("/rest/admin/NguoiDung/" + value)
            .then(function (resp) {
                idNguoiDung = resp.data.id;
                console.log(idNguoiDung + " :id Người dùng");

            });

        var isLogin = document.getElementById("idLogin").value;
        if (isLogin == 'null') {
            console.log("Bạn chưa đăng nhập");
            window.location.href = 'http://localhost:8080/courseOnline/dangnhap';
        } else {
            $http.get("/rest/admin/KhoaHoc/" + id)
                .then(function (resp) {
                    idKhoaHoc = resp.data.id;
                    console.log(idKhoaHoc + " :id Khóa học");
                    $scope.khoaHoc = resp.data;

                    console.log($scope.khoaHoc.chiPhi);
                    $scope.showSuccessMessage("Thông báo", "Bạn có chắc muốn đăng ký khóa học?", function () {
                        // Thực hiện hành động khi người dùng xác nhận
                        console.log('Người dùng đã xác nhận');
                        // Thêm code của bạn tại đây
                        if ($scope.khoaHoc.chiPhi != 0) {
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
                        } else {
                            $http.get("/rest/admin/NguoiDung/" + value)
                                .then(function (resp) {
                                    $scope.DangKy.nguoiDung = resp.data;
                                    $scope.DangKy.khoaHoc = $scope.hoc.courseOnline;
                                    $scope.DangKy.ngayDangKy = new Date();
                                    $scope.DangKy.tienDo = 0;
                                    $scope.DangKy.trangThai = 0;
                                    $scope.DangKy.tienDoToiDa = 0;
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
                    }, function () {
                        // Thực hiện hành động khi người dùng hủy
                        console.log('Người dùng đã hủy');
                        // Thêm code của bạn tại đây
                    });

                });

        }
    }
    // Khai báo giá trị mặc định cho biến email
    $scope.email = 'giatri_email_macdinh';

    $scope.selectUser = function () {
        var idLoginElement = document.getElementById("idLogin");

        if (idLoginElement !== null) {
            $scope.idLogin = idLoginElement.value;

            if ($scope.idLogin !== null) {
                $http.get('/rest/admin/NguoiDung/' + $scope.idLogin)
                    .then(function (response) {
                        $scope.user = response.data;
                        console.log($scope.user);
                        $scope.name = $scope.user.hoTen;
                        $scope.email = $scope.user.email;
                    })
                    .catch(function (error) {
                        console.error('Lỗi khi gửi yêu cầu:', error);
                    });
            } else {
                console.log('Giá trị login là null. Không gọi $http.get.');
                // Thực hiện các hành động khác khi login là null nếu cần thiết
            }
        } else {
            console.log("Không tìm thấy phần tử có id là 'idLogin'");
            // Thực hiện xử lý khi phần tử không tồn tại trong DOM
        }
    };



    $scope.selectUser();
    // Gọi hàm init để khởi tạo thông tin khóa học
    $scope.init();
});
