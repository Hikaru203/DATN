
var app = angular.module("myApp", ['ui.bootstrap']);

app.controller("VideoKhoaHocCtrl", function($scope, $http) {
	$scope.itemsVideoKhoaHoc = [];
	$scope.loadVideoKhoaHoc = function() {
		$http.get("/rest/VideoKhoaHoc").then(resp => {
			$scope.itemsVideoKhoaHoc = resp.data;
		});
	};

	// Call the function to load video data initially
	$scope.loadVideoKhoaHoc();
});


