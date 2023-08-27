package com.fpoly.duantotnghiep.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.duantotnghiep.Entity.VideoKhoaHoc;

public interface VideoKhoaHocRepository extends JpaRepository<VideoKhoaHoc, Integer> {
    // You can add custom query methods here if needed
}
