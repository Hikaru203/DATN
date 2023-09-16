/*
🎬 Video playlist UI Design like Skillshare With Vanilla JavaScript
👨🏻‍⚕️ By: Coding Design
	
You can do whatever you want with the code. However if you love my content, you can subscribed my YouTube Channel
🌎link: www.youtube.com/codingdesign
*/
const app = angular.module('loadVideo-app', ['ngCookies']);
const main_video = document.querySelector('.main-video video');
const main_video_title = document.querySelector('.main-video .title');
const video_playlist = document.querySelector('.video-playlist .videos');

app.controller("loadVideo-app-ctrl", ['$scope', '$http', '$cookies', '$window', function($scope, $http, $cookies, $window) {
	$scope.items = [];

	$scope.getid = function(id) {
		$window.sessionStorage.setItem('videoId', id);
		$window.location.href = '/courseOnline/video';
		// Chuyển đổi số nguyên thành chuỗi JSON
	}



	$scope.loadvideo = function() {
		var storedId = $window.sessionStorage.getItem('videoId');
		var url = `/rest/loadVideo/get-video-id/${storedId}`;

		$http.get(url).then(response => {
			$scope.data = response.data; // Dữ liệu từ CSDL
			console.log($scope.data);

			// Rest of your code for rendering the video playlist
			$scope.data.forEach((video, i) => {
				let video_element = `
                <div class="video" data-id="${video.id}">
                    <img src="/img/play.svg" alt="">
                    <p>${i + 1 > 9 ? i + 1 : '0' + (i + 1)}. </p>
                    <h3 class="title">${video.khoaHoc.tenKhoaHoc}</h3>
                </div>
            `;
				video_playlist.innerHTML += video_element;
			});

			let videos = document.querySelectorAll('.video');
        
        // Xác định video đầu tiên là active
        videos[0].classList.add('active');
        videos[0].querySelector('img').src = '/img/pause.svg';

        // Xử lý sự kiện khi một video được chọn
        videos.forEach(selected_video => {
            selected_video.onclick = () => {
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
                    main_video.src = '/videos/' + match_video.linkVideo;
                    main_video_title.innerHTML = match_video.khoaHoc.tenKhoaHoc;
                }
            };
        });

        // Đảm bảo rằng người dùng không thể tải xuống video
        main_video.controlsList = "nodownload";
		}).catch(error => {
			// Xử lý lỗi (nếu cần)
			console.error(error);
		});

	}
}]);



