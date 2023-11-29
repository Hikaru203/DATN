package com.fpoly.duantotnghiep.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;


public interface KhoaHocService {



	List<KhoaHoc> findAll();
	List<KhoaHoc> findDuyet();
	KhoaHoc findByKhoaHocId(Integer id);

	KhoaHoc findById(int id);
 
	List<String> findAllTenKhoaHoc();

	List<KhoaHoc> getKhoaHocByLoai(Integer loaiKhoaHoc);

	KhoaHoc create( KhoaHoc khoaHoc);

	void deleteById(Integer id);

	KhoaHoc update(KhoaHoc khoaHoc);
}
