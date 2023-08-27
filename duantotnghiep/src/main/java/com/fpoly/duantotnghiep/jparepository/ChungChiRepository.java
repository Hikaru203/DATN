package com.fpoly.duantotnghiep.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.duantotnghiep.Entity.ChungChi;

public interface ChungChiRepository extends JpaRepository<ChungChi, Integer> {
    // You can add custom query methods here if needed
}
