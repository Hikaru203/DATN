package com.fpoly.duantotnghiep.Entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "nguoi_dung")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class NguoiDung {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "tai_khoan")
	private String taiKhoan;

	@Column(name = "mat_khau")
	private String matKhau;

	@Column(name = "ho_ten")
	private String hoTen;

	@Column(name = "email")
	private String email;

	@Column(name = "so_dien_thoai")
	private String soDienThoai;

	@Column(name = "chuc_vu")
	private String chucVu;

	@Column(name = "trang_thai")
	private String trangThai;
	// Getters and Setters
}
