var app = angular.module("myApp", ['ui.bootstrap']);
app.controller("Video-ctrl", function ($scope, $http, $window) {
    $scope.itemsVideoWithTen = [];
    $scope.itemsVideo = [];
    $scope.formTaiLieu = {};
    $scope.order = null;
    $scope.itemsKhoaHoc = [];
    $scope.formKhoaHoc = {};
    $scope.inputString = [];
    $scope.itemsNguoiDung = [];
    $scope.formVideo = {};

    $scope.currentPage = 1;
    $scope.itemsPerPage = 5;
    $scope.totalItems = 0;

    const accountTokenInput = document.getElementById("accessToken");
    const authorizationTokenGroup = document.getElementById('authorizationTokenGroup');
    const accessTokenGroup = document.getElementById('accessTokenGroup');
    const titleGroup = document.getElementById('form-title');
    const privacyStatusGroup = document.getElementById('form-privacyStatus');
    const descriptionGroup = document.getElementById('form-description');
    const fileGroup = document.getElementById('form-file');

    $scope.initialize = function () {
        $http.get("/Admin/rest/Videos").then(resp => {
            $scope.itemsVideo = resp.data;
            console.log($scope.itemsVideo);
            $scope.totalItems = $scope.itemsVideo.length;
            $scope.pageChanged(); // Hiển thị trang đầu tiên

            for (let i = 0; i < $scope.itemsVideo.length; i++) {
                const video = $scope.itemsVideo[i];
                const url = 'v=' + video.linkVideo;
                if (url.includes('v=')) {
                    const videoId = url.split('v=')[1].split('&')[0];
                    const apiUrl = `https://www.googleapis.com/youtube/v3/videos?id=${videoId}&part=snippet&key=AIzaSyB62JPnQ_NP6xp7pbf5WDb4kVJcP1yMT08`;

                    fetch(apiUrl)
                        .then(response => response.json())
                        .then(data => {
                            const videoTitle = data.items[0].snippet.title;
                            $scope.itemsVideoWithTen.push({
                                videoData: video,
                                videoTitle: videoTitle
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
                $scope.order = $scope.itemsVideo.length;
                $scope.pageChanged(); // Hiển thị trang đầu tiên

                console.log($scope.order);
            });
        } else {
            $http.get("/Admin/rest/Videos").then(resp => {
                $scope.itemsVideo = resp.data;
                $scope.totalItems = $scope.itemsVideo.length;
                $scope.pageChanged(); // Hiển thị trang đầu tiên
                $scope.order = null;
            });
        }
    };

    // Hàm xử lý phân trang
    $scope.pageChanged = function () {
        var startIndex = ($scope.currentPage - 1) * $scope.itemsPerPage;
        var endIndex = startIndex + $scope.itemsPerPage;
        $scope.displayedItems = $scope.itemsVideo.slice(startIndex, endIndex);
        console.log($scope.displayedItems);
        console.log($scope.itemsVideo);
        console.log($scope.totalItems);
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

    console.log($scope.itemsVideoWithTen);
    console.log($scope.itemsVideo);

    $scope.updateUI = function () {
        if (accountTokenInput === null || accountTokenInput.value === '' || accountTokenInput.value === null) {
            authorizationTokenGroup.style.display = 'block';
            accessTokenGroup.style.display = 'block';
            titleGroup.style.display = 'none';
            privacyStatusGroup.style.display = 'none';
            descriptionGroup.style.display = 'none';
            fileGroup.style.display = 'none';
        } else {
            authorizationTokenGroup.style.display = 'none';
            accessTokenGroup.style.display = 'none';
            titleGroup.style.display = 'block';
            privacyStatusGroup.style.display = 'block';
            descriptionGroup.style.display = 'block';
            fileGroup.style.display = 'block';
        }
    };

    function getYoutubeVideoId(youtubeLink) {
        const regExp = /^.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|&v=)([^#&?]*).*/;
        const match = youtubeLink.match(regExp);

        if (match && match[1]) {
            return match[1];
        } else {
            return null;
        }
    }

    $scope.create = function () {
        const selectedCourseId = $scope.selectedCourse;
        const youtubeLink = document.getElementById("youtubeLink").value;

        if (!selectedCourseId) {
            alert("Vui lòng chọn một khóa học.");
            return;
        }

        if (!youtubeLink.trim()) {
            alert("Vui lòng nhập liên kết video từ YouTube.");
            return;
        }

        const videoId = getYoutubeVideoId(youtubeLink);

        if (!videoId) {
            alert("Không thể trích xuất ID video từ liên kết YouTube.");
            return;
        }

        $http.get(`/Admin/rest/KhoaHoc/${selectedCourseId}`)
            .then(resp => {
                $scope.formVideo.khoaHoc = resp.data;
                $scope.formVideo.linkVideo = videoId;
                $scope.formVideo.thuTu = $scope.order + 1;
                console.log($scope.formVideo);
                return $http.post(`/Admin/rest/Videos`, $scope.formVideo);
            })
            .then(resp => {
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
            const titleInput = document.getElementById("title");
            const descriptionInput = document.getElementById("description");
            const privacyStatusInput = document.getElementById("privacyStatus");
            const fileInput = document.getElementById("file");

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

document.addEventListener("DOMContentLoaded", function () {
    const fileInput = document.getElementById("file");
    const youtubeLinkInput = document.getElementById("youtubeLink");
    const showYouTubeVideoButton = document.getElementById("showYouTubeVideo");
    const youtubeVideoContainer = document.getElementById("youtubeVideoContainer");

    fileInput.addEventListener("change", function () {
        const selectedFile = fileInput.files[0];

        if (selectedFile) {
            if (selectedFile.type === "video/mp4") {
                const objectURL = URL.createObjectURL(selectedFile);
                videoPlayer.src = objectURL;
                youtubeVideoContainer.style.display = "none";
            } else {
                alert("Chỉ hỗ trợ tệp .mp4");
                fileInput.value = "";
            }
        } else {
            videoPlayer.src = "";
        }
    });

    showYouTubeVideoButton.addEventListener("click", function () {
        const youtubeLink = youtubeLinkInput.value;

        if (youtubeLink.includes("youtube.com")) {
            const videoId = getYoutubeVideoId(youtubeLink);

            if (videoId) {
                const youtubeEmbedCode = `https://www.youtube.com/embed/${videoId}`;
                videoPlayer.src = youtubeEmbedCode;
                youtubeVideoContainer.style.display = "block";
            } else {
                alert("Không thể trích xuất mã video từ liên kết");
            }
        } else {
            alert("Liên kết YouTube không hợp lệ");
        }
    });

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
        uploadNewVideoSection.style.display = "block";
        useExistingVideoSection.style.display = "none";
        privacyStatusSelect.selectedIndex = 0;
        youtubeLinkInput.value = "";
        titleInput.value = "";
        descriptionInput.value = "";
        youtubeLinkInput.value = "";
    });

    useExistingVideoRadio.addEventListener("change", function () {
        uploadNewVideoSection.style.display = "none";
        useExistingVideoSection.style.display = "block";
        youtubeLinkInput.value = "";
        titleInput.value = "";
        descriptionInput.value = "";
        privacyStatusSelect.selectedIndex = 0;
    });
});
