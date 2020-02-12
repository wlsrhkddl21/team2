package com.kh.team2.controlloer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bk")
public class BasketController {
	
	@RequestMapping("/basket")
	public String view() {
		
		return "basket/basketView"; 
	}
}
