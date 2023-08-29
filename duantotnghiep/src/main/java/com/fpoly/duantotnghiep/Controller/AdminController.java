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
    @GetMapping("/test")
    public String test() {
        return "Admin/test";
    }
}
