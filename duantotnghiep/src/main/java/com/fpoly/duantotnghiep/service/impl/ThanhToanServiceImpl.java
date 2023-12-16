package com.fpoly.duantotnghiep.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.duantotnghiep.Entity.ThanhToan;
import com.fpoly.duantotnghiep.jparepository.ThanhToanRepository;
import com.fpoly.duantotnghiep.service.ThanhToanService;

@Service
public class ThanhToanServiceImpl implements ThanhToanService {
	@Autowired
	private ThanhToanRepository thanhToanRepository;

	@Override
	public void save(ThanhToan thanhToan) {
		thanhToanRepository.save(thanhToan);
	}

	@Override
	public List<ThanhToan> findAllByNguoiDungId(int idNguoiDung) {
		return thanhToanRepository.findByNguoiDungId(idNguoiDung);
	}

	@Override
	public boolean existsByKhoaHocAndNguoiDung(Integer idKhoaHoc, Integer idNguoiDung) {
		// Kiểm tra xem đã tồn tại bản ghi ThanhToan với idKhoaHoc và idNguoiDung hay
		// chưa
		Optional<ThanhToan> existingRecord = thanhToanRepository.findByKhoaHoc_IdAndNguoiDung_Id(idKhoaHoc,
				idNguoiDung);

		// Trả về true nếu bản ghi đã tồn tại, ngược lại trả về false
		return existingRecord.isPresent();
	}

}
