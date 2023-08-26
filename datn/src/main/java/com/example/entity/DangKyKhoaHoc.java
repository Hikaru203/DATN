package com.example.entity;

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
@Table(name = "dang_ky_khoa_hoc")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class DangKyKhoaHoc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "id_nguoi_dung")
    private int idNguoiDung;

    @Column(name = "id_khoa_hoc")
    private int idKhoaHoc;

    @Column(name = "ngay_dang_ky")
    private LocalDate ngayDangKy;

    @Column(name = "tien_do")	
    private Integer tienDo;

    @Column(name = "trang_thai", length = 50, nullable = false)
    private String trangThai;

    // Getters and Setters
}
