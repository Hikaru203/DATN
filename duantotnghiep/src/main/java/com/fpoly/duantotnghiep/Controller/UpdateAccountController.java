package com.fpoly.duantotnghiep.Controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;

@Controller
public class UpdateAccountController {

    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    @GetMapping("/courseOnline/updateAccount")
    public String showUpdateAccountForm(Model model, Principal principal) {
        // Lấy tên người dùng hiện tại từ Principal
        String currentUsername = principal.getName();

        // Tìm kiếm thông tin người dùng theo tên người dùng
        NguoiDung nguoiDung = nguoiDungRepository.findByUsername(currentUsername);

        // Kiểm tra xem người dùng có tồn tại không
        if (nguoiDung != null) {
            // Đặt thông tin người dùng vào model để hiển thị trên form
            model.addAttribute("nguoiDung", nguoiDung);
            return "updateAccount";
        } else {
            // Xử lý khi không tìm thấy thông tin người dùng
            return "redirect:/courseOnline/index"; // Chẳng hạn chuyển hướng về trang chính
        }
    }

    @PostMapping("/courseOnline/updateAccount")
    public String updateAccount(@ModelAttribute NguoiDung nguoiDung) {
        // Thực hiện logic cập nhật thông tin người dùng
        // Ví dụ: nguoiDungService.updateNguoiDung(nguoiDung);

        return "redirect:/courseOnline/index";
    }
  
}
