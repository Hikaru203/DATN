package com.fpoly.duantotnghiep.jparepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.duantotnghiep.Entity.LoaiKhoaHoc;

public interface LoaiKhoaHocRepository extends JpaRepository<LoaiKhoaHoc, Integer> {
    // You can add custom query methods here if needed
    List<LoaiKhoaHoc> findAllById(Integer loai);

}
