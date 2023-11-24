package com.fpoly.duantotnghiep.jparepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;

public interface KhoaHocRepository extends JpaRepository<KhoaHoc, Integer> {
	List<KhoaHoc> findByLoaiKhoaHocId(Integer loaiKhoaHoc);

	List<KhoaHoc> findAll();

	KhoaHoc findById(int id);

	@Query("SELECT k.tenKhoaHoc FROM KhoaHoc k")
	List<String> findAllTenKhoaHoc();
}
