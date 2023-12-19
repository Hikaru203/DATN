package com.fpoly.duantotnghiep.API.ClientRest;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
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
    public ResponseEntity<NguoiDung> updateAccountInfo(@RequestParam(name = "hinhAnh", required = false) MultipartFile file,
            Authentication authentication,
            @RequestPart("user") NguoiDung updatedNguoiDung )  throws IOException {
    	
    	
    	
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
            
         // Process the uploaded file
            if (!file.isEmpty()) {
                byte[] bytes = file.getBytes();

                // Specify the directory where you want to save the file
                String uploadPath = "src/main/resources/static/img/user/";

                // Generate a unique filename
                String fileName = System.currentTimeMillis() + "-" + file.getOriginalFilename();

                // Create the complete file path
                String filePath = uploadPath + fileName;

                // Save the file
                java.nio.file.Path nioPath = Paths.get(filePath); // Sử dụng java.nio.file.Path

                Files.write(nioPath, bytes);
                existingNguoiDung.setHinhAnh(fileName);
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
