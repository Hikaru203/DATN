package com.fpoly.duantotnghiep.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.jparepository.KhoaHocRepository;
import com.fpoly.duantotnghiep.service.KhoaHocService;

@Service
public class KhoaHocServiceImpl implements KhoaHocService {
	@Autowired
	KhoaHocRepository khoaHocRepository;

	@Override
	public List<KhoaHoc> findAll() {
		return khoaHocRepository.findAll();
	}

	@Override
	public KhoaHoc findByKhoaHocId(Integer id) {
		// TODO Auto-generated method stub
		return khoaHocRepository.findById(id).get();
	}

	@Override
	public KhoaHoc findById(int id) {
		// TODO Auto-generated method stub
		return khoaHocRepository.findById(id);
	}

	@Override
	public List<KhoaHoc> getKhoaHocByLoai(String loaiKhoaHoc) {
		return khoaHocRepository.findByLoai(loaiKhoaHoc);
	}
    @Override
    public List<String> findAllTenKhoaHoc() {
        return khoaHocRepository.findAllTenKhoaHoc();
    }

	@Override
	public List<KhoaHoc> getDanhSachDaDang(String tenKhoaHoc) {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Unimplemented method 'getDanhSachDaDang'");
	}
}

