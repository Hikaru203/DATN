const app = angular.module('loadVideo-app', ['ngCookies']);
const videoPlaylist = document.querySelector('.video-playlist .videos');
let videoIframe; // Thay đổi tên biến thành videoIframe

app.controller("loadVideo-app-ctrl", ['$scope', '$http', '$cookies', '$window', function ($scope, $http, $cookies, $window) {
    $scope.items = [];

    $scope.getid = function (id) {
        $window.sessionStorage.setItem('videoId', id);
        $window.location.href = '/courseOnline/video';
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
            videoIframe.src = 'https://www.youtube-nocookie.com/embed/' + match_video.linkVideo + "?si=2PvjDx-NPvHeAMR3&modestbranding=1&controls=0&disablekb=1";
            videoIframe.setAttribute("frameborder", "0");
            videoIframe.setAttribute("allow", "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share");
            videoIframe.setAttribute("allowfullscreen", "");
            videoIframe.title = match_video.khoaHoc.tenKhoaHoc;
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
                    <div class="video" data-id="${video.id}">
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
}]);

function onPageReady() {
    console.log("Page is ready");
    videoIframe = document.getElementById('video-iframe'); // Assign the iframe element
}

onPageReady();
