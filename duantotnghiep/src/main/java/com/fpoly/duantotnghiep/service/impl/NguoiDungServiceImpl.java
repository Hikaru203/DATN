package com.fpoly.duantotnghiep.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;
import com.fpoly.duantotnghiep.service.NguoiDungService;

@Service
@Transactional
public class NguoiDungServiceImpl implements NguoiDungService {

    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    @Override
    public List<NguoiDung> findAll() {
        Sort sort = Sort.by(Direction.ASC, "hoTen");
        return nguoiDungRepository.findAll(sort);
    }

    @Override
    public Optional<NguoiDung> findById(int id) {
        return nguoiDungRepository.findById(id);
    }

    @Override
    public NguoiDung save(NguoiDung nguoiDung) {
        return nguoiDungRepository.save(nguoiDung);
    }

    @Override
    public List<NguoiDung> findByHoTen(String kw) {
        return (List<NguoiDung>) nguoiDungRepository.findByHoTen(kw);
    }

    @Override
    public boolean existsById(int id) {
        return nguoiDungRepository.existsById(id);
    }

    @Override
    public void deleteById(int id, String filename) {
        Optional<NguoiDung> nguoiDungOptional = nguoiDungRepository.findById(id);

        if (nguoiDungOptional.isPresent()) {
            NguoiDung nguoiDung = nguoiDungOptional.get();

            // Xóa file hình ảnh (nếu có)
            if (filename != null && !filename.isEmpty()) {
                // Thực hiện logic xóa file dựa trên filename
                try {
                    Path imagePath = Paths.get("your_image_directory", filename);
                    Files.deleteIfExists(imagePath);
                } catch (IOException e) {
                    // Xử lý exception nếu có
                    e.printStackTrace();
                }
            }

            // Thực hiện xóa người dùng
            nguoiDungRepository.deleteById(id);
        } else {
            System.out.println("Không tìm thấy tài khoản ");
        }
    }


    @Override
    public void updateNguoiDung(int id, NguoiDung nguoiDung) {
        Optional<NguoiDung> existingNguoiDungOptional = nguoiDungRepository.findById(id);

        if (existingNguoiDungOptional.isPresent()) {
            NguoiDung existingNguoiDung = existingNguoiDungOptional.get();

            // Thực hiện cập nhật
            existingNguoiDung.setTaiKhoan(nguoiDung.getTaiKhoan());
            existingNguoiDung.setMatKhau(nguoiDung.getMatKhau());
            existingNguoiDung.setHoTen(nguoiDung.getHoTen());
            existingNguoiDung.setEmail(nguoiDung.getEmail());
            existingNguoiDung.setSoDienThoai(nguoiDung.getSoDienThoai());
            existingNguoiDung.setChucVu(nguoiDung.getChucVu());
            existingNguoiDung.setHinhAnh(nguoiDung.getHinhAnh());
            existingNguoiDung.setTrangThai(nguoiDung.getTrangThai());

            nguoiDungRepository.save(existingNguoiDung);
        } else {
            // Xử lý trường hợp không tìm thấy người dùng với ID tương ứng
            // Có thể ném một exception hoặc xử lý tùy thuộc vào yêu cầu của bạn
        	
        }
    }

    @Override
    public NguoiDung findNguoiDungById(int id) {
        Optional<NguoiDung> optionalNguoiDung = nguoiDungRepository.findById(id);
        return optionalNguoiDung.orElse(null);
    }
}
