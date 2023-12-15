if(location.href == location.origin + "/auth/blocked"){

    showSuccessMessage("error", "Tài khoản chưa được xác minh", 'Vui lòng xác minh tài khoản')
   
}
if(location.href == location.origin + "/auth/login_error"){

    showSuccessMessage("error", "Đăng nhập thất bại", 'Sai tài khoản hoặc mật khẩu')
}

if(location.href == location.origin + "/courseOnline/EmailError"){
  showSuccessMessage("error", "Email không tồi tại", 'Vui lòng kiểm tra lại')
}
if(location.href == location.origin + "/courseOnline/OTPError"){
  showSuccessMessage("error", "Vui lòng nhập OTP ", 'Rồi mới đổi mật khẩu')

}
//Bắt hiển thị với ẩn mật khẩu
const pass_field = document.querySelector('.pass-key');
const showBtn = document.querySelector('.show');

showBtn.addEventListener('click', function () {
  if (pass_field.type === 'password') {
    pass_field.type = 'text';
    showBtn.innerHTML = '<i class="fas fa-eye-slash"></i>';
    showBtn.style.color = '#ff0000';
  } else {
    pass_field.type = 'password';
    showBtn.innerHTML = '<i class="fas fa-eye"></i>';
    showBtn.style.color = '#222';
  }
});
// End Hiển thị mẩu khẩu
function showSuccessMessage(icon, tile, text,) {
  Swal.fire({
      icon: icon,
      title: tile,
      text: text,
      confirmButtonText: 'Đóng',
  });

}
