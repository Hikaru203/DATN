package com.fpoly.duantotnghiep.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.Entity.VideoKhoaHoc;
import com.fpoly.duantotnghiep.service.VideoKhoaHocService;
import com.fpoly.duantotnghiep.jparepository.VideoKhoaHocRepository;

@Service
public class VideoKhoaHocServiceimpl implements VideoKhoaHocService {
	@Autowired
	VideoKhoaHocRepository VideoKhoaHocRepository;

	@Override
	public VideoKhoaHoc findByVideoKhoaHocId(Integer id) {
		return VideoKhoaHocRepository.findById(id).get();
	}

	@Override
	public List<VideoKhoaHoc> findByKhoaHocId(Integer khoaHocId) {
		return VideoKhoaHocRepository.findByKhoaHocIdOrderByAsc(khoaHocId);
	}

}
