package com.fpoly.duantotnghiep.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.jparepository.KhoaHocRepository;

public interface KhoaHocService {
	 
	    List<KhoaHoc> findAll();

	    KhoaHoc findById(int id);

	    List<KhoaHoc> getKhoaHocByLoai(String loai);
}
