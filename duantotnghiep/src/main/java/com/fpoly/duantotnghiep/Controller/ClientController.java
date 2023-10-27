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
import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.Entity.MucLuc;
import com.fpoly.duantotnghiep.Entity.VideoKhoaHoc;
import com.fpoly.duantotnghiep.service.CauHoiService;
import com.fpoly.duantotnghiep.service.CookieService;
import com.fpoly.duantotnghiep.service.DangKyKhoaHocService;
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

    @GetMapping("/courseOnline/index")
    public String index(Model model) {
        List<KhoaHoc> page = daoHocService.findAll();
        List<DangKyKhoaHoc> list = dangKyKhoaHocService.findAll();

        // Tạo một Map để lưu trữ count cho mỗi khóa học
        Map<Long, Integer> courseCountMap = new HashMap<>();

        for (DangKyKhoaHoc dangKyKhoaHoc : list) {
            KhoaHoc khoaHoc = dangKyKhoaHoc.getKhoaHoc();
            long khoaHocId = khoaHoc.getId();

            // Kiểm tra xem khóa học đã có trong Map chưa, nếu chưa thì thêm vào với count
            // bằng 1, nếu có rồi thì tăng count lên 1
            if (courseCountMap.containsKey(khoaHocId)) {
                int count = courseCountMap.get(khoaHocId);
                count++;
                courseCountMap.put(khoaHocId, count);
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

        System.out.println(courseCountList);

        model.addAttribute("list", courseCountList);
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