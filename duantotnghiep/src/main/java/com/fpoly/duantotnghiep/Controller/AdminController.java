package com.fpoly.duantotnghiep.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
    @GetMapping("/add-professor")
    public String about() {
        return "Admin/ChungChi";
    }
}
