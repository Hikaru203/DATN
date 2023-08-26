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
@Table(name = "duyet_khoa_hoc")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class DuyetKhoaHoc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "id_khoa_hoc")
    private int idKhoaHoc;

    @Column(name = "id_nguoi_duyet")
    private int idNguoiDuyet;

    @Column(name = "trang_thai", length = 50, nullable = false)
    private String trangThai;

    @Column(name = "ngay_duyet")
    private LocalDate ngayDuyet;

    // Getters and Setters
}
