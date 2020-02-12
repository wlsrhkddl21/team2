package com.kh.team2.controlloer;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/lb")
public class MemberController {
	
	@RequestMapping(value = "/join")
	public String join() {
		
		
		return "member/join";
	}
	@RequestMapping(value = "/login")
	public String login() {
		
		
		return "member/login";
	}
	
}
