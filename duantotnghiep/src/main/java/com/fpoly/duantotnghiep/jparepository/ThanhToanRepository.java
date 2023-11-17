package com.fpoly.duantotnghiep.jparepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.duantotnghiep.Entity.ThanhToan;



public interface ThanhToanRepository extends JpaRepository<ThanhToan, Integer>{
	List<ThanhToan> findByNguoiDungId(int idNguoiDung);
}
