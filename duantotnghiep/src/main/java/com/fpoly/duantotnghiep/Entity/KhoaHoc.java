package com.example.entity;

import java.math.BigDecimal;
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
@Table(name = "khoa_hoc")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class KhoaHoc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "ten_khoa_hoc", nullable = false)
    private String tenKhoaHoc;

    @Column(name = "mo_ta", columnDefinition = "nvarchar(max)")
    private String moTa;

    @Column(name = "ngay_tao")
    private LocalDate ngayTao;

    @Column(name = "nguoi_tao")
    private Integer nguoiTao;

    @Column(name = "chi_phi", precision = 10, scale = 2)
    private BigDecimal chiPhi;

    @Column(name = "duyet")
    private Boolean duyet;

    @Column(name = "trang_thai", length = 50, nullable = false)
    private String trangThai;

    // Getters and Setters
}
