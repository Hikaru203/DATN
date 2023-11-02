package com.fpoly.duantotnghiep.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fpoly.duantotnghiep.Entity.NguoiDung;
import org.springframework.ui.Model;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class Login_DangKy {
    @Autowired
    NguoiDungRepository NguoiDung;
    @Autowired
    HttpSession httpSession;

    @RequestMapping("/courseOnline/dangky")
    public String showsinupFrom(Model model) {
        model.addAttribute("user", new NguoiDung());
        return "dangky";
    }

    @RequestMapping("/auth/blocked")
    public String xacminh(Model model) {
        return "dangnhap";
    }

    @GetMapping("/courseOnline/dangnhap")
    public String dangnhap() {
        httpSession.removeAttribute("user");
        httpSession.removeAttribute("admin");
        return "dangnhap";
    }

    @RequestMapping("/courseOnline/capnhat")
    public String capnhatform(Model model) {
        return "capnhattaikhoan";
    }

    @RequestMapping("/auth/login_error")
    public String loginrror() {
        return "dangnhap";
    }

    @GetMapping("/courseOnline/EmailError")
    public String emailerror() {
        return "dangnhap";
    }

    @GetMapping("/courseOnline/confirmotp")
    public String confirmotp() {
        return "nhapmaotp";
    }

    @GetMapping("/courseOnline/doimk")
    public String doimk() {
        return "doimk";
    }
}
