package com.kh.team2.controlloer;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team2.domain.LogingDto;
import com.kh.team2.domain.MemberVo;
import com.kh.team2.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/lb")
public class MemberController {
	
//	@Autowired
//	private UserMailSendService mailSender;
	
	@Inject
	private MemberService service;
	
	@RequestMapping(value = "/joinGet", method = RequestMethod.GET)
	public String join(MemberVo memberVo) throws Exception{
		System.out.println("joinGet");
		
		return "member/join";
	}
	@RequestMapping(value = "/joinPost", method = RequestMethod.POST)
	public String insertMember(HttpServletRequest request, MemberVo memberVo, Model model) throws Exception{
//		System.out.println("joinPost");
//		System.out.println("memberVo:" + memberVo);
		service.insertMember(memberVo);
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, LogingDto logingDto, Model model) {
//		System.out.println("loginGet");
		
		return "member/login";
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPost(HttpServletRequest request, LogingDto logingDto, Model model) {
//		System.out.println("loginGet");
		System.out.println("�α����ϰ� ���ο�");
		System.out.println("logingDto:" + logingDto);
		return "index";
	}
	
	
	
	
}
