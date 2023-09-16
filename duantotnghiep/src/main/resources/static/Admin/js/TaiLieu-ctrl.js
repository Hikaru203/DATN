var app = angular.module("myApp", ['ui.bootstrap']);

app.controller("TaiLieu-ctrl", function ($scope, $http, $window) {
    $scope.itemsTaiLieu = [];
    $scope.formTaiLieu = {};

    $scope.itemsKhoaHoc = [];
    $scope.itemKhoaHoc = {};
    $scope.formKhoaHoc = {};
    $scope.KhoaHoc = {};
    var tenTaiLieu = $scope.formTaiLieu.tenSlide;
    $scope.selectedItem = null; // Biến để lưu trữ item được chọn khi bạn bấm vào nút "Sửa"


    $scope.currentPage = 1; // Trang hiện tại
    $scope.itemsPerPage = 5; // Số hàng trên mỗi trang
    $scope.totalItems = 0; // Tổng số tài liệu

    // Hàm tải danh sách khóa học
    function loadKhoaHoc() {
        $http.get("/Admin/rest/KhoaHoc").then(function (resp) {
            $scope.itemsKhoaHoc = resp.data;
        }).catch(function (error) {
            console.log("Lỗi tải danh sách khóa học", error);
        });
    }

    function loadTaiLieu() {
        $http.get("/Admin/rest/TaiLieu").then(function (resp) {
            $scope.itemsTaiLieu = resp.data;
            $scope.totalItems = $scope.itemsTaiLieu.length;

            // Định dạng lại ngày thành "giờ ngày tháng năm"
            for (var i = 0; i < $scope.itemsTaiLieu.length; i++) {
                var ngayTao = moment($scope.itemsTaiLieu[i].ngayTao).format("HH:mm DD-MM-YYYY");
                $scope.itemsTaiLieu[i].ngayTao = ngayTao;
            }

            console.log($scope.itemsTaiLieu);
            $scope.pageChanged();
        }).catch(function (error) {
            console.log("Lỗi tải danh sách tài liệu", error);
        });
    }

    // Hàm tải danh sách tài liệu dựa trên khóa học đã chọn
    $scope.loadDocuments = function () {
        if (!$scope.formTaiLieu.khoaHoc) {
            loadTaiLieu(); // Tải lại danh sách tài liệu nếu không có khóa học được chọn
            $scope.formTaiLieu.thuTu = "";
            return; // Thoát khỏi hàm nếu không có khoá học được chọn
        }
        $http.get("/Admin/rest/KhoaHoc/" + $scope.formTaiLieu.khoaHoc).then(function (resp) {
            $scope.KhoaHoc = resp.data;
            // Định dạng lại ngày thành "giờ ngày tháng năm"
            for (var i = 0; i < $scope.itemsTaiLieu.length; i++) {
                var ngayTao = moment($scope.itemsTaiLieu[i].ngayTao).format("HH:mm DD-MM-YYYY");
                $scope.itemsTaiLieu[i].ngayTao = ngayTao;
            }


        }).catch(function (error) {
            console.log("Lỗi tải danh sách tài liệu", error);
        });
        if ($scope.formTaiLieu.khoaHoc) {
            $http.get("/Admin/rest/TaiLieu/" + $scope.formTaiLieu.khoaHoc).then(function (resp) {
                $scope.itemsTaiLieu = resp.data;
                $scope.pageChanged(); // Hiển thị trang đầu tiên
                console.log($scope.itemsTaiLieu);
                // Định dạng lại ngày thành "giờ ngày tháng năm"
                for (var i = 0; i < $scope.itemsTaiLieu.length; i++) {
                    var ngayTao = moment($scope.itemsTaiLieu[i].ngayTao).format("HH:mm DD-MM-YYYY");
                    $scope.itemsTaiLieu[i].ngayTao = ngayTao;
                }

                $scope.formTaiLieu.thuTu = $scope.displayedItems.length + 1;

            });
        } else {
            $http.get("/Admin/rest/TaiLieu").then(function (resp) {
                $scope.itemsTaiLieu = resp.data;
                $scope.pageChanged(); // Hiển thị trang đầu tiên
                // Định dạng lại ngày thành "giờ ngày tháng năm"
                for (var i = 0; i < $scope.itemsTaiLieu.length; i++) {
                    var ngayTao = moment($scope.itemsTaiLieu[i].ngayTao).format("HH:mm DD-MM-YYYY");
                    $scope.itemsTaiLieu[i].ngayTao = ngayTao;
                }
                $scope.formTaiLieu.thuTu = "";
            });

        }
    };

    // Khởi đầu
    $scope.initialize = function () {

        loadKhoaHoc(); // Tải danh sách khóa học
        loadTaiLieu(); // Tải danh sách tài liệu

    };

    $scope.initialize();

    // Hàm xử lý phân trang
    $scope.pageChanged = function () {
        var startIndex = ($scope.currentPage - 1) * $scope.itemsPerPage;
        var endIndex = startIndex + $scope.itemsPerPage;
        $scope.displayedItems = $scope.itemsTaiLieu.slice(startIndex, endIndex);
    };

    $scope.goToFirstPage = function () {
        $scope.currentPage = 1;
        $scope.pageChanged();
    };

    $scope.goToPreviousPage = function () {
        if ($scope.currentPage > 1) {
            $scope.currentPage--;
            $scope.pageChanged();
        }
    };

    $scope.goToNextPage = function () {
        if ($scope.currentPage < $scope.totalItems / $scope.itemsPerPage) {
            $scope.currentPage++;
            $scope.pageChanged();
        }
    };

    $scope.goToLastPage = function () {
        $scope.currentPage = Math.ceil($scope.totalItems / $scope.itemsPerPage);
        $scope.pageChanged();
    };

    // Hàm thêm tài liệu
    $scope.create = function () {
        var tenTaiLieu = $scope.formTaiLieu.tenTaiLieu;
        console.log(tenTaiLieu);

        // Lấy ngày giờ hiện tại
        var ngayGioHienTai = moment().format("YYYY-MM-DDTHH:mm:ss.SSSZ");

        var item = angular.copy($scope.formTaiLieu);
        item.khoaHoc = $scope.KhoaHoc;

        // Thêm ngày giờ hiện tại vào đối tượng item
        item.ngayTao = ngayGioHienTai;

        // Lấy thông tin về tệp tin đã chọn
        var fileInput = document.getElementById('fileInput');
        if (fileInput.files.length > 0) {
            var selectedFile = fileInput.files[0];
            // Lưu tên tệp vào thuộc tính tenFile của đối tượng item
            item.tenFile = selectedFile.name;

            // Tạo FormData để gửi tệp tin lên máy chủ
            var formData = new FormData();
            formData.append('file', selectedFile);

            // Gửi POST request đến API của máy chủ để tải lên tệp tin
            $http.post('/api/upload', formData, {
                transformRequest: angular.identity,
                headers: { 'Content-Type': undefined }
            }).then(function (uploadResp) {
                console.log(uploadResp.data);

                // Sau khi tải lên tệp tin thành công, gửi thông tin khác lên máy chủ
                $http.post(`/Admin/rest/TaiLieu`, item).then(function (resp) {
                    $scope.itemsTaiLieu.push(resp.data);
                    alert("Thêm mới thành công");
                    $scope.reset();
                }).catch(function (error) {
                    alert("Lỗi thêm mới tài liệu");
                    console.log("Error", error);
                });
            }).catch(function (uploadError) {
                alert("Lỗi tải lên tệp tin");
                console.log("Upload Error", uploadError);
            });
        }
    };

    $scope.edit = function (item) {
        var pdfViewerContainer = document.getElementById("pdfViewerContainer");
        pdfViewerContainer.style.display = "block";
        $scope.formTaiLieu = angular.copy(item);
        $scope.formTaiLieu.khoaHoc = item.khoaHoc.id;
        $scope.formTaiLieu.tenFile = item.tenFile;
        $scope.formTaiLieu.ngayTao = moment(item.ngayTao).format("YYYY-MM-DDTHH:mm:ss.SSSZ");
        $scope.isEditing = true; // Đặt chế độ chỉnh sửa thành true
        console.log($scope.formTaiLieu);
        // Lấy tên tệp PDF từ item
        var tenTepPDF = item.tenFile;

        // Xây dựng đường dẫn đầy đủ đến tệp PDF
        var duongDanTepPDF = 'pdf/' + tenTepPDF;

        // Gọi hàm để hiển thị tệp PDF
        displayPDFFromFile(duongDanTepPDF);
    };
    $scope.reset = function () {
        $scope.formTaiLieu = {};
        $scope.isEditing = false;
        // Ẩn phần tử có id là "pdfViewerContainer" cùng với các phần tử con bên trong
        var pdfViewerContainer = document.getElementById("pdfViewerContainer");
        pdfViewerContainer.style.display = "none";

        // Đặt giá trị của trường input type="file" thành chuỗi rỗng
        var fileInput = document.getElementById("fileInput");
        fileInput.value = ""; // Đặt giá trị thành chuỗi rỗng
    };





    function displayPDFFromFile(duongDan) {
        var pdfjsLib = window['pdfjs-dist/build/pdf'];
        pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.10.377/pdf.worker.js';

        var pdfCanvas = document.getElementById('pdfCanvas');
        var pdfScrollContainer = document.getElementById('pdfScrollContainer'); // Container cho phần có thể kéo

        pdfjsLib.getDocument(duongDan).promise.then(function (loadedPdf) {
            pdf = loadedPdf;
            renderPage(currentPageNum); // Hiển thị trang đầu tiên mặc định
            updateNavButtons();
        });
    }


});
app.filter('limitWords', function () {
    return function (input, limit) {
        if (!input) return '';
        var words = input.split(' ');
        if (words.length <= limit) return input;
        return words.slice(0, limit).join(' ') + '...';
    };
});


