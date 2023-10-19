const app = angular.module('loadVideo-app', ['ngCookies']);
const videoPlaylist = document.querySelector('.video-playlist .videos');
let iframe; // Thay đổi tên biến thành iframe

app.controller("loadVideo-app-ctrl", ['$scope', '$http', '$cookies', '$window', function ($scope, $http, $cookies, $window) {
    $scope.items = [];

    $scope.getid = function (id) {
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
            // Kiểm tra xem biến iframe đã được khởi tạo chưa
            if (typeof iframe === 'undefined') {
                // Nếu chưa khởi tạo, thực hiện khởi tạo iframe
                iframe = document.createElement('iframe');
                iframe.width = '888';
                iframe.height = '500';
                iframe.frameborder = 0;
                iframe.allowfullscreen = 1;
                document.getElementById('video-container').appendChild(iframe);
            }

            // Thay đổi đường dẫn video thành www.youtube-nocookie.com
            const youtubeNocookieURL = match_video.linkVideo.replace('www.youtube.com', 'www.youtube-nocookie.com');

            // Cập nhật src của iframe
            iframe.src = youtubeNocookieURL;
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
    $scope.loadvideo = function () {
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

// Hàm này sẽ được gọi khi trang web đã sẵn sàng
function onPageReady() {
    // Xác định rằng trang web đã sẵn sàng
    console.log("Page is ready");
}

// Gọi hàm onPageReady khi trang web đã sẵn sàng
onPageReady();
