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

	@Query("SELECT vkh FROM VideoKhoaHoc vkh JOIN vkh.khoaHoc kh WHERE kh.id = :khoaHocId ORDER BY vkh.thuTu ASC")
	List<VideoKhoaHoc> findByKhoaHocIdOrderByAsc(@Param("khoaHocId") Integer khoaHocId);

}
