package com.kh.team2.controlloer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shop/")
public class ShopController {
	
	@RequestMapping(value = "/my")
	public String my() {
		
		return "shop/my";
	}
	
	@RequestMapping(value = "/sub")
	public String subscription() {
		
		
		return "shop/sub";
	}
	
	@RequestMapping(value = "/single")
	public String single() {
		
		
		return "shop/single";
	}
}
