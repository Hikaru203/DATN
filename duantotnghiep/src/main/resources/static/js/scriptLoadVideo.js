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
	$scope.id = '';
	$scope.getid = function(id) {
		 $scope.id = id;
		 $window.location.href = '/courseOnline/video';
		// Chuyển đổi số nguyên thành chuỗi JSON
	}
	$scope.loadvideo = function(id) {
        var url = `/rest/loadVideo/get-video-id/${$scope.id}`;
			$http.get(url).then(response => {
				this.items = response.data;
				console.log(response.data)
			}).catch(error => {
				// Xử lý lỗi (nếu cần)
				console.error(error);
			});
		let data = [
			{
				'id': 'a1',
				'title': 'MAKING MY WAY',
				'name': 'MAKING MY WAY.mp4',
				'duration': '4:18',
			},
			{
				'id': 'a2',
				'title': 'SƠN TÙNG M-TP _ CÓ CHẮC YÊU LÀ ĐÂY _ OFFICIAL MUSIC VIDEO',
				'name': 'SƠN TÙNG M-TP _ CÓ CHẮC YÊU LÀ ĐÂY _ OFFICIAL MUSIC VIDEO.mp4',
				'duration': '2:45',
			},
			{
				'id': 'a3',
				'title': "THERE'S NO ONE AT ALL",
				'name': "THERE'S NO ONE AT ALL.mp4",
				'duration': '24:49',
			},

			{
				'id': 'a4',
				'title': 'Sống Cho Hết Đời Thanh Xuân 4',
				'name': 'Sống Cho Hết Đời Thanh Xuân 4.mp4',	
				'duration': '3:59',
			},
			{
				'id': 'a5',
				'title': 'custom select box',
				'name': 'custom select box.mp4',
				'duration': '4:25',
			},

		];

		data.forEach((video, i) => {
			let video_element = `
                <div class="video" data-id="${video.id}">
                    <img src="/img/play.svg" alt="">
                    <p>${i + 1 > 9 ? i + 1 : '0' + (i + 1)}. </p>
                    <h3 class="title">${video.title}</h3>
                    <p class="time">${video.duration}</p>
                </div>
    `;
			video_playlist.innerHTML += video_element;
		})

		let videos = document.querySelectorAll('.video');
		videos[0].classList.add('active');
		videos[0].querySelector('img').src = '/img/pause.svg';

		videos.forEach(selected_video => {
			selected_video.onclick = () => {

				for (all_videos of videos) {
					all_videos.classList.remove('active');
					all_videos.querySelector('img').src = '/img/play.svg';

				}

				selected_video.classList.add('active');
				selected_video.querySelector('img').src = '/img/pause.svg';

				let match_video = data.find(video => video.id == selected_video.dataset.id);
				main_video.src = '/videos/' + match_video.name;
				main_video_title.innerHTML = match_video.title;
			}
		});
		main_video.controlsList = "nodownload";
	}
}]);



