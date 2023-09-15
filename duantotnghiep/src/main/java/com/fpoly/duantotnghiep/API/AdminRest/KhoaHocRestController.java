package com.fpoly.duantotnghiep.API.AdminRest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.service.KhoaHocService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/KhoaHoc")
public class KhoaHocRestController {
    @Autowired
    KhoaHocService khoaHocService;

    @GetMapping()
    public List<KhoaHoc> getAll() {
        return khoaHocService.findAll();
    }

    @GetMapping("/{id}")
    public KhoaHoc getById(@PathVariable("id") int id) {
        return khoaHocService.findById(id);
    }
}
