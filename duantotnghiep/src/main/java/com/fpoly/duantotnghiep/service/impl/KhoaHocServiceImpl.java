package com.fpoly.duantotnghiep.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.jparepository.KhoaHocRepository;
import com.fpoly.duantotnghiep.service.KhoaHocService;

@Service
public class KhoaHocServiceImpl implements KhoaHocService {

    @Autowired
    KhoaHocRepository daoKhoahoc;

    @Override
    public List<KhoaHoc> findAll() {
        return daoKhoahoc.findAll();
    }

    @Override
    public KhoaHoc findById(int id) {
        return daoKhoahoc.findById(id);
    }

	@Override
	public List<KhoaHoc> getKhoaHocByLoai(String loai) {
		// TODO Auto-generated method stub
		return null;
	}
}
