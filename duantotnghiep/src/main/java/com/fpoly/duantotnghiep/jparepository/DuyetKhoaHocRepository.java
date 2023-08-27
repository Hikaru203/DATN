package com.example.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.DuyetKhoaHoc;

public interface DuyetKhoaHocRepository extends JpaRepository<DuyetKhoaHoc, Integer> {
    // You can add custom query methods here if needed
}
