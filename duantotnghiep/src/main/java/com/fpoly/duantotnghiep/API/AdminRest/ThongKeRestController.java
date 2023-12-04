package com.fpoly.duantotnghiep.API.AdminRest;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.duantotnghiep.Entity.ThongKeDATA;
import com.fpoly.duantotnghiep.service.ThongKeService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/Report")
public class ThongKeRestController {
    @Autowired
    ThongKeService thongKeService;

      @GetMapping()
    public List<ThongKeDATA> getRevenueData() {
        return thongKeService.getRevenueDatas();
    }

    @GetMapping("/thong-ke-thoi-gian")
    public List<ThongKeDATA> getThongKeTheoThoiGian(
            @RequestParam(name = "batDau", required = false) String batDau,
            @RequestParam(name = "ketThuc", required = false) String ketThuc) {
        return thongKeService.getThongKeTheoThoiGian(batDau, ketThuc);
    }
}
