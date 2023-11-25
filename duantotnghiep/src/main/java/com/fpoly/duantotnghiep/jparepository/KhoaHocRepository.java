package com.fpoly.duantotnghiep.jparepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;

public interface KhoaHocRepository extends JpaRepository<KhoaHoc, Integer> {
	@Query("SELECT kh FROM KhoaHoc kh WHERE kh.loaiKhoaHoc = ?1")
	 List<KhoaHoc> findByLoai(String loaiKhoaHoc);
@Query("SELECT kh FROM KhoaHoc kh WHERE kh.duyet = false")
	 List<KhoaHoc> findByDuyet();
	 List<KhoaHoc> findAll();
	List<KhoaHoc> findByLoaiKhoaHocId(Integer loaiKhoaHoc);


	KhoaHoc findById(int id);

	@Query("SELECT k.tenKhoaHoc FROM KhoaHoc k")
	List<String> findAllTenKhoaHoc();
}
