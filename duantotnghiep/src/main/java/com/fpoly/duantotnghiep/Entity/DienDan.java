package com.fpoly.duantotnghiep.Entity;

import java.time.LocalDate;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
	    @Column(name = "id")
	    private int id;

	    @ManyToOne
	    @JoinColumn(name = "id_khoa_hoc")
	    private KhoaHoc khoaHoc;

	    @Column(name = "tieu_de")
	    private String tieuDe;

	    @Column(name = "noi_dung")
	    private String noiDung;

	    @Column(name = "nguoi_dang")
	    private String nguoiDang;

	    @Column(name = "ngay_dang")
	    private Date ngayDang;


    // Getters and Setters
}
