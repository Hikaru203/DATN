package com.fpoly.duantotnghiep.API.ClientRest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;
import java.util.List;

@RestController
@RequestMapping("/api")
public class AccountRestController {

    @Autowired
    NguoiDungRepository nguoiDungRepository;

    @PostMapping("/nguoidung")
    public NguoiDung createNguoiDung(@RequestBody NguoiDung nguoiDung) {
        return nguoiDungRepository.save(nguoiDung);
    }

    @GetMapping("/nguoidung")
    public List<NguoiDung> layDanhSachNguoiDung() {
        return nguoiDungRepository.findAll();
    }

    // You can add other CRUD operations as needed

}
