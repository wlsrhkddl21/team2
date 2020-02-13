package com.kh.team2.controlloer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team2.domain.ProductVo;
import com.kh.team2.service.AdminService;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	@Inject
	AdminService service;
	
	@RequestMapping(value ="list",method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		List<ProductVo> list = service.readAllPDT();
		model.addAttribute("list", list);
		return "admin/adminList";
	}
}
