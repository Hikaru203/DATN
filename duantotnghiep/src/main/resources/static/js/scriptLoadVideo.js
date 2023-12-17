const app = angular.module('loadVideo-app', ['ngCookies']);
const videoPlaylist = document.querySelector('.video-playlist .videos');
let videoIframe;
let idMucluc;


app.controller("loadVideo-app-ctrl", ['$scope', '$http', '$cookies', '$window', function ($scope, $http, $cookies, $window) {
    $scope.items = [];
    $scope.tiendokhoahoc = [];
    $scope.getid = function (id) {
        $window.sessionStorage.setItem('videoId', id);
        $window.location.href = '/courseOnline/video';
    }

    $scope.setid = function (id) {
        $window.sessionStorage.setItem('MucLuc', id);
    }




    // Lấy giá trị từ sessionStorage
    var idFromSessionStorage = $window.sessionStorage.getItem('MucLuc');

    // Sử dụng giá trị lấy được từ sessionStorage theo nhu cầu của bạn trong mã JavaScript của AngularJS
    // Ví dụ:

    // Lấy URL hiện tại
    var currentURL = window.location.href;
    // Sử dụng đối tượng URL để phân tích URL
    var urlObject = new URL(currentURL);
    var pathname = urlObject.pathname;

    // Sử dụng đối tượng URL để phân tách `pathname` thành các phần bằng '/'
    var parts = pathname.split('/');

    // Lấy phần tử cuối cùng của mảng parts, đó chính là số 1
    var idKhoaHoc = parts[parts.length - 1];




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
        $scope.inputElement1=null;

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
    var videoIdMax;
    function changeVideo(selected_video, videos, $scope, VideoId = null, Time = null) {
        // Xóa thông tin video cũ
        const timeInt = Math.floor(Time);


        let match_video = $scope.data.find(video => video.id == selected_video.dataset.id);

        if (match_video) {
            let videoIframe = document.getElementById('video-iframe');
            let videoSrc;
            if (VideoId) {
                videoSrc = `https://www.youtube-nocookie.com/embed/${VideoId}?start=${timeInt}&modestbranding=1&disablekb=1&origin=http://localhost:8080&enablejsapi=1&disablekb=1&controls=0`;
            } else {
                videoSrc = `https://www.youtube-nocookie.com/embed/${match_video.linkVideo}?modestbranding=1&disablekb=1&origin=http://localhost:8080&enablejsapi=1&disablekb=1&controls=0`;
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
                                        $http.put('/api/tiendokhoahoc/' + value + '/' + idKhoaHoc + '/' + idVideo + '/' + currentTime).then(function (response) {
                                        }, function (response) {
                                            console.log(response);
                                        });
                                        videoIdMax = VideoId;
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
                                event.target.pauseVideo();
                                event.target.playVideo();

                            }
                        }
                    });
                }
            };
            document.addEventListener("keydown", function (event) {
                if (event.ctrlKey) {
                    event.preventDefault();
                }
                if (event.keyCode == 123) {
                    event.preventDefault();
                }
            });
            document.addEventListener('contextmenu', function (e) {
                e.preventDefault();
            });

            // Lấy thứ tự video đang phát dựa trên current_player.playerInfo.videoData.video_id
            if (VideoId) {
                const currentVideoIndex = $scope.data.findIndex(video => video.linkVideo === VideoId);
                if (currentVideoIndex !== -1) {
                    currentIndex = currentVideoIndex;
                    $scope.setid($scope.data[currentIndex].mucLuc.id);
                    var idFromSessionStorage = $window.sessionStorage.getItem('MucLuc');
<<<<<<< HEAD
					console.log($scope.data[currentIndex])
					        $scope.inputElement1=$scope.data[currentIndex].tenVideo;
										console.log( $scope.inputElement1)
=======
                    $scope.inputElement1 = $scope.data[currentIndex].tenVideo;
>>>>>>> dev


                } else {
                }
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
            $http.put('/api/tiendokhoahoc/uploadTienDoToiDa/' + value + '/' + idKhoaHoc + '/' + $scope.data[currentIndex].linkVideo)
                .then(function (response) {
                    console.log(response);
                });
        }
    }

    function loadPrevVideo() {
        if (currentIndex >= 0) {
            const videos = document.querySelectorAll('.video');
            changeVideo(videos[currentIndex], videos, $scope);
        }
    }
    var tienDoToiDa;
    function loadFirstVideo(videos, $scope) {
        if (videos.length > 0) {
            let firstVideo = videos[0];
            $http.get('/api/tiendokhoahoc/' + value + '/' + idKhoaHoc).then(function (response) {
                $scope.tiendokhoahoc = response.data;
                tienDoToiDa = $scope.tiendokhoahoc.tienDoToiDa;
                if ($scope.tiendokhoahoc.tienDo != 0) {
                    const input = $scope.tiendokhoahoc.tienDo;

                    const previousURL = document.referrer;
                    if (previousURL.includes('tracnghiem')) {
                        // Nếu có, thực hiện các hành động cần thiết ở đây
                        // Lấy giá trị từ sessionStorage
                        const { videoId, time } = extractVideoIdAndTime(input);
                        changeVideo(firstVideo, videos, $scope, videoId, time);

                        return;
                    }
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
                        yesButton.id = 'yes-button';
                        yesButton.innerHTML = 'Có';

                        const noButton = document.createElement('button');
                        noButton.id = 'no-button';
                        noButton.innerHTML = 'Không';


                        dialogBox.appendChild(yesButton);
                        dialogBox.appendChild(noButton);
                        overlay.appendChild(dialogBox);

                        yesButton.addEventListener('click', function () {
                            overlay.style.display = 'none';
                            const { videoId, time } = extractVideoIdAndTime(input);
                            changeVideo(firstVideo, videos, $scope, videoId, time);

                        });

                        noButton.addEventListener('click', function () {
                            overlay.style.display = 'none';
                            const { videoId, time } = extractVideoIdAndTime(input);
                            changeVideo(firstVideo, videos, $scope);
                        });
                    } else {
                        // Nếu không cần hiển thị hộp thoại, thực hiện các hành động khác trực tiếp
                        const { videoId, time } = extractVideoIdAndTime(input);
                        changeVideo(firstVideo, videos, $scope, videoId, time);
                    }
                } else {
                    firstVideo = videos[0];
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
    const volumeControl1 = document.getElementById('volume-control');
    const volumeIcon = document.getElementById('volume-icon');
    const volumePercentage1 = document.getElementById('volume-percentage');

    volumeControl1.addEventListener('input', function () {
        const volumeValue = parseInt(this.value);
        volumePercentage1.textContent = volumeValue + '%';

        // Kiểm tra nếu âm lượng nhỏ hơn 50% thì thay đổi icon
        if (volumeValue < 50) {
            volumeIcon.classList.remove('fa-volume-up');
            volumeIcon.classList.add('fa-volume-down');
        } else {
            volumeIcon.classList.remove('fa-volume-down');
            volumeIcon.classList.add('fa-volume-up');
        }
    });




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
        videos.forEach((video, index) => {
            video.onclick = () => {
                changeVideo(video, videos, $scope);

                videos.forEach((v, index) => {
                    v.classList.remove('active');
                    v.querySelector('img').src = '/img/play.svg';
                    if (index === currentIndex) {
                        video.classList.add('active');
                        video.querySelector('img').src = '/img/pause.svg';
                    }
                });
            };
        });
    }







    $scope.loadvideo = function () {
        var storedId = $window.sessionStorage.getItem('videoId');
        var url = `/rest/loadVideo/get-video-id/${storedId}`;
        $http.get(url).then(response => {
            $scope.data = response.data;

            videoPlaylist.innerHTML = ''; // Clear the playlist before adding new videos

            // Sort videos by mucLuc (assuming mucLuc is a property in each video item)
            $scope.data.sort((a, b) => {
                if (a.mucLuc.id < b.mucLuc.id) {
                    return -1;
                }
                if (a.mucLuc.id > b.mucLuc.id) {
                    return 1;
                }
                return 0;
            });

            let index = 1;
            let foundIndex = -1;
            $scope.count = 0;
            $scope.countDaHoc = 0;
            $http.get('/api/tiendokhoahoc/' + value + '/' + idKhoaHoc).then(function (response) {
                $scope.tiendokhoahoc = response.data;
                console.log($scope.tiendokhoahoc);
                // Find the index of the video with id equal to tiendokhoahoc.tiendotoida
                $scope.data.forEach((video, i) => {
                    if (video.linkVideo == $scope.tiendokhoahoc.tienDoToiDa) {
                        foundIndex = i;
                        return;
                    }
                });
                $scope.count = $scope.data.length;

                $scope.data.forEach((video) => {
                    let disabled = (foundIndex !== -1 && index > foundIndex + 1);
                    console.log(disabled);

                    if (!disabled) {
                        $scope.countDaHoc++; // Tăng biến đếm nếu video không bị vô hiệu hóa
                    }

                    if (!$scope.tiendokhoahoc.tienDoToiDa || $scope.tiendokhoahoc.tienDoToiDa == null || $scope.tiendokhoahoc.tienDoToiDa == "" || $scope.tiendokhoahoc.tienDoToiDa == 0) {
                        $scope.countDaHoc = 0;
                        console.log($scope.countDaHoc);
                        disabled = true;
                    }
                    let video_element = `
                        <div class="video ${disabled ? 'disabled' : ''}" data-id="${video.id}" ${disabled ? 'data-disabled="true"' : ''}>
                            <img src="/img/play.svg" alt="">
                            <p>${index > 9 ? index : '0' + index}. </p>
                            <h3 class="title">${video.tenVideo}</h3>
                            ${disabled ? '<i class="fa fa-lock"></i>' : ''} <!-- Thêm icon khóa nếu video bị vô hiệu hóa -->
                        </div>
                    `;
                    videoPlaylist.innerHTML += video_element;
                    index++;
                });
                let videos = document.querySelectorAll('.video');
                console.log(videos);
                setupVideoEvents($scope);
                loadFirstVideo(videos, $scope);
            }).catch(error => {
                console.error(error);
            });
        });
    }



    const nextVideoButton = document.getElementById('next-video');
    const prevVideoButton = document.getElementById('prev-video');
    let currentIndex = 0;

    nextVideoButton.addEventListener('click', function () {
        currentIndex++;
        $http.get('/api/courseOnline/detail/' + idKhoaHoc).then(function (response) {
            $scope.hoc = response.data;
            idKhoaHoc = $scope.hoc.courseOnline.id;

            if ($scope.hoc && $scope.hoc.mucLuc && $scope.hoc.videoKhoaHoc[currentIndex]) {
                // Nếu $scope.hoc tồn tại và có thuộc tính mucLuc
                // Thực hiện các hành động cần thiết ở đây
                // Ví dụ:
            } else {
                // Nếu $scope.hoc không tồn tại hoặc không có thuộc tính mucLuc
                // Xử lý lỗi hoặc thực hiện các hành động phù hợp với trường hợp này
                redirectToQuizPage($scope.hoc.videoKhoaHoc[currentIndex - 1].mucLuc.khoaHoc.id);
                return;
            }
            $scope.setid($scope.hoc.videoKhoaHoc[currentIndex - 1].mucLuc.id);
            idMucluc = $scope.hoc.videoKhoaHoc[currentIndex - 1].mucLuc.id;

            if ($scope.hoc.videoKhoaHoc[currentIndex].mucLuc.id != $scope.hoc.videoKhoaHoc[currentIndex - 1].mucLuc.id) {
                $http.put('/api/tiendokhoahoc/' + value + '/' + idKhoaHoc + '/' + $scope.hoc.videoKhoaHoc[currentIndex].linkVideo + '/' + 1).then(function (response) {
                }, function (response) {
                    console.log(response);
                }
                );
                for (var i = 0; i < $scope.hoc.cauHois.length; i++) {
                    if ($scope.hoc.videoKhoaHoc[currentIndex - 1].mucLuc.id == $scope.hoc.cauHois[i].mucLuc.id) {
                        redirectToQuizPage($scope.hoc.videoKhoaHoc[currentIndex].mucLuc.khoaHoc.id);
                    } else {
                        loadNextVideo($scope.hoc.videoKhoaHoc[currentIndex].mucLuc.khoaHoc.id);
                    }
                }
            } else {
                if (currentIndex < $scope.data.length) {
                    loadNextVideo($scope.hoc.videoKhoaHoc[currentIndex].mucLuc.khoaHoc.id);
                }
            }

        }, function (response) {
            console.log(response);
        });

    });

    prevVideoButton.addEventListener('click', function () {
        currentIndex--;
        loadPrevVideo();
    });



    function redirectToQuizPage(idKhoaHoc) {
        // Thay đổi URL hoặc thực hiện hành động cụ thể để chuyển đến trang trắc nghiệm
        window.location.href = '/courseOnline/tracnghiem/' + idKhoaHoc; // Ví dụ: chuyển đến trang trắc nghiệm
    }


}]);

function onPageReady() {
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