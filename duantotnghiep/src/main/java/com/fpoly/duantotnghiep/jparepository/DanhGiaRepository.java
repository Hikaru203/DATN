package com.example.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.DanhGia;

public interface DanhGiaRepository extends JpaRepository<DanhGia, Integer> {
    // You can add custom query methods here if needed
}
