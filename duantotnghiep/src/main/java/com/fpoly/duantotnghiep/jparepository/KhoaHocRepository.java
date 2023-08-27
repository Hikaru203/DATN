package com.fpoly.duantotnghiep.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;

public interface KhoaHocRepository extends JpaRepository<KhoaHoc, Integer> {
    // You can add custom query methods here if needed
}
