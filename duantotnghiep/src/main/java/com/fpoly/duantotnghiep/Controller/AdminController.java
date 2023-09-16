package com.fpoly.duantotnghiep.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	@GetMapping("/add-professor")
	public String about() {
		return "Admin/ChungChi";
	}

	@GetMapping("/KenhKhoaHoc")
	public String KenhKhoaHoc() {
		return "Admin/KenhKhoaHoc";
	}

	@GetMapping("/KhoaHoc")
	public String KhoaHoc() {
		return "Admin/KhoaHoc";
	}

	@GetMapping("/EditKhoaHoc")
	public String EditKhoaHoc() {
		return "Admin/EditKhoaHoc";
	}

	@GetMapping("/NguoiDung")
	public String NguoiDung() {
		return "Admin/NguoiDung";
	}
//    @GetMapping("/EditNguoiDung")
//    public String EditNguoiDung() {
//        return "Admin/EditNguoiDung";
//    }

	@GetMapping("/VideoKhoaHoc")
	public String VideoKhoaHoc() {
		return "Admin/VideoKhoaHoc";
	}
//    @GetMapping("/EditNguoiDung")
//    public String EditNguoiDung() {
//        return "Admin/EditNguoiDung";
//    }
	@GetMapping("/HocVien")
	public String HocVien() {
		return "Admin/HocVien";
	}
	@GetMapping("/Video")
	public String Video() {
		return "Admin/Video";
	}
	@GetMapping("/test")
	public String test() {
		return "Admin/test";
	}

	@GetMapping("/TaiLieu")
	public String TaiLieu() {
		return "Admin/TaiLieu";
	}

	@GetMapping("/CauHoi")
	public String CauHoi() {
		return "Admin/CauHoi";
	}

}
