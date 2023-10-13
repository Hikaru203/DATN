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
    $scope.MucLuc = [];
    $scope.videoTitles = [];

    $scope.currentPage = 1;
    $scope.itemsPerPage = 5;
    $scope.totalItems = 0;
    $scope.selectedMucLuc = "";

    const accountTokenInput = document.getElementById("accessToken");
    const authorizationTokenGroup = document.getElementById('authorizationTokenGroup');
    const accessTokenGroup = document.getElementById('accessTokenGroup');
    const titleGroup = document.getElementById('form-title');
    const privacyStatusGroup = document.getElementById('form-privacyStatus');
    const descriptionGroup = document.getElementById('form-description');
    const fileGroup = document.getElementById('form-file');

    function getCookieValue(cookieName) {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            if (cookie.startsWith(cookieName + '=')) {
                return cookie.substring(cookieName.length + 1);
            }
        }
        return null;
    }

    function deleteCookie(cookieName) {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            if (cookie.startsWith(cookieName + '=')) {
                const cookieParts = cookie.split('=');
                const name = cookieParts[0];
                document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
                return;
            }
        }
    }

    $scope.initialize = function () {
        $http.get("/Admin/rest/Videos").then(resp => {
            $scope.itemsVideo = resp.data;
            $scope.totalItems = $scope.itemsVideo.length;
            $scope.pageChanged();
        }).catch(error => {
            console.error("An error occurred:", error);
        });

        $http.get("/Admin/rest/KhoaHoc").then(resp => {
            $scope.itemsKhoaHoc = resp.data;
        });
    };

    $scope.loadDocuments = function (course) {
        $scope.selectedCourse = course;

        $http.get("/Admin/rest/MucLuc/KhoaHoc/" + $scope.selectedCourse).then(resp => {
            $scope.MucLuc = resp.data;
        });

        if ($scope.selectedCourse) {
            $http.get("/Admin/rest/Videos/" + $scope.selectedCourse).then(resp => {
                $scope.itemsVideo = resp.data;
                $scope.totalItems = $scope.itemsVideo.length;
                $scope.order = $scope.itemsVideo.length;
                $scope.pageChanged();
            });
        } else {
            $http.get("/Admin/rest/Videos").then(resp => {
                $scope.itemsVideo = resp.data;
                $scope.totalItems = $scope.itemsVideo.length;
                $scope.pageChanged();
                $scope.order = null;
            });
        }
    };

    $scope.getSelectedMucLuc = function (selectedMucLuc) {
        $scope.selectedMucLuc = selectedMucLuc;
    };

    $scope.pageChanged = function () {
        var startIndex = ($scope.currentPage - 1) * $scope.itemsPerPage;
        var endIndex = startIndex + $scope.itemsPerPage;
        $scope.displayedItems = $scope.itemsVideo.slice(startIndex, endIndex);
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

    function getYoutubeVideoTitle(videoId, callback) {
        const apiUrl = `https://www.googleapis.com/youtube/v3/videos?part=snippet&id=${videoId}&key=YOUR_YOUTUBE_API_KEY`;

        $http.get(apiUrl)
            .then(resp => {
                if (resp.data.items && resp.data.items.length > 0) {
                    const videoTitle = resp.data.items[0].snippet.title;
                    callback(videoTitle);
                } else {
                    callback(null);
                }
            })
            .catch(error => {
                console.log("Error", error);
                callback(null);
            });
    };

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

        $http.get("/Admin/rest/MucLuc/" + $scope.selectedMucLuc)
            .then(resp => {
                $scope.formVideo.mucLuc = resp.data;
                $http.get("/Admin/rest/NguoiDung/" + 1)
                    .then(resp => {
                        $scope.formVideo.nguoiTao = resp.data;
                        $scope.formVideo.linkVideo = videoId;
                        $scope.formVideo.thuTu = $scope.order + 1;
                        var currentDate = new Date();
                        $scope.formVideo.ngayTao = currentDate.toISOString();
                        getYoutubeVideoTitle(videoId, function (videoTitle) {
                            if (videoTitle) {
                                $scope.formVideo.tenVideo = videoTitle;
                            } else {
                                alert("Không thể lấy được tiêu đề của video từ YouTube.");
                                return;
                            }
                            return $http.post(`/Admin/rest/Videos`, $scope.formVideo);
                        });
                    })
            })
            .then(resp => {
                alert("Thêm mới thành công");
                $scope.loadDocuments();
            })
            .catch(error => {
                console.log("Error", error);
                alert("Thêm mới thất bại");
            });
    };

    $scope.createNewVideo = function () {
        const selectedCourseId = $scope.selectedCourse;
        if (!selectedCourseId) {
            alert("Vui lòng chọn khóa học");
            return;
        }

        const usernameCookie = getCookieValue('videoId');
        const videoTitle = getCookieValue('videoTitle');
        $http.get("/Admin/rest/MucLuc/" + $scope.selectedMucLuc)
            .then(resp => {
                $scope.formVideo.mucLuc = resp.data;
                $http.get("/Admin/rest/NguoiDung/" + 1)
                    .then(resp => {
                        $scope.formVideo.nguoiTao = resp.data;
                        $scope.formVideo.linkVideo = usernameCookie;
                        $scope.formVideo.tenVideo = videoTitle;
                        $scope.formVideo.thuTu = $scope.order + 1;
                        var currentDate = new Date();
                        $scope.formVideo.ngayTao = currentDate.toISOString();
                        deleteCookie('videoId');
                        deleteCookie('videoTitle');
                        alert("Thêm mới thành công");
                        $scope.loadDocuments();
                        console.log($scope.formVideo);
                        $http.post(`/Admin/rest/Videos`, $scope.formVideo)
                            .then(resp => {
                            })
                            .catch(error => {
                                console.log("Error", error);
                                alert("Thêm mới thất bại");
                            });
                    })
                    .catch(error => {
                        console.log("Error", error);
                        alert("Thêm mới thất bại");
                    });
            })
            .catch(error => {
                console.log("Error", error);
                alert("Thêm mới thất bại");
            });
    };

    $scope.updateUI();
    $scope.initialize();

    $scope.itemsKhoaHoc = [];
    $scope.KhoaHocChon = null;
    $scope.showAllCourses = function () {
        $scope.KhoaHocChon = null;
        $scope.searchCourse = "";
        $scope.loadDocuments();
    };

    $scope.selectCourse = function (course) {
        $scope.KhoaHocChon = course;
        $scope.loadDocuments(course.id);
    };
});
