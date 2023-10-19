const app = angular.module('loadVideo-app', []);
app.controller('loadVideo-app-ctrl', function ($scope) {
    $scope.loadVideo = function () {
        const videoId = document.getElementById('videoId').value;
        const videoContainer = document.getElementById('videoContainer');

        // Remove any existing video iframe
        while (videoContainer.firstChild) {
            videoContainer.removeChild(videoContainer.firstChild);
        }

        const iframe = document.createElement('iframe');
        iframe.src = `https://clips.twitch.tv/embed?clip=DeafSuccessfulCourgetteAMPEnergyCherry-43CvIR6Z8t7f6Y7v&parent=localhost&controls=false`;
        videoContainer.appendChild(iframe);
    };

    $scope.init = function () {
        document.getElementById('loadVideoButton').addEventListener('click', $scope.loadVideo);

        const iframe = document.getElementById('videoContainer').firstChild;
        const fullscreenButton = document.getElementById('fullscreenButton');
        const expandButton = document.getElementById('expandButton');
        

        fullscreenButton.addEventListener('click', () => {
            if (iframe.requestFullscreen) {
                iframe.requestFullscreen();
                isExpanded = true;
            } else if (iframe.mozRequestFullScreen) {
                iframe.mozRequestFullScreen();
                isExpanded = true;
            } else if (iframe.webkitRequestFullscreen) {
                iframe.webkitRequestFullscreen();
                isExpanded = true;
            } else if (iframe.msRequestFullscreen) {
                iframe.msRequestFullscreen();
                isExpanded = true;
            }
        });

        expandButton.addEventListener('click', () => {
            if (isExpanded) {
                iframe.style.width = '620px';
                iframe.style.height = '378px';
                isExpanded = false;
            } else {
                iframe.style.width = '100%';
                iframe.style.height = '650px';
                isExpanded = true;
            }
        });
    };

    $scope.init();
});
