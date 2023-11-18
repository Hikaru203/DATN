package com.fpoly.duantotnghiep.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.fpoly.duantotnghiep.Entity.CauHoi;
import com.fpoly.duantotnghiep.Entity.DangKyKhoaHoc;
import com.fpoly.duantotnghiep.Entity.DanhGia;
import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.Entity.MucLuc;
import com.fpoly.duantotnghiep.Entity.VideoKhoaHoc;
import com.fpoly.duantotnghiep.service.CauHoiService;
import com.fpoly.duantotnghiep.service.CookieService;
import com.fpoly.duantotnghiep.service.DangKyKhoaHocService;
import com.fpoly.duantotnghiep.service.DanhGiaService;
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

    @Autowired
    DangKyKhoaHocService dangKyKhoaHocService;

    @Autowired
    DanhGiaService danhGiaService;

    @GetMapping("/courseOnline/index")
    public String index(Model model) {
        List<KhoaHoc> page = daoHocService.findAll();
        List<DangKyKhoaHoc> list = dangKyKhoaHocService.findAll();
        List<DanhGia> list2 = danhGiaService.findAll();

        // Tạo một Map để lưu trữ count cho mỗi khóa học
        Map<Long, Integer> courseCountMap = new HashMap<>();
        Map<Long, Integer> danhGiaMap = new HashMap<>();
        Map<Long, Double> DiemDanhGiaMap = new HashMap<>();

        int count1 = 0; // Declare count1 before using it

        for (DanhGia danhGia : list2) {
            KhoaHoc khoaHoc = danhGia.getKhoaHoc();

            // Kiểm tra xem khoaHoc có null hay không

            long khoaHocId = khoaHoc.getId();

            if (danhGiaMap.containsKey(khoaHocId)) {
                count1 = danhGiaMap.get(khoaHocId);
                count1++;
                danhGiaMap.put(khoaHocId, count1);
            } else {
                danhGiaMap.put(khoaHocId, 1);
            }

        }

        for (DanhGia danhGia : list2) {
            KhoaHoc khoaHoc = danhGia.getKhoaHoc();
            long khoaHocId = khoaHoc.getId();

            if (danhGiaMap.containsKey(khoaHocId)) {
                count1 = danhGiaMap.get(khoaHocId);
                count1++;
                danhGiaMap.put(khoaHocId, count1);
            } else {
                danhGiaMap.put(khoaHocId, 1);
            }
        }

        for (DanhGia danhGia : list2) {
            KhoaHoc khoaHoc = danhGia.getKhoaHoc();
            long khoaHocId = khoaHoc.getId();

            if (DiemDanhGiaMap.containsKey(khoaHocId)) {
                double count = DiemDanhGiaMap.get(khoaHocId);
                count += danhGia.getSoDiemDanhGia();
                DiemDanhGiaMap.put(khoaHocId, count / count1);
            } else {
                DiemDanhGiaMap.put(khoaHocId, Double.valueOf(danhGia.getSoDiemDanhGia()));
            }
        }

        // Tạo một Map để lưu trữ count cho mỗi khóa học
        for (DangKyKhoaHoc dangKyKhoaHoc : list) {
            KhoaHoc khoaHoc = dangKyKhoaHoc.getKhoaHoc();

            // Kiểm tra xem khoaHoc có null hay không

            long khoaHocId = khoaHoc.getId();

            if (courseCountMap.containsKey(khoaHocId)) {
                count1 = courseCountMap.get(khoaHocId);
                count1++;
                courseCountMap.put(khoaHocId, count1);
            } else {
                courseCountMap.put(khoaHocId, 1);
            }

        }

        // Tạo danh sách cuối cùng để hiển thị trong view
        List<Object[]> courseCountList = new ArrayList<>();
        for (KhoaHoc khoaHoc : page) {
            long khoaHocId = khoaHoc.getId();
            int count = courseCountMap.getOrDefault(khoaHocId, 0);
            Object[] item = { count, khoaHocId };
            courseCountList.add(item);
        }

        List<Object[]> danhGiaList = new ArrayList<>();
        List<Object[]> danhGiaList2 = new ArrayList<>();
        for (KhoaHoc khoaHoc : page) {
            long khoaHocId = khoaHoc.getId();
            int count = danhGiaMap.getOrDefault(khoaHocId, 0);
            Object[] item = { count, khoaHocId };
            danhGiaList.add(item);
        }

        for (KhoaHoc khoaHoc : page) {
            long khoaHocId = khoaHoc.getId();
            Double count = DiemDanhGiaMap.getOrDefault(khoaHocId, 0.0).doubleValue();
            Object[] item = { count, khoaHocId };
            danhGiaList2.add(item);
        }

        model.addAttribute("danhGiaList2", danhGiaList2);
        System.out.println(danhGiaList2.get(0)[0]);
        model.addAttribute("danhGiaList", danhGiaList);
        System.out.println(danhGiaList.get(0)[0]);
        model.addAttribute("list", courseCountList);
        System.out.println(courseCountList.get(0)[0]);

        model.addAttribute("courseOnline", page);

        return "index";
    }

    @GetMapping("/courseOnline/tracnghiem")
    public String tracngiem() {
        return "tracnghiem";
    }

    @GetMapping("/courseOnline/detail/{id}")
    public String detail(@PathVariable("id") String id, Model model) {
        cookieService.add("id", id, 1);
        return "detail";
    }

    @GetMapping("/courseOnline/uploadKhoaHoc")
    public String uploadKhoaHoc() {
        return "uploadKhoaHoc";
    }

}