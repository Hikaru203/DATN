package com.fpoly.duantotnghiep.Entity;

import java.util.Date;



import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "binh_luan")
public class BinhLuan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "id_bai_dang")
    private DienDan baiDang;

    @Column(name = "noi_dung", columnDefinition = "nvarchar(max)")
    private String noiDung;

    @Column(name = "nguoi_binh_luan")
    private String nguoiBinhLuan;

    @Column(name = "ngay_binh_luan")
    private Date ngayBinhLuan;

    // Constructors, getters, and setters
}