package com.fpoly.duantotnghiep.API.AdminRest;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/admin/NguoiDung")
public class AdminAccountRestController {
    @Autowired
    NguoiDungRepository nguoiDungRepository;

    @GetMapping()
    public List<NguoiDung> getAll() {
        return nguoiDungRepository.findAll();
    }

    @GetMapping("/{id}")
    public Optional<NguoiDung> getById(@PathVariable("id") int id) {
        return nguoiDungRepository.findById(id);
    }
    @PostMapping()
    public NguoiDung addNguoiDung(@RequestBody NguoiDung nguoiDung) {
        return nguoiDungRepository.save(nguoiDung);
    }
    @PutMapping("/{id}")
    public NguoiDung updateNguoiDung(@PathVariable("id") int id, @RequestBody NguoiDung nguoiDung) {
        nguoiDung.setId(id);
        return nguoiDungRepository.save(nguoiDung);
    }

    @DeleteMapping("/{id}")
    public void deleteNguoiDung(@PathVariable("id") int id) {
        nguoiDungRepository.deleteById(id);
    }

}
