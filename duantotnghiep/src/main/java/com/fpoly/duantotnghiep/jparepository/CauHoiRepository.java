package com.fpoly.duantotnghiep.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.duantotnghiep.Entity.CauHoi;

public interface CauHoiRepository extends JpaRepository<CauHoi, Integer> {
    // You can add custom query methods here if needed
}
