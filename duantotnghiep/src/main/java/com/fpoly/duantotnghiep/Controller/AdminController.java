package com.fpoly.duantotnghiep.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @GetMapping("/Admin/KenhKhoaHoc")
    public String KenhKhoaHoc() {
        return "Admin/KenhKhoaHoc";
    }
    
    @GetMapping("/Admin/KhoaHoc")
    public String KhoaHoc() {
        return "Admin/KhoaHoc";
    }

    @GetMapping("/Admin/EditKhoaHoc")
    public String EditKhoaHoc() {
        return "Admin/EditKhoaHoc";
    }

    @GetMapping("/Admin/test")
    public String test() {
        return "Admin/test";
    }

    @GetMapping("/Admin/TaiLieu")
    public String TaiLieu() {
        return "Admin/TaiLieu";
    }

    @GetMapping("/Admin/CauHoi")
    public String CauHoi() {
        return "Admin/CauHoi";
    }

    @GetMapping("/Admin/ChungChi")
    public String ChungChi() {
        return "Admin/ChungChi";
    }

    @GetMapping("/Admin/ThongKe")
    public String ThongKe() {
        return "Admin/ThongKe";
    }

    @GetMapping("/Admin/User")
    public String User() {
        return "Admin/User";
    }

    @GetMapping("/Admin/ThanhToan")
    public String ThanhToan() {
        return "Admin/ThanhToan";
    }

}
