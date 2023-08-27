package com.example.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.TaiLieuKhoaHoc;

public interface TaiLieuKhoaHocRepository extends JpaRepository<TaiLieuKhoaHoc, Integer> {
    // You can add custom query methods here if needed
}
