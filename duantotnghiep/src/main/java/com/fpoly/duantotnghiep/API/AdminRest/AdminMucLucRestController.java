package com.fpoly.duantotnghiep.API.AdminRest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.duantotnghiep.Entity.MucLuc;
import com.fpoly.duantotnghiep.service.MucLucService;

@CrossOrigin("*")
@RestController
@RequestMapping("/Admin/rest/MucLuc")
public class AdminMucLucRestController {
    @Autowired
    MucLucService mucLucService;

    @GetMapping()
    public List<MucLuc> getAll() {
        return mucLucService.findAll();
    }

    @GetMapping("/KhoaHoc/{KhoaHocId}")
    public List<MucLuc> getAllByKhoaHoc(@PathVariable("KhoaHocId") Integer KhoaHocId) {
        return mucLucService.findByKhoaHoc(KhoaHocId);
    }

    @GetMapping("/{id}")
    public MucLuc getById(@PathVariable("id") int id) {
        return mucLucService.findById(id);
    }

}
