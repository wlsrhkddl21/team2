package com.kh.team2.controlloer;


import org.omg.CORBA.Request;
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
	
	@RequestMapping(value = "/joinGet", method = RequestMethod.GET)
	public String join(MemberVo memberVo) throws Exception{
		System.out.println("joinGet");
		
		return "member/join";
	}
	@RequestMapping(value = "/joinPost", method = RequestMethod.POST)
	public String register(MemberVo memberVo) {
		System.out.println("joinPost");
		
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("loginGet");
		
		return "member/login";
	}
	
}
