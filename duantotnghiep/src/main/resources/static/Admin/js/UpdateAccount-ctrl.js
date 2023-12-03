$(document).ready(function() {
    $("#updateForm").submit(function(event) {
        event.preventDefault();
        var id = $("#userId").val();
var updateUrl = "/courseOnline/updateAccount" + id;


        var hoTen = $("#hoTen").val();
        var email = $("#email").val();
        var soDienThoai = $("#soDienThoai").val();
        var avatarUrl = $("#HinhAnh").attr("src");

        var nguoiDung = {
            id: id,
            hoTen: hoTen,
            email: email,
            soDienThoai: soDienThoai,
            hinhAnh: avatarUrl
        };

        $.ajax({
            type: "POST",
            url: updateUrl,
            contentType: "application/json",
            data: JSON.stringify(nguoiDung),
            success: function(response) {
                // Xử lý phản hồi từ máy chủ
                console.log(response);
            },
            error: function(xhr, status, error) {
                // Xử lý lỗi
                console.log(error);
            }
        });
    });
});
