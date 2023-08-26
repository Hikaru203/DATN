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
@Table(name = "chung_chi")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ChungChi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "id_nguoi_dung")
    private int idNguoiDung;

    @Column(name = "id_khoa_hoc")
    private int idKhoaHoc;

    @Column(name = "bang_loai", length = 100)
    private String bangLoai;

    @Column(name = "ngay_cap")
    private LocalDate ngayCap;

    // Getters and Setters
}
