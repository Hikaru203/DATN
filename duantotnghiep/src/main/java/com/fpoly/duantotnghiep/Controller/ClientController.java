package com.fpoly.duantotnghiep.Controller; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.service.KhoaHocService;

@Controller
public class ClientController{
	@Autowired
	KhoaHocService daoHocService;
	
    @GetMapping("/courseOnline/index")
    public String index(Model model) {
    	List<KhoaHoc> page = daoHocService.findAll();
    	model.addAttribute("courseOnline", page);
     
        return "index";
    }
    
}