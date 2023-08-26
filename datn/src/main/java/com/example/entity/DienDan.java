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
@Table(name = "dien_dan")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class DienDan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "id_khoa_hoc")
    private int idKhoaHoc;

    @Column(name = "tieu_de", length = 100)
    private String tieuDe;

    @Column(name = "noi_dung", columnDefinition = "nvarchar(max)")
    private String noiDung;

    @Column(name = "nguoi_dang", length = 100)
    private String nguoiDang;

    @Column(name = "ngay_dang")
    private LocalDate ngayDang;

    // Getters and Setters
}
