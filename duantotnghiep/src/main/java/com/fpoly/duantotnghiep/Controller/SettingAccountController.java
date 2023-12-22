package com.fpoly.duantotnghiep.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/courseOnline/")
public class SettingAccountController {

    @GetMapping("/SettingAccount")
    public String showSettingAccount() {
        return "SettingAccount"; // 
    }
}