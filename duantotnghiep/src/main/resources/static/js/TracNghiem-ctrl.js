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

        
    // Gọi hàm initialize để khởi tạo dữ liệu khi trang được tải
    $scope.initialize();
}); 