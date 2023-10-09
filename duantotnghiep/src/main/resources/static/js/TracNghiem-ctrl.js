var app = angular.module("myApp", []);
app.controller("TracNghiem-ctrl", function ($scope, $http, $window) {
    $scope.itemsCauHoi = [];

    $scope.initialize = function () {
        // Gọi API để tải dữ liệu câu hỏi từ đường dẫn "/rest/TracNghiem"
        $http.get("/rest/tracnghiem").then(resp => {
            $scope.itemsCauHoi = resp.data;
            //console.log("API Response:", resp.data)
        }
        );
    }
    $scope.danhSachKhoaHoc = [];
    $scope.questionAnswerArray = [];
    $scope.selectedKhoaHoc = null; // Giá trị mặc định
    $scope.selectedAnswers = []
    $scope.selectedKhoaHoc = ''; // Giá trị khoá học được chọn


    // Hàm tải danh sách khóa học từ REST API
    $scope.loadDanhSachKhoaHoc = function () {
        $http.get("/Admin/rest/KhoaHoc").then(function (response) {
            $scope.danhSachKhoaHoc = response.data;
            //console.log("Dữ liệu khóa học", $scope.danhSachKhoaHoc);
        });
    };

    // Hàm xử lý khi thay đổi khoá học
    $scope.chonKhoaHoc = function (selectedKhoaHoc) {
        if (selectedKhoaHoc) {
            $http.get(`/rest/tracnghiem/${selectedKhoaHoc}`)
                .then(function (resp) {
                    $scope.itemsCauHoi = resp.data;

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
                            //console.log("Question and answer object:", questionObject);
                        } else {
                            console.log("'cauTraLoi' does not exist or has no value for an item.");
                        }
                    }
                    // console.log("Question and answer array:", questionAnswerArray);
                    $scope.questionAnswerArray = questionAnswerArray;
                })
                .catch(function (error) {
                    console.error("An error occurred:", error);
                });
        } else {
            // Xử lý khi không có khoá học nào được chọn
        }
    };
    // Hàm tính điểm
    $scope.checkAnswers = function() {
        $scope.soCauDung = 0;
        $scope.soCauSai = 0;
        $scope.msg = '';
        
        // Thêm một thuộc tính 'isCorrect' vào mỗi câu hỏi để xác định câu hỏi có đúng hay sai
        for (const question of $scope.questionAnswerArray) {
            if (question.selectedAnswer === undefined) {
                $scope.msg = 'Bạn chưa chọn đáp án cho tất cả các câu hỏi.';
                return;
            } else {
                if (question.selectedAnswer === question.dapAn) {
                    $scope.soCauDung++;
                    question.isCorrect = true; // Đánh dấu câu hỏi này là đúng
                } else {
                    $scope.soCauSai++;
                    question.isCorrect = false; // Đánh dấu câu hỏi này là sai
                }
            }
            console.log("A: " + question.selectedAnswer);
            console.log("B: " + question.dapAn);
            question.isAnswered = true; // Đánh dấu câu hỏi này đã được trả lời
        }
    
        // Kiểm tra xem tất cả câu hỏi đã được chọn
        if ($scope.soCauDung + $scope.soCauSai === $scope.questionAnswerArray.length) {
            $scope.msg = ''; // Đặt lại thông báo nếu tất cả câu hỏi đã được chọn
        }
    };
    
    $scope.hasUnansweredQuestions = function() {
        for (const question of $scope.questionAnswerArray) {
            if (question.selectedAnswer === undefined) {
                return true; // Còn câu hỏi chưa được trả lời
            }
        }
        return false; // Tất cả câu hỏi đã được trả lời
    };    
    // Gọi hàm initialize để khởi tạo dữ liệu khi trang được tải
    $scope.loadDanhSachKhoaHoc();
    $scope.selectAnswer = function (questionIndex, answer) {
        $scope.selectedAnswers[questionIndex] = answer;
        console.log(questionIndex);
    }
    $scope.initialize();
});
