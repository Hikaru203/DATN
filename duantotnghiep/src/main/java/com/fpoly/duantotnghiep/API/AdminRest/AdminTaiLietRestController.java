package com.fpoly.duantotnghiep.API.AdminRest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.duantotnghiep.Entity.TaiLieuKhoaHoc;
import com.fpoly.duantotnghiep.service.TaiLieuService;

@CrossOrigin("*")
@RestController
@RequestMapping("/Admin/rest/TaiLieu")
public class AdminTaiLietRestController {
    @Autowired
    TaiLieuService taiLieuService;

    @GetMapping()
    public List<TaiLieuKhoaHoc> getAll() {
        return taiLieuService.findAll();
    }

    @GetMapping("/{idKhoaHoc}")
    public List<TaiLieuKhoaHoc> getByKhoaHoc(@PathVariable int idKhoaHoc) {
        return taiLieuService.findByKhoaHocId(idKhoaHoc);
    }

}
