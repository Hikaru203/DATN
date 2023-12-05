package com.fpoly.duantotnghiep.service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import com.fpoly.duantotnghiep.Entity.NguoiDung;
public interface NguoiDungService {

    List<NguoiDung> findAll();

    NguoiDung findNguoiDungById(int id);

    NguoiDung save(NguoiDung nguoiDung);

    List<NguoiDung> findByHoTen(String kw);

    boolean existsById(int id);

    Optional<NguoiDung> findById(int id);
    NguoiDung getNguoiDungById(int id);
   
    void deleteById(int id, String filename);

    void updateNguoiDung(int id, NguoiDung updatedNguoiDung);

	NguoiDung addNguoiDung(NguoiDung nguoiDung, MultipartFile file) throws IOException;
}