package com.example.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.DangKyKhoaHoc;

public interface DangKyKhoaHocRepository extends JpaRepository<DangKyKhoaHoc, Integer> {
    // You can add custom query methods here if needed
}
