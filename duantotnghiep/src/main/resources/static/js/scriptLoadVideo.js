// JavaScript
const app = angular.module('loadVideo-app', ['ngCookies']);
const videoPlaylist = document.querySelector('.video-playlist .videos');
let player; // Thêm biến player cho YouTube Player API

app.controller("loadVideo-app-ctrl", ['$scope', '$http', '$cookies', '$window', function($scope, $http, $cookies, $window) {
    $scope.items = [];

    $scope.getid = function(id) {
        $window.sessionStorage.setItem('videoId', id);
        $window.location.href = '/courseOnline/video';
        // Chuyển đổi số nguyên thành chuỗi JSON
    }

    function changeVideo(selected_video, videos, $scope) {
        // Loại bỏ lớp active và đặt hình ảnh play cho tất cả video
        videos.forEach(video => {
            video.classList.remove('active');
            video.querySelector('img').src = '/img/play.svg';
        });

        // Đánh dấu video được chọn là active và đặt hình ảnh pause
        selected_video.classList.add('active');
        selected_video.querySelector('img').src = '/img/pause.svg';

        // Tìm video phù hợp theo id
        let match_video = $scope.data.find(video => video.id == selected_video.dataset.id);
        if (match_video) {
            // Kiểm tra xem biến player đã được khởi tạo chưa
            if (typeof player === 'undefined') {
                // Nếu chưa khởi tạo, thực hiện khởi tạo
                player = new YT.Player('video-player', {
					height: '500',
					width: '888',
					playerVars: {
						autoplay: 1,
						controls: 0,
						rel0: 1,
						showinfo: 0,
						disablekb: 1,
					},
					
				});
				console.log(player.playerInfo.apiInterface);
				
				
            }

            // Dừng trình phát hiện tại nếu có
            if (player.getPlayerState() === YT.PlayerState.PLAYING) {
                player.stopVideo();
            }

            // Phát video YouTube mới
            player.loadVideoById(match_video.linkVideo);

            // Đặt tiêu đề cho iframe (bạn có thể tùy chỉnh)
            player.setVideoTitle(match_video.mucLuc.khoaHoc.tenKhoaHoc);
        }
    }

    function setupVideoEvents($scope) {
        let videos = document.querySelectorAll('.video');

        videos.forEach(selected_video => {
            selected_video.onclick = () => {
                changeVideo(selected_video, videos, $scope);
            };
        });
    }

    function loadFirstVideo(videos, $scope) {
        if (videos.length > 0) {
            let firstVideo = videos[0];
            changeVideo(firstVideo, videos, $scope);
        }
    }

    // Trong hàm loadvideo
    $scope.loadvideo = function() {
        var storedId = $window.sessionStorage.getItem('videoId');
        var url = `/rest/loadVideo/get-video-id/${storedId}`;
        $http.get(url).then(response => {
            $scope.data = response.data; // Dữ liệu từ CSDL
            console.log($scope.data);

            // Rest of your code for rendering the video playlist
            $scope.data.forEach((video, i) => {
                console.log(video);
                let video_element = `
                    <div class="video" data-id="${video.id}">
                        <img src="/img/play.svg" alt="">
                        <p>${i + 1 > 9 ? i + 1 : '0' + (i + 1)}. </p>
                        <h3 class="title">${video.tenVideo}</h3>
                    </div>
                `;
                videoPlaylist.innerHTML += video_element;
            });

            let videos = document.querySelectorAll('.video');

            // Gọi hàm setupVideoEvents để gán sự kiện cho video
            setupVideoEvents($scope);

            // Gọi hàm loadFirstVideo để tự động tải video đầu tiên
            loadFirstVideo(videos, $scope);
        }).catch(error => {
            // Xử lý lỗi (nếu cần)
            console.error(error);
        });
    }
}]);

// Hàm này sẽ được gọi khi YouTube Player API đã sẵn sàng
function onYouTubeIframeAPIReady() {
    // Xác định rằng YouTube Player API đã sẵn sàng
    console.log("YouTube Player API is ready");
}

// Gọi hàm khởi tạo YouTube Player API
onYouTubeIframeAPIReady();
