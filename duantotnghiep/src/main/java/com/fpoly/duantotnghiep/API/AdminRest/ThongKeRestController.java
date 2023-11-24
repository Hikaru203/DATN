package com.fpoly.duantotnghiep.API.AdminRest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
