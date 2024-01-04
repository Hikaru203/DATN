app.controller('DanhGia-BinhLuan-ctrl', function ($scope, $http, $window) {

    $scope.DanhGia = [];
    $scope.DanhGiaList = [];
    $scope.averageRating = 0;
    $scope.BinhLuan = []; // Danh sách bình luận
    $scope.BinhLuanList = [];
    $scope.DienDan = [];
    $scope.DienDanList = [];
    $scope.idDienDan = 0;
    $scope.DienDanThem = {};
    $scope.nguoiDang = {};
    $scope.BinhLuanThem = {};
    $scope.form = {};
    $scope.visibleComments = 3; // Số lượng bình luận ban đầu hiển thị


    // Lấy phần tử input bằng ID
    var inputElement = document.getElementById('idLogin');

    // Hàm để hiển thị thêm bình luận
    $scope.showMoreComments = function () {
        $scope.visibleComments += 3; // Tăng số lượng bình luận hiển thị lên 3
    };

    // Hàm để kiểm tra xem có cần hiển thị nút "Hiện thêm bình luận" hay không
    $scope.shouldShowMoreButton = function () {
        return $scope.BinhLuan.length > $scope.visibleComments;
    };

    if (inputElement == null || inputElement == "") {
        value = 0;
    }
    else {
        // Lấy giá trị của input
        var value = inputElement.value;
        value = inputElement.value;
    }
    function getCookieValue(name) {
        var value = "; " + document.cookie;
        var parts = value.split("; " + name + "=");
        if (parts.length === 2)
            return parts.pop().split(";").shift();
    }

    // Lấy id từ cookie
    var id = getCookieValue("id");

    // Hàm thêm một đánh giá vào danh sách
    $scope.add = function (danhGia) {
        $scope.DanhGia.push(danhGia);

        // Cập nhật số điểm đánh giá trung bình và số lượng đánh giá
        $scope.averageRating = 0;
        $scope.ratingCount = $scope.DanhGia.length;

        for (var i = 0; i < $scope.DanhGia.length; i++) {
            $scope.averageRating += $scope.DanhGia[i].soDiemDanhGia;
        }

        if ($scope.ratingCount > 0) {
            $scope.averageRating /= $scope.ratingCount;
        }
    }

    $scope.getStarsArray = function (averageRating) {
        var roundedRating = Math.round(averageRating); // Làm tròn giá trị
        return new Array(roundedRating);
    };

    $scope.NguoiDung = [];
    $scope.init = function () {
        $http.get('/rest/admin/NguoiDung/' + value)
            .then(function (response) {
                $scope.nguoiDang = response.data;
                console.log($scope.nguoiDang);
                $scope.NguoiDung = response.data;
            });


        $http.get('/api/danhgia')
            .then(function (response) {
                $scope.DanhGiaList = response.data;

                for (var i = 0; i < $scope.DanhGiaList.length; i++) {
                    if ($scope.DanhGiaList[i].khoaHoc.id == id) {
                        $scope.add($scope.DanhGiaList[i]);
                    }
                }

            });


        $http.get('/api/diendan')
            .then(function (response) {
                $scope.DienDanList = response.data;
                for (var i = 0; i < $scope.DienDanList.length; i++) {
                    if ($scope.DienDanList[i].khoaHoc.id == id) {
                        $scope.DienDan.push($scope.DienDanList[i]);
                        $scope.idDienDan = $scope.DienDanList[i].id;
                    }
                    console.log($scope.DienDan);

                    // Sử dụng hàm IIFE (Immediately Invoked Function Expression) để giữ giá trị của 'i'
                    (function (i) {
                        $http.get('/api/binhluan')
                            .then(function (response) {
                                $scope.BinhLuanList = response.data;
                                for (var j = 0; j < $scope.BinhLuanList.length; j++) {
                                    if ($scope.BinhLuanList[j].baiDang.id == $scope.DienDanList[i].id) {
                                        $scope.BinhLuan.push($scope.BinhLuanList[j]);
                                    }
                                }
                                console.log($scope.BinhLuan);
                            });
                    })(i);
                }
            });
    }

    $scope.init();


    $scope.createDienDan = function () {
        if (value === 0) {
            console.log("Bạn chưa đăng nhập");
            window.location.href = 'http://localhost:8080/courseOnline/dangnhap';
        } else {
            // Lấy thông tin khóa học
            $http.get('/rest/admin/KhoaHoc/' + id)
                .then(function (response) {
                    $scope.DienDanThem.khoaHoc = response.data;

                    // Lấy thông tin người dùng với ID 1 (có thể cần thay đổi ID này)
                    $http.get('/rest/admin/NguoiDung/' + value)
                        .then(function (response) {
                            $scope.DienDanThem.noiDung = $scope.noiDung;
                            $scope.DienDanThem.nguoiDang = response.data;
                            $scope.DienDanThem.ngayDang = new Date();
                            console.log($scope.DienDanThem);

                            // Gửi dữ liệu lên server
                            $http.post('/api/diendan', $scope.DienDanThem)
                                .then(function (response) {
                                    console.log(response);
                                    $scope.reset();
                                    $scope.init();
                                });
                        });
                });
        }
    }

    $scope.createBinhLuan = function (id) {
        if (value === 0) {
            console.log("Bạn chưa đăng nhập");
            window.location.href = 'http://localhost:8080/courseOnline/dangnhap';
        } else {
            // Lấy thông tin bài đăng
            $http.get('/api/diendan/' + id)
                .then(function (response) {
                    dienDan = response.data;
                    console.log(dienDan);
                    $http.get('/rest/admin/NguoiDung/' + value)
                        .then(function (response) {
                            $scope.BinhLuanThem.nguoiBinhLuan = response.data;
                            $scope.BinhLuanThem.noiDung = $scope.form.noiDung;
                            $scope.BinhLuanThem.baiDang = dienDan;
                            $scope.BinhLuanThem.ngayBinhLuan = new Date();
                            console.log($scope.BinhLuanThem);
                            $http.post('/api/binhluan', $scope.BinhLuanThem)
                                .then(function (response) {
                                    console.log(response);
                                    $scope.reset();
                                    $scope.init();
                                });
                        });
                });
            // Lấy thông tin người dùng với ID 1 (có thể cần thay đổi ID này)
        }
    }

    $scope.deleteDienDan = function (dienDan) {
        $scope.showSuccessMessage(
            "Xác nhận xóa bài đăng",
            "Bạn có chắc chắn muốn xóa bài đăng này?",
            function () {
                // Lấy danh sách bình luận liên quan đến bài đăng
                $http.get('/api/binhluan')
                    .then(function (response) {
                        $scope.BinhLuanList = response.data;
                        var deletePromises = [];

                        // Tạo một mảng các promise cho việc xóa bình luận
                        for (var j = 0; j < $scope.BinhLuanList.length; j++) {
                            if ($scope.BinhLuanList[j].baiDang.id === dienDan.id) {
                                deletePromises.push(
                                    $http.delete('/api/binhluan/' + $scope.BinhLuanList[j].id)
                                );
                            }
                        }

                        // Sử dụng Promise.all để chờ tất cả các promise hoàn thành
                        Promise.all(deletePromises)
                            .then(function (responses) {
                                console.log(responses); // In ra kết quả của việc xóa bình luận
                            })
                            .catch(function (error) {
                                console.error(error); // Xử lý lỗi nếu có
                            });

                        // Sau khi xóa bình luận, bạn có thể xóa diễn đàn ở đây
                        $http.delete('/api/diendan/' + dienDan.id)
                            .then(function (response) {
                                console.log(response);
                                $scope.reset();
                                $scope.init();
                            });
                    });
            },
            function () {
                // Hành động khi người dùng hủy bỏ
                console.log("Hủy bỏ xóa bài đăng");
                // Có thể thêm hành động khác nếu người dùng hủy bỏ xóa bài đăng
            }
        );
    };
    $scope.showSuccessMessage = function (title, message, onConfirm, onCancel) {
        Swal.fire({
            icon: 'question', // Thay đổi icon thành 'question' cho hiển thị biểu tượng suy nghĩ
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

    $scope.deleteBinhLuan = function (binhLuan) {
        $scope.showSuccessMessage(
            "Xác nhận xóa bình luận",
            "Bạn có chắc chắn muốn xóa bình luận này?",
            function () {
                $http.delete('/api/binhluan/' + binhLuan.id)
                    .then(function (response) {
                        console.log(response);
                        $scope.reset();
                        $scope.init();
                    });
            },
            function () {
                // Hành động khi người dùng hủy bỏ
                console.log("Hủy bỏ xóa bình luận");
                // Có thể thêm hành động khác nếu người dùng hủy bỏ xóa bình luận
            }
        );
    };


    $scope.reset = function () {
        $scope.DanhGiaList = [];
        $scope.DanhGia = [];
        $scope.BinhLuanList = [];
        $scope.BinhLuan = [];
        $scope.DienDanList = [];
        $scope.DienDan = [];
        $scope.noiDung = "";
        $scope.form = {};
    }

    $scope.showReplyInput = false; // Ban đầu ẩn input

    $scope.toggleReplyInput = function (dienDan) {
        // Khi bấm vào thẻ <a>, sẽ hiển thị/ẩn input
        dienDan.showReplyInput = !dienDan.showReplyInput;
    };

});
