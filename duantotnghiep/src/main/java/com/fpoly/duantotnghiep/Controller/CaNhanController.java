package com.fpoly.duantotnghiep.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/courseOnline/")
public class CaNhanController {

    @GetMapping("/TrangUser")
    public String TrangUser(Model model) {
   
        return "TrangUser"; // helloPage là tên của trang HTML mà bạn muốn hiển thị
    }
}
