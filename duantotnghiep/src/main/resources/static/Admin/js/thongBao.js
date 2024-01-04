app.controller("thongBaoCtrl", function ($scope, $http, $window, $interval) {
    $scope.notifications = []; // Khởi tạo notifications là một mảng rỗng ban đầu

    // Hàm lấy dữ liệu thông báo từ máy chủ
    function getNotifications() {
        var tempNotifications = []; // Tạo một mảng tạm thời

        $http.get("/rest/admin/NguoiDung").then(resp => {
            $scope.nguoiDung = resp.data;
            $scope.nguoiDung.forEach(user => {
                user.type = 'user';
                tempNotifications.push(user);
            });
        });

        $http.get("/api/tiendokhoahoc").then(resp => {
            $scope.dangKyKhoaHoc = resp.data;
            $scope.dangKyKhoaHoc.forEach(course => {
                course.type = 'course';
                tempNotifications.push(course);
            });
            updateNotifications(tempNotifications); // Gọi hàm cập nhật thông báo với dữ liệu tạm thời
        });
    }

    // Gọi hàm lấy dữ liệu thông báo ban đầu
    getNotifications();

    // Tự động cập nhật thông báo sau mỗi khoảng thời gian
    var pollingInterval = $interval(getNotifications, 1000); // 1 giây
    // Cập nhật thông báo mà không xóa và gán lại mảng notifications
    function updateNotifications(newNotifications) {
        // Xóa hết dữ liệu đầu trong notifications
        $scope.notifications = [];

        if (newNotifications.length > 0) { // Nếu có dữ liệu mới
            $scope.notifications = $scope.notifications.concat(newNotifications); // Nối dữ liệu mới vào mảng notifications
            processNotifications(); // Gọi hàm xử lý thông báo sau khi cập nhật dữ liệu mới
        }
    }

    // Xử lý thông báo
    // Xử lý thông báo khi có dữ liệu mới
    // Xử lý thông báo
    function processNotifications() {
        $scope.notifications.sort(function (a, b) {
            return new Date(b.thoiGianTao || b.ngayDangKy) - new Date(a.thoiGianTao || a.ngayDangKy);
        });

        $scope.notifications.forEach(notification => {
            notification.timeDifference = $scope.calculateTimeDifference(notification.thoiGianTao || notification.ngayDangKy);
        });
    }
    $scope.acceptRequest = function (notification) {
        if (notification.type === 'user') {
            $http.put(`/rest/admin/NguoiDung/update/${notification.id}`, notification).then(resp => {
                $scope.notifications.splice($scope.notifications.indexOf(notification), 1);
                console.log($scope.notifications);

                // Hiển thị thông báo thành công
                $scope.showSuccessMessage("Thành công", "Yêu cầu đã được duyệt thành công!");
            });
        }
    };
    // Tính thời gian chênh lệch
    $scope.calculateTimeDifference = function (thoiGianTao) {
        var thoiGianHienTai = new Date();
        var thoiGianChenhLech = thoiGianHienTai - new Date(thoiGianTao);

        var phutChenhLech = Math.floor(thoiGianChenhLech / (1000 * 60));
        var gioChenhLech = Math.floor(thoiGianChenhLech / (1000 * 60 * 60));
        var ngayChenhLech = Math.floor(thoiGianChenhLech / (1000 * 60 * 60 * 24));

        if (ngayChenhLech > 0) {
            return ngayChenhLech + (ngayChenhLech === 1 ? " ngày" : " ngày") + " trước";
        } else if (gioChenhLech > 0) {
            return gioChenhLech + (gioChenhLech === 1 ? " giờ" : " giờ") + " trước";
        } else if (phutChenhLech > 0) {
            return phutChenhLech + (phutChenhLech === 1 ? " phút" : " phút") + " trước";
        } else {
            return "Vừa xong";
        }
    };

    // Xóa interval khi $scope bị destroy (tránh leak memory)
    $scope.$on('$destroy', function () {
        if (angular.isDefined(pollingInterval)) {
            $interval.cancel(pollingInterval);
            pollingInterval = undefined;
        }
    });
    $scope.acceptRequestWithConfirmation = function (notification) {
        // Sử dụng SweetAlert2 để hiển thị thông báo xác nhận
        Swal.fire({
            title: 'Xác nhận duyệt yêu cầu',
            text: 'Bạn có chắc chắn muốn duyệt yêu cầu này?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Duyệt',
            cancelButtonText: 'Hủy',
        }).then((result) => {
            if (result.isConfirmed) {
                // Nếu người dùng xác nhận, thực hiện hành động duyệt ở đây
                $scope.acceptRequest(notification);
            }
        });
    };
    $scope.showSuccessMessage = function (title, message) {
        Swal.fire({
            icon: 'success',
            title: title,
            text: message,
            confirmButtonText: 'Đóng',
        });
    };
});
