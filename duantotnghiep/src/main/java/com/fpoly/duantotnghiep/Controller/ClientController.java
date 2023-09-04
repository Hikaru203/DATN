package com.fpoly.duantotnghiep.Controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;
import com.fpoly.duantotnghiep.jparepository.KhoaHocRepository;
import com.fpoly.duantotnghiep.service.KhoaHocService;

@Controller
public class ClientController {
	private final KhoaHocService khoaHocService;
    
	@Autowired
	KhoaHocRepository daoKhoahoc;
	
    @Autowired
    public ClientController(KhoaHocService khoaHocService) {
        this.khoaHocService = khoaHocService;
    }

    @GetMapping("/index")
    public String getAllKhoaHoc(Model model) {
        model.addAttribute("khoaHocList", khoaHocService.findAll());
        return "index";
    }
    @RequestMapping(value = "/detail/{id}")
	public String detail(Model model, @PathVariable("id") int id) {
		Optional<KhoaHoc> item = daoKhoahoc.findById(id);
		model.addAttribute("itemDetail", item);
		return "detail";
	}
}