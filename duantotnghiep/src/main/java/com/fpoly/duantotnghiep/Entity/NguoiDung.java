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

    @Column(name = "tai_khoan", length = 50, nullable = false)
    private String taiKhoan;

    @Column(name = "mat_khau", length = 100, nullable = false)
    private String matKhau;

    @Column(name = "ho_ten", length = 100, nullable = false)
    private String hoTen;

    @Column(name = "email", length = 100, nullable = false)
    private String email;

    @Column(name = "so_dien_thoai", length = 15, nullable = false)
    private String soDienThoai;

    @Column(name = "chuc_vu", length = 50)
    private String chucVu;

    @Column(name = "trang_thai", length = 50, nullable = false)
    private String trangThai;
}
