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
@Table(name = "video_khoa_hoc")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class VideoKhoaHoc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "id_khoa_hoc")
    private int idKhoaHoc;

    @Column(name = "link_video", columnDefinition = "nvarchar(max)")
    private String linkVideo;

    @Column(name = "thu_tu")
    private int thuTu;

    // Getters and Setters
}
