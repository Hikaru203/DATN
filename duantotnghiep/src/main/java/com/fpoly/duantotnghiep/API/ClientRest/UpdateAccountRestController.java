package com.fpoly.duantotnghiep.API.ClientRest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.core.Authentication;
import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;

@RestController
@RequestMapping("/api/account")
public class UpdateAccountRestController {

    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    @GetMapping("/info")
    public ResponseEntity<NguoiDung> getAccountInfo(Authentication authentication) {
        // Lấy thông tin người dùng từ đối tượng Authentication
        String username = authentication.getName();
        NguoiDung nguoiDung = nguoiDungRepository.findByTaiKhoan(username);

        return nguoiDung != null ?
                ResponseEntity.ok(nguoiDung) :
                ResponseEntity.notFound().build();
    }

    @PutMapping("/update")
    public ResponseEntity<NguoiDung> updateAccountInfo(
            Authentication authentication,
            @RequestBody NguoiDung updatedNguoiDung) {
        // Lấy thông tin người dùng từ đối tượng Authentication
        String username = authentication.getName();
        NguoiDung existingNguoiDung = nguoiDungRepository.findByTaiKhoan(username);

        if (existingNguoiDung != null) {
            // Cập nhật các trường cần thiết từ updatedNguoiDung
            if (updatedNguoiDung.getHoTen() != null) {
                existingNguoiDung.setHoTen(updatedNguoiDung.getHoTen());
            }
            if (updatedNguoiDung.getEmail() != null) {
                existingNguoiDung.setEmail(updatedNguoiDung.getEmail());
            }
            if (updatedNguoiDung.getMatKhau() != null) {
                existingNguoiDung.setMatKhau(updatedNguoiDung.getMatKhau());
            }
            if (updatedNguoiDung.getSoDienThoai() != null) {
                existingNguoiDung.setSoDienThoai(updatedNguoiDung.getSoDienThoai());
            }
            if (updatedNguoiDung.getHinhAnh() != null) {
            	existingNguoiDung.setHinhAnh(updatedNguoiDung.getHinhAnh());
            }
            // Các trường thông tin khác có thể được cập nhật tương tự

            // Lưu lại thông tin người dùng
            NguoiDung updatedAccount = nguoiDungRepository.save(existingNguoiDung);
            return ResponseEntity.ok(updatedAccount);
        } else {
            return ResponseEntity.notFound().build();
        }
    }


}
