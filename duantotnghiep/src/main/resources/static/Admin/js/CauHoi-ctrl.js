var app = angular.module("myApp", ['ui.bootstrap']);

app.controller("CauHoi-ctrl", function ($scope, $http, $window) {
    $scope.itemsCauHoi = [];
    $scope.formTaiLieu = {};
    $scope.formCauHoi = {};
    $scope.KhoaHoc = {};

    $scope.itemsKhoaHoc = [];
    $scope.formKhoaHoc = {};
    $scope.inputString = [];

    $scope.currentPage = 1; // Trang hiện tại
    $scope.itemsPerPage = 5; // Số hàng trên mỗi trang
    $scope.totalItems = 0; // Tổng số tài liệu
    let selectedAnswer = "";

    $scope.initialize = function () {
        // Load tài liệu
        $http.get("/Admin/rest/CauHoi").then(function (resp) {
            $scope.itemsCauHoi = resp.data;
            $scope.totalItems = $scope.itemsCauHoi.length;
            $scope.pageChanged(); // Hiển thị trang đầu tiên
            console.log($scope.itemsCauHoi);

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
        }).catch(function (error) {
            console.error("An error occurred:", error);
        });

        $http.get("/Admin/rest/KhoaHoc").then(function (resp) {
            $scope.itemsKhoaHoc = resp.data;
            console.log($scope.itemsKhoaHoc);
        });
    };

    // Khởi đầu
    $scope.initialize();

    $scope.loadDocuments = function () {
        const selectedCourseId = $scope.selectedCourse;

        if ($scope.selectedCourse) {
            $http.get("/Admin/rest/CauHoi/" + $scope.selectedCourse).then(function (resp) {
                $scope.itemsCauHoi = resp.data;
                $scope.totalItems = $scope.itemsCauHoi.length;
                $http.get(`/Admin/rest/KhoaHoc/${selectedCourseId}`)
                    .then(function (resp) {
                        $scope.KhoaHoc = resp.data;
                    });
                $scope.pageChanged(); // Hiển thị trang đầu tiên
            });
        } else {
            $http.get("/Admin/rest/CauHoi").then(function (resp) {
                $scope.itemsCauHoi = resp.data;
                $scope.totalItems = $scope.itemsCauHoi.length;
                $http.get(`/Admin/rest/KhoaHoc/${selectedCourseId}`)
                    .then(function (resp) {
                        $scope.KhoaHoc = resp.data;
                    });
                $scope.pageChanged(); // Hiển thị trang đầu tiên
            });
        }
    };

    $scope.pageChanged = function () {
        var startIndex = ($scope.currentPage - 1) * $scope.itemsPerPage;
        var endIndex = startIndex + $scope.itemsPerPage;
        $scope.displayedItems = $scope.itemsCauHoi.slice(startIndex, endIndex);
        console.log($scope.itemsCauHoi);
        console.log($scope.displayedItems);
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



    let answerCount = 2; // Starting count for dynamic answer fields
    let cauTraLoiString = ""; // Biến để theo dõi chuỗi câu trả lời

    $scope.addAnswerField = function () {
        if (answerCount <= 4) { // Limit to 5 dynamic answer fields
            const dynamicAnswers = document.getElementById('dynamicAnswers');
            const newAnswerField = document.createElement('div');
            newAnswerField.classList.add('form-group');
            newAnswerField.innerHTML = `<input type="radio" name="correctAnswer" class="answer-radio">
        <input type="text" class="form-control" placeholder="TraLoi${answerCount + 1}" value="">`;
            dynamicAnswers.appendChild(newAnswerField);
            answerCount++;

            // Gán sự kiện "change" cho radio button mới thêm
            const newRadio = newAnswerField.querySelector('.answer-radio');
            newRadio.addEventListener('change', $scope.showSelectedAnswer);

            // Tạo nút xóa cho input câu trả lời mới
            const deleteButton = document.createElement('button');
            deleteButton.classList.add('btn', 'btn-danger', 'ml-2');
            deleteButton.textContent = 'Xóa';
            deleteButton.addEventListener('click', function () {
                // Xóa input câu trả lời khi nút xóa được nhấn
                dynamicAnswers.removeChild(newAnswerField);
                answerCount--;

                // Cập nhật biến chuỗi câu trả lời sau khi xóa
                const deletedAnswerValue = newAnswerField.querySelector('input[type="text"]').value;
                cauTraLoiString = cauTraLoiString.replace(deletedAnswerValue, '').trim();

                // Cập nhật giá trị của input nối chuỗi
                const cauHoiInput = document.getElementById('cauHoiInput');
                cauHoiInput.value = cauTraLoiString;
            });

            // Thêm nút xóa vào input câu trả lời mới
            newAnswerField.appendChild(deleteButton);
        }
    }

    $scope.addNewAnswer = function () {
        const newAnswer = document.getElementById('newAnswer').value;
        if (newAnswer !== "") {
            const dynamicAnswers = document.getElementById('dynamicAnswers');
            const newAnswerField = document.createElement('div');
            newAnswerField.classList.add('form-group');
            newAnswerField.innerHTML = `<input type="radio" name="correctAnswer" class="answer-radio">
            <input type="text" class="form-control" placeholder="${newAnswer}" value="${newAnswer}">`;
            dynamicAnswers.appendChild(newAnswerField);
            answerCount++;
            document.getElementById('newAnswer').value = ""; // Clear the input field

            // Cập nhật biến chuỗi câu trả lời sau khi thêm
            if (cauTraLoiString === "") {
                cauTraLoiString = newAnswer;
            } else {
                // Thêm dấu ',' vào chuỗi câu trả lời nếu chuỗi hiện tại không kết thúc bằng dấu ','
                if (!cauTraLoiString.endsWith(',')) {
                    cauTraLoiString += ',';
                }
                cauTraLoiString += newAnswer;

                // Sử dụng regex để xóa các dấu ',' liên tiếp (2 hoặc nhiều dấu ',') và thay thế bằng một dấu ','
                cauTraLoiString = cauTraLoiString.replace(/,+/g, ',').trim();
            }

            // Cập nhật giá trị của input nối chuỗi
            const cauHoiInput = document.getElementById('cauHoiInput');
            cauHoiInput.value = cauTraLoiString;

            // Gán sự kiện "change" cho radio button mới thêm
            const newRadio = newAnswerField.querySelector('.answer-radio');
            newRadio.addEventListener('change', $scope.showSelectedAnswer);

            // Tạo nút xóa cho input câu trả lời mới
            const deleteButton = document.createElement('button');
            deleteButton.classList.add('btn', 'btn-danger', 'ml-2');
            deleteButton.textContent = 'Xóa';
            deleteButton.addEventListener('click', function () {
                // Xóa input câu trả lời khi nút xóa được nhấn
                dynamicAnswers.removeChild(newAnswerField);
                answerCount--;

                // Cập nhật biến chuỗi câu trả lời sau khi xóa
                const deletedAnswerValue = newAnswerField.querySelector('input[type="text"]').value;
                cauTraLoiString = cauTraLoiString.replace(deletedAnswerValue + ',', '').trim();

                // Sử dụng regex để xóa các dấu ',' liên tiếp (2 hoặc nhiều dấu ',') và thay thế bằng một dấu ','
                cauTraLoiString = cauTraLoiString.replace(/,+/g, ',').trim();

                // Kiểm tra nếu chỉ còn một câu trả lời thì không thực hiện xóa nữa
                if (cauTraLoiString === newAnswer) {
                    cauTraLoiString = "";
                }

                // Cập nhật giá trị của input nối chuỗi
                cauHoiInput.value = cauTraLoiString;
            });

            // Thêm nút xóa vào input câu trả lời mới
            newAnswerField.appendChild(deleteButton);
        }
    }



    $scope.showSelectedAnswer = function () {
        const answerRadios = document.querySelectorAll('.answer-radio'); // Lấy tất cả các radio buttons

        answerRadios.forEach(radio => {
            if (radio.checked) {
                // Nếu radio được chọn, lấy giá trị của nó
                selectedAnswer = radio.nextElementSibling.value;
            }
        });

        if (selectedAnswer !== "") {
            alert(`Đáp án đã chọn: ${selectedAnswer}`);
        } else {
            alert("Bạn chưa chọn đáp án nào.");
        }
    }


    $scope.showSelectedAnswer = function () {
        const answerRadios = document.querySelectorAll('.answer-radio'); // Lấy tất cả các radio buttons

        answerRadios.forEach(radio => {
            if (radio.checked) {
                // Nếu radio được chọn, lấy giá trị của nó
                selectedAnswer = radio.nextElementSibling.value;
            }
        });

        if (selectedAnswer !== "") {
            alert(`Đáp án đã chọn: ${selectedAnswer}`);
        } else {
            alert("Bạn chưa chọn đáp án nào.");
        }
    }
    // Trong hàm $scope.create
    $scope.create = function () {
        if ($scope.formCauHoi.cauHoi === "" || $scope.formCauHoi.cauHoi === undefined) {
            alert("Vui lòng nhập câu hỏi.");
            return; // Dừng hàm nếu selectedAnswer không hợp lệ
        } else if ($scope.KhoaHoc.id === "" || $scope.KhoaHoc.id === undefined || $scope.KhoaHoc.id === null) {
            alert("Vui lòng chọn khóa học.");
            return; // Dừng hàm nếu selectedAnswer không hợp lệ
        } else if (document.getElementById('cauHoiInput').value === "") {
            alert("Vui lòng nhập câu trả lời.");
            return; // Dừng hàm nếu cauTraLoi không hợp lệ
        } else if (selectedAnswer === "") {
            alert("Vui lòng chọn đáp án.");
            return; // Dừng hàm nếu selectedAnswer không hợp lệ
        }


        $scope.formCauHoi.cauTraLoi = document.getElementById('cauHoiInput').value;
        $scope.formCauHoi.dapAn = selectedAnswer;
        $scope.formCauHoi.khoaHoc = $scope.KhoaHoc;
        $scope.formCauHoi.ngayTao = new Date();

        console.log($scope.formCauHoi);

        $http.post(`/Admin/rest/CauHoi`, $scope.formCauHoi)
            .then(function (resp) {
                $scope.itemsCauHoi.push(resp.data);
                $scope.formCauHoi = {};
                $scope.initialize();
                alert("Thêm mới thành công");
                $scope.reset();
            })
            .catch(function (err) {
                alert("Error: " + err);
            });
    };


    $scope.reset = function () {
        $scope.formCauHoi = {};
    }


});
