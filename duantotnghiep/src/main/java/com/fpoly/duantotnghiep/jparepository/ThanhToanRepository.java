package com.fpoly.duantotnghiep.jparepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.fpoly.duantotnghiep.Entity.ThanhToan;

public interface ThanhToanRepository extends JpaRepository<ThanhToan, Integer> {
	List<ThanhToan> findByNguoiDungId(int idNguoiDung);

	List<ThanhToan> findByKhoaHocId(int idKhoaHoc);

	List<ThanhToan> findByNguoiDungIdAndKhoaHocId(int idNguoiDung, int idKhoaHoc);

	@Query(nativeQuery = true, value = "Select YEAR(thoi_gian) AS year, MONTH(thoi_gian) AS month, SUM(tong_tien) AS total_revenue  "+
            "from dbo.thanh_toan " +
            "GROUP BY YEAR(thoi_gian), MONTH(thoi_gian) " +
            "ORDER BY year, month")
    List<Object[]> fetchRevenueData();
}
