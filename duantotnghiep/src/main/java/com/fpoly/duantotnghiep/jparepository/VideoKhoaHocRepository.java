package com.fpoly.duantotnghiep.jparepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.fpoly.duantotnghiep.Entity.ChungChi;
import com.fpoly.duantotnghiep.Entity.VideoKhoaHoc;

public interface VideoKhoaHocRepository extends JpaRepository<VideoKhoaHoc, Integer> {

	@Query("SELECT vkh FROM VideoKhoaHoc vkh JOIN vkh.mucLuc kh WHERE kh.id = :mucLucId ORDER BY vkh.thuTu ASC")
	List<VideoKhoaHoc> findByMucLucIdOrderByAsc(@Param("mucLucId") Integer khoaHocId);

}
