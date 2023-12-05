package com.fpoly.duantotnghiep.API.AdminRest;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;
import com.fpoly.duantotnghiep.service.NguoiDungService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/admin/NguoiDung")
public class AdminAccountRestController {
    @Autowired
    NguoiDungRepository nguoiDungRepository;
    @Autowired
    private NguoiDungService nguoiDungService;

    @GetMapping()
    public List<NguoiDung> getAll() {
        return nguoiDungRepository.findAll();
    }

    @GetMapping("/{id}")
    public Optional<NguoiDung> getById(@PathVariable("id") int id) {
        return nguoiDungRepository.findById(id);
    }
    @PostMapping("/add")
    public NguoiDung addNguoiDung(@RequestParam("file") MultipartFile file,
                                  @RequestParam("taiKhoan") String taiKhoan,
                                  @RequestParam("matKhau") String matKhau,
                                  @RequestParam("hoTen") String hoTen,
                                  @RequestParam("email") String email,
                                  @RequestParam("chucVu") String chucVu,
                                  @RequestParam("trangThai") String trangThai) throws IOException {
        NguoiDung nguoiDung = new NguoiDung(taiKhoan, matKhau, hoTen, email, chucVu, trangThai, false, false);

        // Gọi service để thực hiện lưu hình ảnh và thông tin người dùng vào cơ sở dữ liệu
        return NguoiDung.addNguoiDung(nguoiDung, file);
    
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
