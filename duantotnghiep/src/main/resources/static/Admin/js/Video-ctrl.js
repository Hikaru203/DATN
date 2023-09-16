var app = angular.module("myApp", ['ui.bootstrap']);
app.controller("Video-ctrl", function ($scope, $http, $window) {
    $scope.itemsVideoWithTen = []; // Mảng mới chứa tên video và dữ liệu video ban đầu
    $scope.itemsVideo = [];
    $scope.formTaiLieu = {};
    $scope.order = null;
    $scope.itemsKhoaHoc = [];
    $scope.formKhoaHoc = {};
    $scope.inputString = [];
    $scope.itemsNguoiDung = [];
    $scope.formVideo = {};

    $scope.currentPage = 1; // Trang hiện tại
    $scope.itemsPerPage = 5; // Số hàng trên mỗi trang
    $scope.totalItems = 0; // Tổng số tài liệu

    const accountTokenInput = document.getElementById("accessToken");
    const authorizationTokenGroup = document.getElementById('authorizationTokenGroup');
    const accessTokenGroup = document.getElementById('accessTokenGroup');
    const titleGroup = document.getElementById('form-title');
    const privacyStatusGroup = document.getElementById('form-privacyStatus');
    const descriptionGroup = document.getElementById('form-description');
    const fileGroup = document.getElementById('form-file');

    $scope.initialize = function () {
        // load tài liệu
        $http.get("/Admin/rest/Videos").then(resp => {
            $scope.itemsVideo = resp.data;
            console.log($scope.itemsVideo);

            // Lặp qua danh sách các video và gọi hàm getYouTubeVideoTitle để lấy tên video
            for (let i = 0; i < $scope.itemsVideo.length; i++) {
                const video = $scope.itemsVideo[i];
                const url = 'v=' + video.linkVideo;
                if (url.includes('v=')) {
                    // Tách chuỗi sau 'v=' để lấy mã video
                    const videoId = url.split('v=')[1].split('&')[0];

                    // Xây dựng URL API YouTube Data
                    const apiUrl = `https://www.googleapis.com/youtube/v3/videos?id=${videoId}&part=snippet&key=AIzaSyB62JPnQ_NP6xp7pbf5WDb4kVJcP1yMT08`;

                    // Gửi yêu cầu AJAX (cần sử dụng API key của bạn)
                    // Hoặc bạn có thể sử dụng thư viện AJAX như Axios hoặc Fetch API.
                    // Sau đó, bạn có thể trích xuất tên video từ dữ liệu phản hồi.
                    // Ví dụ sử dụng Fetch API:
                    fetch(apiUrl)
                        .then(response => response.json())
                        .then(data => {
                            const videoTitle = data.items[0].snippet.title;
                            $scope.itemsVideoWithTen.push({
                                videoData: video,
                                videoTitle: videoTitle // Tên video từ API YouTube
                            });
                            console.log($scope.itemsVideoWithTen);
                        })
                        .catch(error => {
                            console.error('Lỗi khi lấy thông tin video: ' + error);
                        });
                } else {
                    console.error('Không tìm thấy mã video trong URL.');
                }
            }
        }).catch(error => {
            console.error("An error occurred:", error);
        });

        $http.get("/Admin/rest/KhoaHoc").then(resp => {
            $scope.itemsKhoaHoc = resp.data;
        });
    };

    $scope.loadDocuments = function () {
        if ($scope.selectedCourse) {
            $http.get("/Admin/rest/Videos/" + $scope.selectedCourse).then(resp => {
                $scope.itemsVideo = resp.data;
                $scope.totalItems = $scope.itemsVideo.length;
                $scope.order = $scope.itemsVideo.length
                console.log($scope.order);
            });
        } else {
            $http.get("/Admin/rest/Videos").then(resp => {
                $scope.itemsVideo = resp.data;
                $scope.totalItems = $scope.itemsVideo.length;
                $scope.order = null; // Đặt giá trị order thành null nếu không có selectedCourse hoặc itemsVideo

            });
        }
    };


    console.log($scope.itemsVideoWithTen);
    console.log($scope.itemsVideo);


    $scope.updateUI = function () {
        if (accountTokenInput === null || accountTokenInput.value === '' || accountTokenInput.value === null) {
            // Hiển thị các input khi accountToken không tồn tại hoặc trống
            authorizationTokenGroup.style.display = 'block';
            accessTokenGroup.style.display = 'block';
            titleGroup.style.display = 'none';
            privacyStatusGroup.style.display = 'none';
            descriptionGroup.style.display = 'none';
            fileGroup.style.display = 'none';
        } else {
            // Ẩn các input khi accountToken có giá trị
            authorizationTokenGroup.style.display = 'none';
            accessTokenGroup.style.display = 'none';
            titleGroup.style.display = 'block';
            privacyStatusGroup.style.display = 'block';
            descriptionGroup.style.display = 'block';
            fileGroup.style.display = 'block';
        }
    }

    function getYoutubeVideoId(youtubeLink) {
        // Biểu thức chính quy để trích xuất ID video từ liên kết YouTube
        const regExp = /^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|&v=)([^#&?]*).*/;
        const match = youtubeLink.match(regExp);

        if (match && match[1]) {
            return match[1];
        } else {
            return null; // Trả về null nếu không tìm thấy ID video
        }
    }
    $scope.create = function () {
        const selectedCourseId = $scope.selectedCourse;
        const youtubeLink = document.getElementById("youtubeLink").value; // Lấy giá trị từ trường nhập liệu

        if (!selectedCourseId) {
            alert("Vui lòng chọn một khóa học.");
            return;
        }

        if (!youtubeLink.trim()) {
            alert("Vui lòng nhập liên kết video từ YouTube.");
            return;
        }

        const videoId = getYoutubeVideoId(youtubeLink); // Lấy ID video từ liên kết

        if (!videoId) {
            alert("Không thể trích xuất ID video từ liên kết YouTube.");
            return;
        }

        // Gọi API GET để lấy thông tin khóa học
        $http.get(`/Admin/rest/KhoaHoc/${selectedCourseId}`)
            .then(resp => {
                // Gán thông tin khóa học cho formVideo
                $scope.formVideo.khoaHoc = resp.data;

                // Gán ID video từ liên kết vào formVideo
                $scope.formVideo.linkVideo = videoId;

                $scope.formVideo.thuTu = $scope.order + 1;
                console.log($scope.formVideo);

                // Sau khi gán xong, tiếp tục với POST request
                return $http.post(`/Admin/rest/Videos`, $scope.formVideo);
            })
            .then(resp => {
                // Gán lại thông tin khóa học (nếu cần)
                console.log("Success", resp);
                console.log($scope.formVideo);
                alert("Thêm mới thành công");
                $scope.loadDocuments();
            })
            .catch(error => {
                console.log("Error", error);
                alert("Thêm mới thất bại");
            });
    };




    $scope.updateUI();
    $scope.initialize();
});

document.addEventListener("DOMContentLoaded", function () {
    const uploadNewVideoSection = document.getElementById("uploadNewVideoSection");
    const addButton = document.getElementById("addButton");

    if (!uploadNewVideoSection || !addButton) {
        console.error("Không thể tìm thấy các phần tử cần thiết.");
        return;
    }

    addButton.addEventListener("click", function () {
        if (uploadNewVideoSection.style.display !== "none") {
            // Lấy các giá trị từ các trường input
            const titleInput = document.getElementById("title");
            const descriptionInput = document.getElementById("description");
            const privacyStatusInput = document.getElementById("privacyStatus");
            const fileInput = document.getElementById("file");

            // Kiểm tra giá trị của từng trường input
            if (!titleInput.value) {
                alert("Vui lòng nhập tiêu đề.");
                return;
            }

            if (!descriptionInput.value) {
                alert("Vui lòng nhập mô tả.");
                return;
            }

            if (!privacyStatusInput.value) {
                alert("Vui lòng chọn quyền riêng tư.");
                return;
            }

            if (!fileInput.files[0]) {
                alert("Vui lòng chọn tệp video.");
                return;
            }
            // Tạo FormData và gửi POST request
            const form = new FormData();
            form.append("title", titleInput.value);
            form.append("description", descriptionInput.value);
            form.append("privacyStatus", privacyStatusInput.value);
            form.append("file", fileInput.files[0]);
            fetch("/youtube/uploadVideo", {
                method: "POST",
                body: form
            })
                .then(response => {
                    if (response.ok) {
                        const scope = angular.element(document.querySelector('[ng-controller="Video-ctrl"]')).scope();
                        scope.$apply(function () {
                            scope.create();
                        });

                        alert("Đã gửi form thành công.");
                        return response.json(); // Chuyển đổi phản hồi sang đối tượng JSON
                    } else {
                        alert("Đã xảy ra lỗi khi gửi form.");
                    }
                })

                .catch(error => {
                    console.error("Lỗi: " + error);
                });

        } else {
            const scope = angular.element(document.querySelector('[ng-controller="Video-ctrl"]')).scope();
            scope.$apply(function () {
                scope.create();
            });
        }
    });
});


function addFunction() {
    alert("Thêm thành công");
}
document.addEventListener("DOMContentLoaded", function () {
    const fileInput = document.getElementById("file");
    const youtubeLinkInput = document.getElementById("youtubeLink");
    const showYouTubeVideoButton = document.getElementById("showYouTubeVideo");
    const youtubeVideoContainer = document.getElementById("youtubeVideoContainer");

    fileInput.addEventListener("change", function () {
        const selectedFile = fileInput.files[0];

        if (selectedFile) {
            // Kiểm tra nếu tệp đã chọn có đúng định dạng .mp4
            if (selectedFile.type === "video/mp4") {
                const objectURL = URL.createObjectURL(selectedFile);
                videoPlayer.src = objectURL;
                youtubeVideoContainer.style.display = "none"; // Ẩn video YouTube
            } else {
                // Hiển thị thông báo lỗi nếu tệp không phải là .mp4
                alert("Chỉ hỗ trợ tệp .mp4");
                fileInput.value = ""; // Xóa tệp đã chọn
            }
        } else {
            // Nếu không có tệp được chọn, hiển thị video từ YouTube
            videoPlayer.src = "";
        }
    });

    showYouTubeVideoButton.addEventListener("click", function () {
        const youtubeLink = youtubeLinkInput.value;

        // Kiểm tra xem liên kết có chứa "youtube.com" không
        if (youtubeLink.includes("youtube.com")) {
            // Trích xuất mã video từ liên kết
            const videoId = getYoutubeVideoId(youtubeLink);

            if (videoId) {
                // Tạo liên kết nhúng từ mã video
                const youtubeEmbedCode = `https://www.youtube.com/embed/${videoId}`;
                videoPlayer.src = youtubeEmbedCode;
                youtubeVideoContainer.style.display = "block"; // Hiển thị container video YouTube
            } else {
                // Hiển thị thông báo lỗi nếu không thể trích xuất mã video
                alert("Không thể trích xuất mã video từ liên kết");
            }
        } else {
            // Hiển thị thông báo lỗi nếu liên kết không hợp lệ
            alert("Liên kết YouTube không hợp lệ");
        }
    });

    // Hàm để trích xuất mã video từ liên kết YouTube
    function getYoutubeVideoId(url) {
        const regex = /[?&]v=([^&#]+)/;
        const match = url.match(regex);
        return match && match[1];
    }
});
document.addEventListener("DOMContentLoaded", function () {
    const uploadNewVideoRadio = document.getElementById("uploadNewVideo");
    const useExistingVideoRadio = document.getElementById("useExistingVideo");
    const uploadNewVideoSection = document.getElementById("uploadNewVideoSection");
    const useExistingVideoSection = document.getElementById("useExistingVideoSection");
    const titleInput = document.getElementById("title");
    const descriptionInput = document.getElementById("description");
    const privacyStatusSelect = document.getElementById("privacyStatus");
    const fileInput = document.getElementById("file");
    const youtubeLinkInput = document.getElementById("youtubeLink");

    useExistingVideoSection.style.display = "none";

    uploadNewVideoRadio.addEventListener("change", function () {
        // Hiển thị phần tải lên video mới và ẩn phần nhập liên kết YouTube
        uploadNewVideoSection.style.display = "block";
        useExistingVideoSection.style.display = "none";
        // Xóa hết dữ liệu trong các input
        privacyStatusSelect.selectedIndex = 0; // Đặt lại select box về option đầu tiên
        youtubeLinkInput.value = "";
        titleInput.value = "";
        descriptionInput.value = "";
        youtubeLinkInput.value = "";
    });

    useExistingVideoRadio.addEventListener("change", function () {
        // Hiển thị phần nhập liên kết YouTube và ẩn phần tải lên video mới
        uploadNewVideoSection.style.display = "none";
        useExistingVideoSection.style.display = "block";
        // Xóa hết dữ liệu trong các input
        youtubeLinkInput.value = "";
        titleInput.value = "";
        descriptionInput.value = "";
        privacyStatusSelect.selectedIndex = 0; // Đặt lại select box về option đầu tiên
    });
});
