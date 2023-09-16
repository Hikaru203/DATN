package com.fpoly.duantotnghiep.API.AdminRest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.Entity.TaiLieuKhoaHoc;
import com.fpoly.duantotnghiep.service.NguoiDungService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/NguoiDung")
public class NguoiDungRestController {
	   @Autowired
	   NguoiDungService  nguoiDungService;
	   @GetMapping()
	    public List<NguoiDung> getAll() {
	        return nguoiDungService.findAll();
	    }

	    @GetMapping("/{id}")
    public List<NguoiDung> getByNguoiDung(@PathVariable int idNguoiDung) {
	        return nguoiDungService.findById(idNguoiDung);
	    }
}
