package com.fpoly.duantotnghiep.API.ClientRest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.duantotnghiep.Entity.DangKyKhoaHoc;
import com.fpoly.duantotnghiep.Entity.MucLuc;
import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.Entity.VideoKhoaHoc;
import com.fpoly.duantotnghiep.jparepository.MucLucReponsitory;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;
import com.fpoly.duantotnghiep.jparepository.VideoKhoaHocRepository;
import com.fpoly.duantotnghiep.service.DangKyKhoaHocService;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/tiendokhoahoc")
public class TienDoKhoaHocRestController {
    @Autowired
    DangKyKhoaHocService dangKyKhoaHocService;

    @Autowired
    NguoiDungRepository dungRepository;

    @Autowired
    VideoKhoaHocRepository videoKhoaHocRepository;

    @Autowired
    MucLucReponsitory mucLucReponsitory;

    @GetMapping("/{id}/{idkhoahoc}")
    public DangKyKhoaHoc getTienDoKhoaHoc(@PathVariable int id, @PathVariable int idkhoahoc) {
        System.out.println("id: " + id + " idkhoahoc: " + idkhoahoc);
        return dangKyKhoaHocService.findByNguoiDungIdAndKhoaHocId(id, idkhoahoc);
    }

    // Tạo một biến tạm thời để lưu trữ linkVideoLonNhat
    private static String linkVideoLonNhat = "";

    @PutMapping("/{id}/{idkhoahoc}/{idvideo}/{tienDo}")
    public DangKyKhoaHoc updateTienDoKhoaHoc(@PathVariable int id, @PathVariable int idkhoahoc,
            @PathVariable String idvideo, @PathVariable String tienDo) {

        DangKyKhoaHoc dangKyKhoaHoc = dangKyKhoaHocService.findByNguoiDungIdAndKhoaHocId(id, idkhoahoc);

        // Cập nhật tiến độ
        dangKyKhoaHoc.setTienDo(idvideo + "/" + tienDo);

        return dangKyKhoaHocService.save(dangKyKhoaHoc);
    }

    @PutMapping("/uploadTienDoToiDa/{id}/{idkhoahoc}/{idvideo}")
    public DangKyKhoaHoc updateTienDoKhoaHocToiDa(@PathVariable int id, @PathVariable int idkhoahoc,
            @PathVariable String idvideo) {
        List<VideoKhoaHoc> videoKhoaHocs = videoKhoaHocRepository.findByKhoaHocIdOrderByAsc(idkhoahoc);
        DangKyKhoaHoc dangKyKhoaHoc = dangKyKhoaHocService.findByNguoiDungIdAndKhoaHocId(id, idkhoahoc);

        dangKyKhoaHoc.setTienDoToiDa(idvideo);
        if (dangKyKhoaHoc.getTienDoToiDa() == null) {
            dangKyKhoaHoc.setTienDoToiDa(idvideo);
        }
        return dangKyKhoaHocService.save(dangKyKhoaHoc);

    }

    @PutMapping("/upload/{id}/{idkhoahoc}/{trangthai}")
    public DangKyKhoaHoc updateTienDoKhoaHoc2(@PathVariable int id, @PathVariable int idkhoahoc,
            @PathVariable String trangthai) {
        DangKyKhoaHoc dangKyKhoaHoc = dangKyKhoaHocService.findByNguoiDungIdAndKhoaHocId(id, idkhoahoc);
        System.out.println(dangKyKhoaHoc);
        try {
            dangKyKhoaHoc.setTrangThai(trangthai);
            return dangKyKhoaHocService.save(dangKyKhoaHoc);
        } catch (Exception e) {
            // TODO: handle exception
            return null;
        }
    }

    @GetMapping
    public List<DangKyKhoaHoc> findAll() {
        return dangKyKhoaHocService.findAll();
    }

    @GetMapping("/duyetnhasangtao")
    public List<NguoiDung> findAll1() {
        return dungRepository.findAll();
    }
}
