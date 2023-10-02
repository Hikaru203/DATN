var app = angular.module("myApp", []);
app.controller("TracNghiem-ctrl", function($scope, $http, $window) {
    $scope.itemsCauHoi = [];
    $scope.danhSachKhoaHoc = [];
    $scope.questionAnswerArray = [];
    $scope.selectedKhoaHoc = null; // Giá trị mặc định

    // Hàm tải danh sách khóa học từ REST API
    $scope.loadDanhSachKhoaHoc = function() {
        $http.get("/rest/KhoaHoc").then(function(response) {
            $scope.danhSachKhoaHoc = response.data;
            // console.log("Dữ liệu khóa học", $scope.danhSachKhoaHoc);
        });
    };
    $scope.chonKhoaHoc = function (id) {
        $http.get(`/rest/tracnghiem/${id}`).then(resp => {
            $scope.itemsCauHoi = resp.data;
            // console.log("api",resp.data);
              // Tạo mảng mới chứa thông tin câu hỏi, câu trả lời và mảng đáp án
              const questionAnswerArray = [];

              for (const item of $scope.itemsCauHoi) {
                  if (item.cauTraLoi) {
                      const splitAnswers = item.cauTraLoi.split(',').map(answer => answer.trim());
                      // Tạo đối tượng chứa thông tin và đưa vào mảng mới
                      const questionObject = {
                          cauHoi: item.cauHoi,
                          cauTraLoi: splitAnswers,
                          dapAn: item.dapAn
                      };
                      questionAnswerArray.push(questionObject);
                  } else {
                      console.log("'cauTraLoi' does not exist or has no value for an item.");
                  }
              }
              console.log("Question and answer array:", questionAnswerArray);
              $scope.questionAnswerArray = questionAnswerArray;
          }).catch(error => {
              console.error("An error occurred:", error);
        });
    }
    
    
    // Gọi hàm initialize để khởi tạo dữ liệu khi trang được tải
    $scope.loadDanhSachKhoaHoc();
}); 