package com.example.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.LoaiKhoaHoc;

public interface LoaiKhoaHocRepository extends JpaRepository<LoaiKhoaHoc, Integer> {
    // You can add custom query methods here if needed
}
