package com.kh.team2.controlloer;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team2.domain.MemberVo;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/lb")
public class MemberController {
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(MemberVo memberVo) {
		
		
		return "member/join";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		
		return "member/login";
	}
	
}
