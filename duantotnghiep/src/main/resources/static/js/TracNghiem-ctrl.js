var app = angular.module("myApp", []);
app.controller("TracNghiem-ctrl", function($scope, $http, $window) {
    $scope.itemsCauHoi = [];

    $scope.initialize = function () {
        // Gọi API để tải dữ liệu câu hỏi từ đường dẫn "/rest/TracNghiem"
        $http.get("/rest/tracnghiem").then(resp => {
            $scope.itemsCauHoi = resp.data;
            console.log("API Response:", resp.data)

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
    // Hàm tính điểm
   // Hàm tính điểm
   $scope.checkAnswers = function () {
    $scope.diemSo = 0; // Bắt đầu với điểm số là 0
    var chonDungItNhatMotCauHoi = false; // Biến flag để kiểm tra người dùng đã chọn đúng ít nhất một câu hỏi

    for (var i = 0; i < $scope.itemsCauHoi.length; i++) {
        var question = $scope.itemsCauHoi[i];
        var cauTraLoi = question.cauTraLoi.trim(); // Lấy câu trả lời từ question và loại bỏ khoảng trắng
        var dapAn = question.dapAn.trim(); // Lấy đáp án từ question và loại bỏ khoảng trắng

        // Kiểm tra xem chuỗi `dapAn` có tồn tại trong chuỗi `cauTraLoi` không
        if (cauTraLoi.includes(dapAn)) {
            $scope.diemSo++; // Tăng điểm số nếu chuỗi `dapAn` tồn tại trong chuỗi `cauTraLoi`
            console.log('Câu hỏi số ' + (i + 1) + ': Chọn đúng');
            chonDungItNhatMotCauHoi = true; // Đánh dấu là người dùng đã chọn đúng ít nhất một câu hỏi
        } else {
            // Xử lý trường hợp chọn sai ở đây (ví dụ: in ra thông báo)
            console.log('Câu hỏi số ' + (i + 1) + ': Chọn sai');
        }
    }

    if (!chonDungItNhatMotCauHoi) {
        // Xử lý trường hợp không chọn hoặc chọn sai tất cả câu hỏi ở đây (ví dụ: in ra thông báo)
        console.log('Không chọn hoặc chọn sai tất cả câu hỏi');
    }

    alert("Điểm số của bạn là: " + $scope.diemSo);
}




        
    // Gọi hàm initialize để khởi tạo dữ liệu khi trang được tải
    $scope.initialize();
}); 