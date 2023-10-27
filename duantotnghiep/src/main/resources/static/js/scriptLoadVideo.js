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

    let intervalIds = {}; // Đối tượng lưu trữ intervalId cho từng video

    function changeVideo(selected_video, videos, $scope) {
        // Xóa thông tin video cũ
        videos.forEach(video => {
            video.classList.remove('active');
            video.querySelector('img').src = '/img/play.svg';
            clearInterval(intervalIds[video.dataset.id]); // Xóa intervalId của video cũ
        });
        time_elapsed = 0;
        // Hiển thị video mới
        selected_video.classList.add('active');
        selected_video.querySelector('img').src = '/img/pause.svg';

        let match_video = $scope.data.find(video => video.id == selected_video.dataset.id);
        if (match_video) {
            videoIframe.src = 'https://www.youtube-nocookie.com/embed/' + match_video.linkVideo + "?modestbranding=1&disablekb=1&origin=http://localhost:8080&enablejsapi=1";
            videoIframe.setAttribute("allow", "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture");
            videoIframe.setAttribute("allowfullscreen", "");
            videoIframe.onload = function () {
                let player = new YT.Player(videoIframe, {
                    events: {
                        'onStateChange': function (event) {
                            onPlayerStateChange(event, match_video.linkVideo, player); // Truyền id của video vào hàm onPlayerStateChange
                        },
                        'onReady': function (event) {
                            event.target.playVideo();
                        }
                    }
                });
            }
        }
    }

    function onPlayerStateChange(event, videoId, player) {
        if (event.data == YT.PlayerState.PLAYING) {
            clearInterval(intervalIds[videoId]); // Xóa intervalId cũ của video
            intervalIds[videoId] = setInterval(function () {
                let time_elapsed = Math.floor(player.getCurrentTime()); // Sử dụng hàm Math.floor để làm tròn thời gian xuống số nguyên gần nhất
                // Hiển thị thông tin video đang phát
                const videoInfo = document.getElementById('video-info');
                videoInfo.innerHTML = `Time elapsed: ${time_elapsed}`;
                let time = time_elapsed / player.getDuration() * 100;
                console.log(time);
                if (time >= 90) {
                    console.log("Đã xem hết video");
                    document.getElementById('next-video').disabled = false; // Kích hoạt nút Next
                    document.getElementById('next-video').setAttribute("style", "background-color: #007bff; color: #fff; border-color: #007bff;");
                    if (time == 100) {
                        document.getElementById('next-video').click(); // Tự động chuyển sang video tiếp theo
                    }
                } else {
                    console.log("Chưa xem hết video");
                    document.getElementById('next-video').disabled = true; // Vô hiệu hóa nút Next
                    document.getElementById('next-video').setAttribute("style", "background-color: #6c757d; color: #fff; border-color: #6c757d;");
                }
            }); 
        } else {
            clearInterval(intervalIds[videoId]); // Xóa intervalId khi video dừng phát
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

// Trích xuất tổng thời gian của video và hiển thị nó
function extractVideoDuration(videoId) {
    const videoUrl = `https://www.googleapis.com/youtube/v3/videos?id=${videoId}&key=AIzaSyAMbEBUWSt19z0-kaQ-yUEV84r-YONdGh0&part=contentDetails`;

    fetch(videoUrl)
        .then(response => response.json())
        .then(data => {
            const duration = data.items[0].contentDetails.duration;
            const durationInSeconds = parseISO8601DurationToSeconds(duration);
            console.log(`Tổng thời gian của video (giây): ${durationInSeconds}`);
        })
        .catch(error => {
            console.error(error);
        });
}


// Hàm chuyển đổi định dạng ISO 8601 sang giây
function parseISO8601DurationToSeconds(duration) {
    const match = duration.match(/PT(\d+H)?(\d+M)?(\d+S)?/);
    const hours = (parseInt(match[1], 10) || 0);
    const minutes = (parseInt(match[2], 10) || 0);
    const seconds = (parseInt(match[3], 10) || 0);
    return hours * 3600 + minutes * 60 + seconds;
}

// Gọi hàm này khi thay đổi video
function onVideoChange(videoId) {
    extractVideoDuration(videoId);
}