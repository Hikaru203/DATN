package com.fpoly.duantotnghiep.Controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
class CourseOnlineController {
	@GetMapping("/courseOnline/video")
    public String index(Model model) {
    	
        return "loadVideo";
    }
}
