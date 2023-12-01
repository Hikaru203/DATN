package com.fpoly.duantotnghiep.API.ClientRest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.service.KhoaHocService;

@RestController
@RequestMapping("/api/khoahoc")
public class KhoaHocClientRestController {

    private final KhoaHocService khoaHocService;

    @Autowired
    public KhoaHocClientRestController(KhoaHocService khoaHocService) {
        this.khoaHocService = khoaHocService;
    }

    @GetMapping
    public ResponseEntity<List<KhoaHoc>> getAllKhoaHoc() {
        List<KhoaHoc> khoaHocList = khoaHocService.findAll();
        return new ResponseEntity<>(khoaHocList, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<KhoaHoc> getKhoaHocById(@PathVariable int id) {
        KhoaHoc khoaHoc = khoaHocService.findById(id);
        if (khoaHoc != null) {
            return new ResponseEntity<>(khoaHoc, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    @GetMapping("/byLoai/{loai}")
    public List<KhoaHoc> getKhoaHocByLoai(@PathVariable Integer loai) {
        return khoaHocService.getKhoaHocByLoai(loai);
    }
     
}
