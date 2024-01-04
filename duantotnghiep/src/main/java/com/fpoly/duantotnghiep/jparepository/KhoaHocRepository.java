package com.fpoly.duantotnghiep.jparepository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.Entity.NguoiDung;

public interface KhoaHocRepository extends JpaRepository<KhoaHoc, Integer> {
	@Query("SELECT kh FROM KhoaHoc kh WHERE kh.loaiKhoaHoc = ?1")
	List<KhoaHoc> findByLoai(String loaiKhoaHoc);

	@Query("SELECT kh FROM KhoaHoc kh  WHERE kh.tenKhoaHoc LIKE '%' + ?1 + '%'")
	List<KhoaHoc> findByTenKhoaHoc(String tenKhoaHoc);

	@Query("SELECT kh FROM KhoaHoc kh  WHERE kh.tenKhoaHoc LIKE '%' + ?1 + '%' AND kh.duyet = false")
	List<KhoaHoc> findByTenKhoaHoc2(String tenKhoaHoc);

	@Query("SELECT kh FROM KhoaHoc kh  WHERE kh.tenKhoaHoc LIKE '%' + ?1 + '%' AND kh.nguoiTao.id = ?2")
	List<KhoaHoc> findByTenKhoaHoc3(String tenKhoaHoc,Integer idNguoiDung );

	@Query(nativeQuery = true, value = "select kh.id,kh.loai,kh.ten_khoa_hoc,kh.mo_ta,kh.ngay_tao,kh.nguoi_tao,kh.chi_phi,kh.duyet,kh.trang_thai,kh.hinh_anh from dang_ky_khoa_hoc dkkh inner join khoa_hoc kh on dkkh.id_khoa_hoc = kh.id \r\n"
			+ //
			"group by kh.id,kh.loai,kh.chi_phi,kh.ten_khoa_hoc,kh.mo_ta,kh.ngay_tao,kh.nguoi_tao,kh.chi_phi,kh.duyet,kh.trang_thai,kh.hinh_anh \r\n"
			+ //
			"order by count(dkkh.id) desc")
	List<KhoaHoc> findByKhoaHocHot();

	@Query("select kh from KhoaHoc kh order by kh.ngayTao desc")
	List<KhoaHoc> findBySapXepTheoNgay();

	@Query("select kh from KhoaHoc kh order by kh.chiPhi desc")
	List<KhoaHoc> findBySapXepGiaGiamDan();

	@Query("select kh from KhoaHoc kh order by kh.chiPhi asc")
	List<KhoaHoc> findBySapXepGiaTangDan();

	@Query("SELECT kh FROM KhoaHoc kh WHERE kh.duyet = false AND kh.trangThai = 'false'")
	List<KhoaHoc> findByDuyet();

	List<KhoaHoc> findAll();

	List<KhoaHoc> findByLoaiKhoaHocId(Integer loaiKhoaHoc);

	KhoaHoc findById(int id);

	@Query("SELECT k.tenKhoaHoc FROM KhoaHoc k")
	List<String> findAllTenKhoaHoc();

	@Query("SELECT o FROM KhoaHoc o WHERE o.loaiKhoaHoc.id = :categoryId")
	List<KhoaHoc> findByCategory(@Param("categoryId") Integer categoryId);

	@Query("SELECT DISTINCT k.loaiKhoaHoc.tenLoaiKhoaHoc FROM KhoaHoc k")
	List<String> findAllNameCategory();

	@Query("SELECT DISTINCT k.loaiKhoaHoc.tenLoaiKhoaHoc FROM KhoaHoc k")
	List<String> findAllIdCategory();

	@Query("SELECT k FROM KhoaHoc k WHERE k.nguoiTao.id = :nguoiDungId")
	List<KhoaHoc> findByNguoiDung(@Param("nguoiDungId") Integer nguoiDungId);
}
