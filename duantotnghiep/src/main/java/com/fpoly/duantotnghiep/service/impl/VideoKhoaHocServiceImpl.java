	package com.fpoly.duantotnghiep.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.Entity.VideoKhoaHoc;
import com.fpoly.duantotnghiep.service.VideoKhoaHocService;
import com.fpoly.duantotnghiep.jparepository.VideoKhoaHocRepository;
@Service
public class VideoKhoaHocServiceImpl implements VideoKhoaHocService{
	@Autowired
	VideoKhoaHocRepository VideoKhoaHocRepository;
	
	@Override
	public List<VideoKhoaHoc> findAll() {
		// TODO Auto-generated method stub
		return videoKhoaHocRepository.findAll();
	}
	@Override
	public List<VideoKhoaHoc> findById(int id) {
		// TODO Auto-generated method stub
		return videoKhoaHocRepository.findById(id);
	 
	 
}}

