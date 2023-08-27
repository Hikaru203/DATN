package com.example.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.KhoaHoc;

public interface KhoaHocRepository extends JpaRepository<KhoaHoc, Integer> {
    // You can add custom query methods here if needed
}
