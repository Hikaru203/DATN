const app = angular.module('loadVideo-app', ['ngCookies']);
const videoPlaylist = document.querySelector('.video-playlist .videos');
let videoIframe;

app.controller("loadVideo-app-ctrl", ['$scope', '$http', '$cookies', '$window', function ($scope, $http, $cookies, $window) {
    $scope.items = [];

    $scope.getid = function (id) {
        $window.sessionStorage.setItem('videoId', id);
        $window.location.href = '/courseOnline/video';
    }

    // Lấy URL hiện tại
    var currentURL = window.location.href;
    // Sử dụng đối tượng URL để phân tích URL
    var urlObject = new URL(currentURL);
    var pathname = urlObject.pathname;

    // Sử dụng đối tượng URL để phân tách `pathname` thành các phần bằng '/'
    var parts = pathname.split('/');

    // Lấy phần tử cuối cùng của mảng parts, đó chính là số 1
    var idKhoaHoc = parts[parts.length - 1];

    console.log(idKhoaHoc); // In ra số 1

    function setupVideoEvents($scope) {
        // Loại bỏ sự kiện click trên các phần tử video
        let videos = document.querySelectorAll('.video');
        videos.forEach(selected_video => {
            selected_video.onclick = null;
        });
    }

    let current_player = null;
    let nextButton = document.getElementById('next-video');
    let volumeControl = document.getElementById('volume-control');
    let playbackSpeedSelect = document.getElementById('playback-speed');
    const pauseButton = document.getElementById('pause-video');
    const playPauseIcon = document.getElementById('play-pause-icon');

    pauseButton.addEventListener('click', function () {
        if (current_player) {
            if (current_player.getPlayerState() === YT.PlayerState.PLAYING) {
                current_player.pauseVideo();
                playPauseIcon.classList.remove('fa-pause');
                playPauseIcon.classList.add('fa-play');
            } else if (current_player.getPlayerState() === YT.PlayerState.PAUSED) {
                current_player.playVideo();
                playPauseIcon.classList.remove('fa-play');
                playPauseIcon.classList.add('fa-pause');
            }
        }
    });
    const volumePercentage = document.getElementById('volume-percentage');

    // Update the displayed percentage when the input value changes
    volumeControl.addEventListener('input', function () {
        const volumeValue = volumeControl.value;
        volumePercentage.textContent = volumeValue + '%';
    });

    // Initial update when the page loads
    volumePercentage.textContent = volumeControl.value + '%';



    // Lấy phần tử input bằng ID
    var inputElement = document.getElementById('idLogin');
    var value;
    let currentVideoIndex = 0;
    if (inputElement == null || inputElement == "") {
        value = 0;
    }
    else {
        // Lấy giá trị của input
        var value = inputElement.value;
        value = inputElement.value;
    }
    function changeVideo(selected_video, videos, $scope, VideoId = null, Time = null) {
        // Xóa thông tin video cũ
        const timeInt = Math.floor(Time);


        let match_video = $scope.data.find(video => video.id == selected_video.dataset.id);

        if (match_video) {
            let videoIframe = document.getElementById('video-iframe');
            let videoSrc;
            if (VideoId) {
                videoSrc = `https://www.youtube-nocookie.com/embed/${VideoId}?start=${timeInt}&modestbranding=1&disablekb=1&origin=http://localhost:8080&enablejsapi=1&disablekb=1&controls=0&autoplay=1`;
            } else {
                videoSrc = `https://www.youtube-nocookie.com/embed/${match_video.linkVideo}?modestbranding=1&disablekb=1&origin=http://localhost:8080&enablejsapi=1&disablekb=1&controls=0&autoplay=1`;
            }

            videoIframe.src = videoSrc;
            videoIframe.setAttribute("allow", "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture");
            videoIframe.setAttribute("allowfullscreen", "");
            videoIframe.onload = function () {
                if (current_player) {
                    current_player.loadVideoById(match_video.linkVideo);
                } else {
                    current_player = new YT.Player(videoIframe, {
                        events: {
                            'onStateChange': function (event) {
                                if (event.data === YT.PlayerState.PLAYING) {
                                    setInterval(function () {

                                        let currentTime = current_player.getCurrentTime();
                                        let duration = current_player.getDuration();
                                        let timeInfo = formatTime(currentTime) + ' / ' + formatTime(duration);
                                        document.getElementById('video-info').textContent = timeInfo;
                                        let progressPercentage = (currentTime / duration) * 100;

                                        var tienDo = (VideoId || match_video.linkVideo) + "/" + currentTime;
                                        idVideo = current_player.playerInfo.videoData.video_id;
                                        console.log(idVideo);
                                        $http.put('/api/tiendokhoahoc/' + value + '/' + idKhoaHoc + '/' + idVideo + '/' + currentTime).then(function (response) {
                                            console.log(response);
                                        }, function (response) {
                                            console.log(response);
                                        });

                                        if (progressPercentage >= 90) {
                                            nextButton.disabled = false;
                                            nextButton.style.opacity = 1;
                                            nextButton.style.cursor = 'pointer';
                                            nextButton.style.pointerEvents = 'auto';
                                            nextButton.style.backgroundColor = '#ff0000';
                                            nextButton.style.color = '#fff';
                                            nextButton.style.border = 'none';
                                            nextButton.style.borderRadius = '5px';
                                            nextButton.style.padding = '10px 20px';
                                            nextButton.style.margin = '0 10px';
                                            nextButton.style.fontSize = '16px';
                                            nextButton.style.fontWeight = 'bold';
                                            nextButton.style.textTransform = 'uppercase';
                                        } else {
                                            nextButton.disabled = true;
                                            nextButton.style.opacity = 0.5;
                                            nextButton.style.cursor = 'not-allowed';
                                            nextButton.style.pointerEvents = 'none';
                                            nextButton.style.backgroundColor = '#fff';
                                            nextButton.style.color = '#000';
                                            nextButton.style.border = '1px solid #000';
                                            nextButton.style.borderRadius = '5px';
                                            nextButton.style.padding = '10px 20px';
                                            nextButton.style.margin = '0 10px';
                                            nextButton.style.fontSize = '16px';
                                            nextButton.style.fontWeight = 'bold';
                                        }
                                    }, 1000);
                                }
                            },
                            'onReady': function (event) {
                                if (Time) {
                                    console.log("Seek to:", Time);
                                }
                            }
                        }
                    });
                }
            };

            // Lấy thứ tự video đang phát dựa trên current_player.playerInfo.videoData.video_id
            if (VideoId) {
                currentVideoIndex = $scope.data.findIndex(video => video.linkVideo === VideoId);
                currentIndex = currentVideoIndex;
            }

            videos.forEach((video, index) => {
                video.classList.remove('active');
                video.querySelector('img').src = '/img/play.svg';

                if (index === currentIndex) {
                    video.classList.add('active');
                    video.querySelector('img').src = '/img/pause.svg';
                }
            });


        }

    }


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

    function loadFirstVideo(videos, $scope) {
        if (videos.length > 0) {
            let firstVideo = videos[0];
            $http.get('/api/tiendokhoahoc/' + value + '/' + idKhoaHoc).then(function (response) {
                $scope.tiendokhoahoc = response.data;
                console.log($scope.tiendokhoahoc.tienDo + "tiendokhoahoc");
                if ($scope.tiendokhoahoc.tienDo != 0) {
                    const input = $scope.tiendokhoahoc.tienDo;

                    let needConfirmation = true; // Biến kiểm tra cần hiển thị hộp thoại hay không

                    // Kiểm tra điều kiện nếu cần hiển thị hộp thoại
                    if (needConfirmation) {
                        const overlay = document.createElement('div');
                        overlay.id = 'overlay';
                        document.body.appendChild(overlay);

                        const dialogBox = document.createElement('div');
                        dialogBox.id = 'dialog-box';
                        dialogBox.innerHTML = 'Bạn có muốn tiếp tục học không?';
                        const yesButton = document.createElement('button');
                        yesButton.innerHTML = 'Có';
                        const noButton = document.createElement('button');
                        noButton.innerHTML = 'Không';

                        dialogBox.appendChild(yesButton);
                        dialogBox.appendChild(noButton);
                        overlay.appendChild(dialogBox);

                        yesButton.addEventListener('click', function () {
                            overlay.style.display = 'none';
                            console.log('Tiếp tục học');
                            const { videoId, time } = extractVideoIdAndTime(input);
                            console.log('Video ID:', videoId);
                            console.log('Thời gian:', time);
                            changeVideo(firstVideo, videos, $scope, videoId, time);
                        });

                        noButton.addEventListener('click', function () {
                            overlay.style.display = 'none';
                            console.log('Không tiếp tục học');
                            const { videoId, time } = extractVideoIdAndTime(input);
                            console.log('Video ID:', videoId);
                            console.log('Thời gian:', time);
                            changeVideo(firstVideo, videos, $scope);
                        });
                    } else {
                        // Nếu không cần hiển thị hộp thoại, thực hiện các hành động khác trực tiếp
                        const { videoId, time } = extractVideoIdAndTime(input);
                        console.log('Video ID:', videoId);
                        console.log('Thời gian:', time);
                        changeVideo(firstVideo, videos, $scope, videoId, time);
                    }
                } else {
                    firstVideo = videos[0];
                    console.log('Video ID:', firstVideo.dataset.id);
                    changeVideo(firstVideo, videos, $scope);
                }

                function extractVideoIdAndTime(input) {
                    // Tách chuỗi thành videoId và thời gian bằng dấu "/"
                    const parts = input.split('/');

                    if (parts.length === 2) {
                        const videoId = parts[0];
                        const time = parts[1];
                        return { videoId, time };
                    } else {
                        // Trả về null nếu không thể tách thành công
                        return null;
                    }
                }
            }, function (response) {
                console.log(response);
            });
        }
    }


    // Hàm định dạng thời gian
    function formatTime(time) {
        let minutes = Math.floor(time / 60);
        let seconds = Math.floor(time % 60);
        return `${minutes}:${seconds.toString().padStart(2, '0')}`;
    }

    // Xử lý sự kiện thay đổi âm lượng
    volumeControl.addEventListener('input', function () {
        let volume = volumeControl.value / 100;
        if (current_player) {
            current_player.setVolume(volume * 100);
        }
    });

    // Xử lý sự kiện thay đổi tốc độ phát
    playbackSpeedSelect.addEventListener('change', function () {
        let playbackSpeed = parseFloat(playbackSpeedSelect.value);
        if (current_player) {
            current_player.setPlaybackRate(playbackSpeed);
        }
    });



    function setupVideoEvents($scope) {
        let videos = document.querySelectorAll('.video');

        videos.forEach(selected_video => {
            selected_video.onclick = () => {
                changeVideo(selected_video, videos, $scope);
            };
        });
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