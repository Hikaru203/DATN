package com.fpoly.duantotnghiep.API.AdminRest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;
import com.fpoly.duantotnghiep.service.KhoaHocService;

@CrossOrigin("*")
@RestController
@RequestMapping("/Admin/rest/NguoiDung")
public class AdminAccountRestController {
    @Autowired
    NguoiDungRepository nguoiDungRepository;

    @GetMapping()
    public List<NguoiDung> getAll() {
        return nguoiDungRepository.findAll();
    }
}
