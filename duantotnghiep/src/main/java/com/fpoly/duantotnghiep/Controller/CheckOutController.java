package com.fpoly.duantotnghiep.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CheckOutController {
	@GetMapping("/courseOnline/CheckOut")
	public String CheckOut() {
		return "checkout";
	}
}
