package com.kh.team2.controlloer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.team2.domain.ProductVo;
import com.kh.team2.service.AdminService;

@Controller
@RequestMapping("/shop/")
public class ShopController {
	//상품 정보 불러오기
	@Inject
	private AdminService adminService;
	
	//나만의 도시락
	@RequestMapping(value = "/my")
	public String my() {
		
		return "shop/my";
	}
	
	//정기 배송
	@RequestMapping(value = "/sub")
	public String subscription(Model model) throws Exception {
	System.out.println("subscription Shop Controller");
		
		List<ProductVo> list = adminService.readAllPDT();
		model.addAttribute("list",list);
		
		return "shop/sub";
	}
	
	// 일반 상품 
	@RequestMapping(value = "/single")
	public String single(Model model) throws Exception {
		
		System.out.println("single Shop Controller");
		
		List<ProductVo> list = adminService.readAllPDT();
		model.addAttribute("list",list);
		
		return "shop/single";
	}
}
