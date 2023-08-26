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
@Table(name = "danh_gia")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class DanhGia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "id_khoa_hoc")
    private int idKhoaHoc;

    @Column(name = "id_nguoi_dung")
    private int idNguoiDung;

    @Column(name = "noi_dung", columnDefinition = "nvarchar(max)")
    private String noiDung;

    @Column(name = "so_diem_danh_gia")
    private int soDiemDanhGia;

    @Column(name = "ngay_tao")
    private LocalDate ngayTao;

    // Getters and Setters
}
