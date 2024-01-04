package com.fpoly.duantotnghiep.service;

import java.util.List;

import com.fpoly.duantotnghiep.Entity.ThanhToan;

public interface ThanhToanService {
	void save(ThanhToan thanhToan);

	List<ThanhToan> findAllByNguoiDungId(int idNguoiDung);

	boolean existsByKhoaHocAndNguoiDung(Integer idKhoaHoc, Integer idNguoiDung);
}
