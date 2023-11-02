if(location.href == location.origin + "/auth/blocked"){
    alert("Thông báo: Tài khoản chưa xác minh")
}
if(location.href == location.origin + "/auth/login_error"){
    alert("Sai tài khoản hoặc mật khẩu")
}
if(location.href == location.origin + "/courseOnline/EmailError"){
    alert("Email không tồn tại")
}

