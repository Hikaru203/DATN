package com.fpoly.duantotnghiep.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.duantotnghiep.Entity.BinhLuan;

public interface BinhLuanRepository extends JpaRepository<BinhLuan, Integer> {
    // You can add custom query methods here if needed
}
