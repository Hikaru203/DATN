package com.fpoly.duantotnghiep.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.fpoly.duantotnghiep.Entity.CauHoi;
import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.Entity.MucLuc;
import com.fpoly.duantotnghiep.Entity.VideoKhoaHoc;
import com.fpoly.duantotnghiep.service.CauHoiService;
import com.fpoly.duantotnghiep.service.CookieService;
import com.fpoly.duantotnghiep.service.KhoaHocService;
import com.fpoly.duantotnghiep.service.MucLucService;
import com.fpoly.duantotnghiep.service.VideoService;

@Controller
public class ClientController {
    @Autowired
    KhoaHocService daoHocService;

    @Autowired
    MucLucService mucLucService;

    @Autowired
    VideoService videoService;

    @Autowired
    CauHoiService cauHoiService;

    @Autowired
    CookieService cookieService;

    @GetMapping("/courseOnline/index")
    public String index(Model model) {
        List<KhoaHoc> page = daoHocService.findAll();
        model.addAttribute("courseOnline", page);
        return "index";
    }

    @GetMapping("/tracnghiem")
    public String tracngiem() {
        return "tracnghiem";
    }

    @GetMapping("/courseOnline/detail/{id}")
    public String detail(@PathVariable("id") String id, Model model) {
        cookieService.add("id", id, 1);
        return "detail";
    }

    

}