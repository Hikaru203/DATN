package com.fpoly.duantotnghiep.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;
import com.fpoly.duantotnghiep.service.AccountUpdateService;

import jakarta.transaction.Transactional;

@Service
public class AccountUpdateServiceImpl implements AccountUpdateService {

    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    @Override
    public NguoiDung getAccountInfo(String username) {
        return nguoiDungRepository.findByTaiKhoan(username);
    }

    @Override
    public NguoiDung updateAccountInfo(String username, NguoiDung updatedNguoiDung) {
        NguoiDung existingNguoiDung = nguoiDungRepository.findByTaiKhoan(username);

        if (existingNguoiDung != null) {
        	  existingNguoiDung.setHoTen(updatedNguoiDung.getHoTen());
              existingNguoiDung.setEmail(updatedNguoiDung.getEmail());
              existingNguoiDung.setMatKhau(updatedNguoiDung.getMatKhau());
              existingNguoiDung.setSoDienThoai(updatedNguoiDung.getSoDienThoai());
              existingNguoiDung.setHinhAnh(updatedNguoiDung.getHinhAnh());

            return nguoiDungRepository.save(existingNguoiDung);
        } else {
            return null;
        }
    }


    @Override
    public NguoiDung getCurrentUserInfo() {
        // Lấy thông tin người dùng từ đối tượng Authentication
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        return nguoiDungRepository.findByTaiKhoan(username);
    }

    @Override
    @Transactional
    public void updateUserInfo(String hoTen, String email, String matKhau, String soDienThoai, MultipartFile file) throws IOException {
        NguoiDung nguoiDung = getCurrentUserInfo();

        nguoiDung.setHoTen(hoTen);
        nguoiDung.setEmail(email);
        nguoiDung.setMatKhau(matKhau);
        nguoiDung.setSoDienThoai(soDienThoai);

        if (file != null && !file.isEmpty()) {
            // Lưu hình ảnh trong project, tên file giữ nguyên
            String fileName = file.getOriginalFilename();
            String filePath = "/Admin/img/User/" + fileName; // Đường dẫn thư mục lưu hình ảnh
            // Lưu hình ảnh
            Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
            // Cập nhật tên hình ảnh trong đối tượng NguoiDung
            nguoiDung.setHinhAnh(fileName);
        }

        nguoiDungRepository.save(nguoiDung);
    }

   
}
