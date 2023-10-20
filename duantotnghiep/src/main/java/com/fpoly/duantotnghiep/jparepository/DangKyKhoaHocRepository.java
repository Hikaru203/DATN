package com.fpoly.duantotnghiep.jparepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.duantotnghiep.Entity.DangKyKhoaHoc;

public interface DangKyKhoaHocRepository extends JpaRepository<DangKyKhoaHoc, Integer> {
    // You can add custom query methods here if needed

    DangKyKhoaHoc save(DangKyKhoaHoc entity);

    List<DangKyKhoaHoc> findAll();

    DangKyKhoaHoc findByNguoiDungIdAndKhoaHocId(int idNguoiDung, int idKhoaHoc);
}
