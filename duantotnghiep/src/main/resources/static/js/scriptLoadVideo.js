const app = angular.module('loadVideo-app', ['ngCookies']);
const videoPlaylist = document.querySelector('.video-playlist .videos');
let videoIframe;

app.controller("loadVideo-app-ctrl", ['$scope', '$http', '$cookies', '$window', function ($scope, $http, $cookies, $window) {
    $scope.items = [];

    $scope.getid = function (id) {
        $window.sessionStorage.setItem('videoId', id);
        $window.location.href = '/courseOnline/video';
    }

    function setupVideoEvents($scope) {
        // Loại bỏ sự kiện click trên các phần tử video
        let videos = document.querySelectorAll('.video');
        videos.forEach(selected_video => {
            selected_video.onclick = null;
        });
    }

    function changeVideo(selected_video, videos, $scope) {
        videos.forEach(video => {
            video.classList.remove('active');
            video.querySelector('img').src = '/img/play.svg';
        });

        selected_video.classList.add('active');
        selected_video.querySelector('img').src = '/img/pause.svg';

        let match_video = $scope.data.find(video => video.id == selected_video.dataset.id);
        if (match_video) {
            videoIframe.src = 'https://www.youtube-nocookie.com/embed/' + match_video.linkVideo + "?modestbranding=1&controls=0&disablekb=1&origin=http://localhost:8080";
            videoIframe.setAttribute("frameborder", "0");
            // Cấu hình quyền cho iframe
            videoIframe.setAttribute("allow", "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share");

            // Ẩn nút copy link bằng cách ẩn phần tử với class hoặc ID cụ thể (ví dụ: class="copy-link-button")
            var copyLinkButton = videoIframe.contentDocument.querySelector(".ytp-copylink-button");
            console.log(videoIframe);
            if (copyLinkButton) {
                copyLinkButton.style.display = "none";
            }
            videoIframe.setAttribute("allowfullscreen", "");
            videoIframe.title = match_video.mucLuc.khoaHoc.tenKhoaHoc;
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

    $scope.loadvideo = function () {
        var storedId = $window.sessionStorage.getItem('videoId');
        var url = `/rest/loadVideo/get-video-id/${storedId}`;
        $http.get(url).then(response => {
            $scope.data = response.data;
            console.log($scope.data);

            videoPlaylist.innerHTML = ''; // Clear the playlist before adding new videos

            $scope.data.forEach((video, i) => {
                console.log(video);
                let video_element = `
                    <div class="video" data-id="${video.id}" data-disabled="true">
                        <img src="/img/play.svg" alt="">
                        <p>${i + 1 > 9 ? i + 1 : '0' + (i + 1)}. </p>
                        <h3 class="title">${video.tenVideo}</h3>
                    </div>
                `;
                videoPlaylist.innerHTML += video_element;
            });


            let videos = document.querySelectorAll('.video');
            setupVideoEvents($scope);
            loadFirstVideo(videos, $scope);
        }).catch(error => {
            console.error(error);
        });
    }

    const nextVideoButton = document.getElementById('next-video');
    const prevVideoButton = document.getElementById('prev-video');
    let currentIndex = 0;

    nextVideoButton.addEventListener('click', function () {
        currentIndex++;
        if (currentIndex < $scope.data.length) {
            loadNextVideo();
        } else {
            // Chuyển đến trang trắc nghiệm khi ở video cuối cùng
            redirectToQuizPage();
        }
    });

    prevVideoButton.addEventListener('click', function () {
        currentIndex--;
        loadPrevVideo();
    });

    function loadNextVideo() {
        if (currentIndex < $scope.data.length) {
            const videos = document.querySelectorAll('.video');
            changeVideo(videos[currentIndex], videos, $scope);
        }
    }

    function loadPrevVideo() {
        if (currentIndex >= 0) {
            const videos = document.querySelectorAll('.video');
            changeVideo(videos[currentIndex], videos, $scope);
        }
    }

    function redirectToQuizPage() {
        // Thay đổi URL hoặc thực hiện hành động cụ thể để chuyển đến trang trắc nghiệm
        window.location.href = '/tracnghiem'; // Ví dụ: chuyển đến trang trắc nghiệm
    }

}]);

function onPageReady() {
    console.log("Page is ready");
    videoIframe = document.getElementById('video-iframe');
}

onPageReady();
