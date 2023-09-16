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
    $scope.checkAnswers = function () {
        $scope.diemSo = 0; // Bắt đầu với điểm số là 0
        var chonDungItNhatMotCauHoi = false; // Biến flag để kiểm tra người dùng đã chọn đúng ít nhất một câu hỏi
    
        $scope.ketQuaCauHoi = []; // Mảng để lưu kết quả từng câu hỏi
    
        for (var i = 0; i < $scope.itemsCauHoi.length; i++) {
            var question = $scope.itemsCauHoi[i];
            var cauTraLoi = (question.cauTraLoi || '').trim().toLowerCase(); // Lấy câu trả lời từ question và loại bỏ khoảng trắng và chuyển thành chữ thường
    
            var dapAn = [];
            if (Array.isArray(question.dapAn)) {
                dapAn = question.dapAn.map(function(answer) {
                    return answer.trim().toLowerCase(); // Loại bỏ khoảng trắng và chuyển thành chữ thường
                });
            } else {
                // Xử lý trường hợp khi dapAn không phải là mảng, ví dụ: thông báo lỗi hoặc gán một giá trị mặc định
                console.error('Lỗi: dapAn không phải là mảng');
                // Hoặc gán một giá trị mặc định cho dapAn
                dapAn = [];
            }
    
            var ketQuaCauHoi = {
                cauHoi: question.cauHoi,
                chonDung: false // Khởi tạo giá trị mặc định là sai
            };
    
            var cauTraLoiArray = cauTraLoi.split(','); // Tách câu trả lời thành một mảng các phần riêng lẻ
    
            if (dapAn.some(function(answer) {
                return cauTraLoiArray.includes(answer);
            })) { // Kiểm tra xem một trong các phần của câu trả lời có chứa đáp án không
                $scope.diemSo++; // Tăng điểm số nếu câu trả lời chứa ít nhất một đáp án
                ketQuaCauHoi.chonDung = true; // Đánh dấu là câu trả lời đúng
                chonDungItNhatMotCauHoi = true; // Đánh dấu là người dùng đã chọn đúng ít nhất một câu hỏi
            }
    
            $scope.ketQuaCauHoi.push(ketQuaCauHoi); // Thêm kết quả câu hỏi vào mảng
            console.log('Câu hỏi số ' + (i + 1) + (ketQuaCauHoi.chonDung ? ': Đúng' : ': Sai'));
        }
    
        if (!chonDungItNhatMotCauHoi) {
            // Xử lý trường hợp không chọn hoặc chọn sai tất cả câu hỏi ở đây (ví dụ: in ra thông báo)
            console.log('Không chọn hoặc chọn sai tất cả câu hỏi');
        }
    
        console.log("Điểm số của bạn là: " + $scope.diemSo); // Sử dụng console.log để hiển thị điểm số
    }
    

        
    // Gọi hàm initialize để khởi tạo dữ liệu khi trang được tải
    $scope.initialize();
}); 