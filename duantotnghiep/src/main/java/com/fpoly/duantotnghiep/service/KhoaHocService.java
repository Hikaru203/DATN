package com.fpoly.duantotnghiep.service;

import java.util.List;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;


public interface KhoaHocService {



	List<KhoaHoc> findAll();

	KhoaHoc findByKhoaHocId(Integer id);

	KhoaHoc findById(int id);
 
	List<String> findAllTenKhoaHoc();

	// Thêm phương thức mới
    List<KhoaHoc> getDanhSachDaDang(String tenKhoaHoc);

	List<KhoaHoc> getKhoaHocByLoai(String loaiKhoaHoc);
	
}
