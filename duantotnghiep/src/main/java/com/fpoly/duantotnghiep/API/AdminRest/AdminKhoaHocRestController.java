package com.fpoly.duantotnghiep.API.AdminRest;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.service.KhoaHocService;

import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/admin/KhoaHoc")
public class AdminKhoaHocRestController {
    @Autowired
    KhoaHocService khoaHocService;

    @GetMapping()
    public List<KhoaHoc> getAll() {
        return khoaHocService.findAll();
    }

    @GetMapping("/{id}")
    public KhoaHoc getById(@PathVariable("id") int id) {
        return khoaHocService.findById(id);
    }
     @PostMapping()
    public KhoaHoc create(@RequestParam("hinhAnh") MultipartFile file, @RequestPart("khoaHoc")  KhoaHoc khoaHoc, HttpServletRequest request) throws IOException {

         // Process the uploaded file
    if (!file.isEmpty()) {
        byte[] bytes = file.getBytes();

        // Specify the directory where you want to save the file
        String uploadPath = "src/main/resources/static/Admin/img";

        // Generate a unique filename
        String fileName = System.currentTimeMillis() + "-" + file.getOriginalFilename();

        // Create the complete file path
        String filePath = uploadPath + fileName;

        // Save the file
        java.nio.file.Path nioPath = Paths.get(filePath); // Sử dụng java.nio.file.Path

        Files.write(nioPath, bytes);
        khoaHoc.setHinhAnh(fileName);
    }

        return khoaHocService.create(khoaHoc);
    }

}
