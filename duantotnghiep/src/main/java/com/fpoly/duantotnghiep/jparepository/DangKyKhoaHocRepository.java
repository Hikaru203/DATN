package com.fpoly.duantotnghiep.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.duantotnghiep.Entity.DangKyKhoaHoc;

public interface DangKyKhoaHocRepository extends JpaRepository<DangKyKhoaHoc, Integer> {
    // You can add custom query methods here if needed
}
