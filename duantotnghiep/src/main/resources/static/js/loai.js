app.controller('DanhMuc-Ctrl', function ($scope, $http) {
    $scope.danhmuc = {};
    $scope.khoaHoc = {};
    $scope.selectLoai = function () {
        $http.get("/api/khoahoc/loaiKhoaHoc").then(function (response) {
            $scope.danhmuc = response.data;
            console.log($scope.danhmuc);
        });
    }
    $scope.showLoai = function (loai) {
        $scope.khoaHoc = {};
        $http.get("/api/khoahoc/byLoai/" + loai.id).then(function (response) {
            console.log(response.data);
            $scope.khoaHoc = response.data;
        })
    };
    $scope.selectLoai();
});
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
function killCopy(e) {
    return false;
}

function reEnable() {
    return true;
}
document.onselectstart = new Function("return false");

if (window.sidebar) {
    document.onmousedown = killCopy;
    document.onclick = reEnable;
}
