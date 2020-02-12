package com.kh.team2.controlloer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	@RequestMapping(value ="list",method = RequestMethod.GET)
	public String list() {
		return "admin/adminList";
	}
}
