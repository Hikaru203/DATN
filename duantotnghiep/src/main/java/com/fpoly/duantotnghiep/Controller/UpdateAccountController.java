package com.fpoly.duantotnghiep.Controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;

import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.service.AccountUpdateService;

@Controller
@RequestMapping("/courseOnline/")
public class UpdateAccountController {

    @Autowired
    private AccountUpdateService accountUpdateService;

    @GetMapping("/updateAccount")
    public String showUpdateForm(Model model, Authentication authentication) {
        NguoiDung currentUser = accountUpdateService.getCurrentUserInfo();
        model.addAttribute("currentUser", currentUser);
        return "updateAccount";
    }



    @PostMapping("/update")
    public ResponseEntity<NguoiDung> updateAccountInfo(
            Authentication authentication,
            @RequestParam("file") MultipartFile file,
            @ModelAttribute NguoiDung updatedNguoiDung) throws IOException {
        accountUpdateService.updateUserInfo(
                updatedNguoiDung.getHoTen(),
                updatedNguoiDung.getEmail(),
                updatedNguoiDung.getMatKhau(),
                updatedNguoiDung.getSoDienThoai(),
                file);
        return ResponseEntity.ok().build();
    }
   
}