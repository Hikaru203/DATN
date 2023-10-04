var app = angular.module("myApp", []);
app.controller("TracNghiem-ctrl", function ($scope, $http, $window) {
    $scope.itemsCauHoi = [];

    $scope.initialize = function () {
        // Gọi API để tải dữ liệu câu hỏi từ đường dẫn "/rest/TracNghiem"
        $http.get("/rest/tracnghiem").then(resp => {
            $scope.itemsCauHoi = resp.data;
            console.log("API Response:", resp.data)

            $scope.danhSachKhoaHoc = [];
            $scope.questionAnswerArray = [];
            $scope.selectedKhoaHoc = null; // Giá trị mặc định
            $scope.selectedAnswers = []
            $scope.selectedKhoaHoc = ''; // Giá trị khoá học được chọn


            // Hàm tải danh sách khóa học từ REST API
            $scope.loadDanhSachKhoaHoc = function () {
                $http.get("/Admin/rest/KhoaHoc").then(function (response) {
                    $scope.danhSachKhoaHoc = response.data;
                    // console.log("Dữ liệu khóa học", $scope.danhSachKhoaHoc);
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
                                    console.log("Question and answer object:", questionObject);
                                } else {
                                    console.log("'cauTraLoi' does not exist or has no value for an item.");
                                }
                            }
                            console.log("Question and answer array:", questionAnswerArray);
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
            // Hàm tính điểm
            $scope.checkAnswers = function () {
                $scope.diemSo = 0; // Bắt đầu với điểm số là 0
                var chonDungItNhatMotCauHoi = false; // Biến flag để kiểm tra người dùng đã chọn đúng ít nhất một câu hỏi

                $scope.ketQuaCauHoi = []; // Mảng để lưu kết quả từng câu hỏi

                for (var i = 0; i < $scope.itemsCauHoi.length; i++) {
                    var question = $scope.itemsCauHoi[i];
                    var cauTraLoi = (question.cauTraLoi || '').trim().toLowerCase(); // Lấy câu trả lời từ question và loại bỏ khoảng trắng và chuyển thành chữ thường

                    var dapAn = [];
                    console.log("Dap an:", question.dapAn);
                    if (Array.isArray(question.dapAn)) {
                        dapAn = question.dapAn.map(function (answer) {
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

                    var cauTraLoiDaChon = (question.selectedAnswer || '').trim().toLowerCase(); // Lấy đáp án đã chọn từ mô hình và chuyển thành chữ thường

                    if (dapAn.some(function (answer) {
                        return cauTraLoiDaChon === answer;
                    })) { // Kiểm tra xem đáp án đã chọn có chứa trong danh sách đáp án không
                        $scope.diemSo++; // Tăng điểm số nếu đáp án đã chọn là đúng
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
            $scope.loadDanhSachKhoaHoc();

            $scope.selectAnswer = function (questionIndex, answer) {
                $scope.selectedAnswers[questionIndex] = answer;
                console.log(questionIndex);

            }


        }
        );
    }
    $scope.initialize();

});
