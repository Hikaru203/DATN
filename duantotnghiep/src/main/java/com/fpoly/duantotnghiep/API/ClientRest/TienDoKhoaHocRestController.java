package com.fpoly.duantotnghiep.API.ClientRest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.duantotnghiep.Entity.DangKyKhoaHoc;
import com.fpoly.duantotnghiep.service.DangKyKhoaHocService;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/tiendokhoahoc")
public class TienDoKhoaHocRestController {
    @Autowired
    DangKyKhoaHocService dangKyKhoaHocService;

    @GetMapping("/{id}/{idkhoahoc}")
    public DangKyKhoaHoc getTienDoKhoaHoc(@PathVariable int id, @PathVariable int idkhoahoc) {
        System.out.println("id: " + id + " idkhoahoc: " + idkhoahoc);
        return dangKyKhoaHocService.findByNguoiDungIdAndKhoaHocId(id, idkhoahoc);
    }

    @PutMapping("/{id}/{idkhoahoc}/{idvideo}/{tienDo}")
    public DangKyKhoaHoc updateTienDoKhoaHoc(@PathVariable int id, @PathVariable int idkhoahoc,
            @PathVariable String idvideo, @PathVariable String tienDo) {
        DangKyKhoaHoc dangKyKhoaHoc = dangKyKhoaHocService.findByNguoiDungIdAndKhoaHocId(id, idkhoahoc);
        try {
            dangKyKhoaHoc.setTienDo(idvideo + "/" + tienDo);
            return dangKyKhoaHocService.save(dangKyKhoaHoc);
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
            return null;

        }
    }
}
