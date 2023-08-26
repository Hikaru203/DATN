package com.example.entity;

import java.time.LocalDate;
import java.util.List;



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
@Table(name = "cau_hoi")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CauHoi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "id_khoa_hoc")
    private int idKhoaHoc;

    @Column(name = "ngay_tao")
    private LocalDate ngayTao;

    @Column(name = "cau_hoi", columnDefinition = "nvarchar(max)")
    private String cauHoi;

    @Column(name = "cau_tra_loi", columnDefinition = "nvarchar(max)")
    private String cauTraLoi;

    @Column(name = "dap_an", length = 100)
    private String dapAn;

    // Getters and Setters
}

