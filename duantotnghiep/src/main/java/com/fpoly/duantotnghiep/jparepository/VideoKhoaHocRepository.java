package com.fpoly.duantotnghiep.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.duantotnghiep.Entity.VideoKhoaHoc;
import java.util.List;

public interface VideoKhoaHocRepository extends JpaRepository<VideoKhoaHoc, Integer> {
    List<VideoKhoaHoc> findById(int id);
}

