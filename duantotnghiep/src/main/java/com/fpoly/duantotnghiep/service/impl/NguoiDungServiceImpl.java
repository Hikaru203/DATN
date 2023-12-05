package com.fpoly.duantotnghiep.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;
import java.io.InputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;
import com.fpoly.duantotnghiep.service.NguoiDungService;

@Service
@Transactional
public class NguoiDungServiceImpl implements NguoiDungService {

    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    private static final String IMAGE_DIRECTORY = "";

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
    public List<NguoiDung> findByHoTen(String hoTen) {
        return (List<NguoiDung>) nguoiDungRepository.findByHoTen(hoTen);
    }

    @Override
    public boolean existsById(int id) {
        return nguoiDungRepository.existsById(id);
    }

    @Override
    public void deleteById(int id, String filename) {
        Optional<NguoiDung> nguoiDungOptional = nguoiDungRepository.findById(id);

        nguoiDungOptional.ifPresent(nguoiDung -> {
            try {
                Path imagePath = Paths.get(IMAGE_DIRECTORY, filename);
                Files.deleteIfExists(imagePath);
            } catch (IOException e) {
                // Handle or log the exception, depending on your requirements
                e.printStackTrace();
            }

            nguoiDungRepository.deleteById(id);
        });
    }

    @Override
    public void updateNguoiDung(int id, NguoiDung updatedNguoiDung) {
        Optional<NguoiDung> existingNguoiDungOptional = nguoiDungRepository.findById(id);

        existingNguoiDungOptional.ifPresent(existingNguoiDung -> {
            // Perform the update
            existingNguoiDung.setTaiKhoan(updatedNguoiDung.getTaiKhoan());
            existingNguoiDung.setMatKhau(updatedNguoiDung.getMatKhau());
            existingNguoiDung.setHoTen(updatedNguoiDung.getHoTen());
            existingNguoiDung.setEmail(updatedNguoiDung.getEmail());
            existingNguoiDung.setSoDienThoai(updatedNguoiDung.getSoDienThoai());
            existingNguoiDung.setChucVu(updatedNguoiDung.getChucVu());
            existingNguoiDung.setHinhAnh(updatedNguoiDung.getHinhAnh());
            existingNguoiDung.setTrangThai(updatedNguoiDung.getTrangThai());

            nguoiDungRepository.save(existingNguoiDung);
        });
    }

    @Override
    public NguoiDung findNguoiDungById(int id) {
        return nguoiDungRepository.findById(id).orElse(null);
    }

    @Override
    public NguoiDung getNguoiDungById(int id) {
        return nguoiDungRepository.findById(id).orElse(null);
    }

    @Override
    public NguoiDung addNguoiDung(NguoiDung nguoiDung, MultipartFile file) throws IOException {
        // Lưu hình ảnh vào thư mục
        if (file != null && !file.isEmpty()) {
            String uploadDir = "src/main/resources/static/images/nguoidung";
            String fileName = UUID.randomUUID().toString() + "_" + Objects.requireNonNull(file.getOriginalFilename()).replace(" ", "");
            Path uploadPath = Paths.get(uploadDir);

            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            try (InputStream inputStream = file.getInputStream()) {
                Path filePath = uploadPath.resolve(fileName);
                Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
                nguoiDung.setHinhAnh("/images/nguoidung/" + fileName);
            }
        }
        // Lưu thông tin người dùng vào cơ sở dữ liệu
        return nguoiDungRepository.save(nguoiDung);

    }}
