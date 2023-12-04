var app = angular.module("myApp", []);

app.controller("revenue-ctrl", function ($scope, $http, $window) {
    $scope.items = [];
    $scope.form = {};
    $scope.thoigian = {};
    $scope.loadKhoaHoc = [];

    //định dạng tiền
    $scope.formatCurrency = function (amount) {
        // Chuyển đổi số tiền thành chuỗi và loại bỏ số 0 ở cuối
        return numeral(amount).format('0,0') + ' VND';
    };

    $scope.ThongKeTheoThoiGian = function () {
        $scope.convertToMoment();

        $http.get(apiEndpoints.thongKeThoiGian, {
            params: {
                batDau: $scope.thoigian.batDau,
                ketThuc: $scope.thoigian.ketThuc
            }
        }).then(resp => {
            $scope.items = resp.data;
            $scope.renderChart("revenue-chart");
        });
    }

    $scope.modalItem = {}; // Đối tượng lưu trữ dữ liệu của mục được chọn

    $scope.editbr = function (item) {
        $scope.modalItem = angular.copy(item);
        $scope.openModal();
    };
    
    $scope.openModal = function () {
        document.getElementById('myModal').style.display = 'block';
        $scope.renderChart("revenue-chart2");
    };
    
    $scope.closeModal = function () {
        document.getElementById('myModal').style.display = 'none';
    };
    

    $scope.initialize = function () {
        $scope.setupHelpers();
        $http.get(apiEndpoints.report).then(resp => {
            $scope.items = resp.data;
            $scope.renderChart("revenue-chart");
        });

        // load Khóa học
        $http.get("/rest/admin/KhoaHoc").then(resp => {
            // Chuyển đổi ngày giờ sang múi giờ Việt Nam
            resp.data.forEach(item => {
                item.ngayTao = moment(item.ngayTao).utcOffset(7).format('DD-MM-YYYY HH:mm:ss');
            });
            $scope.loadKhoaHoc = resp.data;
        });

    }

    $scope.setupHelpers = function () {
        $scope.formatTotalPrice = function (totalPrice) {
            return numeral(totalPrice).format('0,0') + ' VND';
        };

        $scope.formatDate = function (year, month) {
            const date = moment(`${year}-${month}`, 'YYYY-M').format('MM YYYY');
            return date.charAt(0).toUpperCase() + date.slice(1);
        };
    }

    $scope.renderChart = function (name) {
        
        
        // Extract data for chart
        const labels = $scope.items.map(item => $scope.formatDate(item.year, item.month));
        const data = $scope.items.map(item => item.totalRevenue);
        // Tính tổng doanh thu
        $scope.totalRevenue = $scope.items.reduce((total, item) => total + item.totalRevenue, 0);
        // Get the canvas element
        const canvas = document.getElementById(name);

        // Destroy the existing chart if any
        if ($scope.myChart) {
            $scope.myChart.destroy();
        }

        // Create the chart using Chart.js
        const ctx = canvas.getContext("2d");
        $scope.myChart = new Chart(ctx, {
            type: "bar",
            data: {
                labels: labels,
                datasets: [{
                    label: "Tổng doanh thu/tháng",
                    data: data,
                    backgroundColor: "rgba(75, 192, 192, 0.2)",
                    borderColor: "rgba(75, 192, 192, 1)",
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: function (value, index, values) {
                                return $scope.formatTotalPrice(value);
                            }
                        }
                    }
                }
            }
        });
    }

    $scope.convertToMoment = function () {

        $scope.thoigian.batDau = moment($scope.thoigian.batDau).toDate();
        $scope.thoigian.ketThuc = moment($scope.thoigian.ketThuc).toDate();

    }
    

    // Constants for API endpoints
    var apiEndpoints = {
        report: "/rest/Report",
        thongKeThoiGian: "/rest/Report/thong-ke-thoi-gian"
    };

    // Initialize
    $scope.initialize();

    $scope.pager = {
        page: 0,
        size: 5,
        get loadKhoaHoc() {
            var start = this.page * this.size;
            return $scope.loadKhoaHoc.slice(start, start + this.size);
        },

        get count() {
            return Math.ceil(1.0 * $scope.loadKhoaHoc.length / this.size);
        },

        first() {
            this.page = 0;
        },
        prev() {
            this.page--;
            if (this.page < 0) {
                this.last();
            }
        },
        next() {
            this.page++;
            if (this.page >= this.count) {
                this.first();
            }
        },
        last() {
            this.page = this.count - 1;
        }
    }
});
