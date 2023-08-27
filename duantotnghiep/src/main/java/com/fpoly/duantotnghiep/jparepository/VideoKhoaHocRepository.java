package com.example.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.VideoKhoaHoc;

public interface VideoKhoaHocRepository extends JpaRepository<VideoKhoaHoc, Integer> {
    // You can add custom query methods here if needed
}
