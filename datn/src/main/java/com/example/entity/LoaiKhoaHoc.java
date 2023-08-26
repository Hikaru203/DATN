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
@Table(name = "loai_khoa_hoc")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LoaiKhoaHoc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "IDKhoaHoc")
    private int idKhoaHoc;

    @Column(name = "ten_loai_khoa_hoc", length = 100)
    private String tenLoaiKhoaHoc;

    // Getters and Setters
}
