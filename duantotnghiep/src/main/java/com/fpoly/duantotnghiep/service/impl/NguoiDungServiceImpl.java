package com.fpoly.duantotnghiep.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;
import com.fpoly.duantotnghiep.service.NguoiDungService;


@Service
public class NguoiDungServiceImpl implements NguoiDungService{
	 @Autowired
	NguoiDungRepository nguoiDungRepository ;
	@Override
	public List<NguoiDung> findAll() {
		// TODO Auto-generated method stub
		return nguoiDungRepository.findAll();
	}
	
	@Override
	public List<NguoiDung> findById(int id) {
	    return nguoiDungRepository.findById(id);
	}



}
