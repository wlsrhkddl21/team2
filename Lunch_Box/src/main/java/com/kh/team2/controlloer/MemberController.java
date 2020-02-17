package com.kh.team2.controlloer;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String loginPost(HttpServletRequest request, LogingDto logingDto, Model model) throws Exception {
//		System.out.println("loginGet");
		System.out.println("logingDto:" + logingDto);
		MemberVo memberVo = service.login(logingDto);
//		MemberVo memberVo2 = service.readWithPw(logingDto.getMem_id(), logingDto.getMem_pass());
		HttpSession session = request.getSession();
		String go = "";
		if (memberVo != null) {
			model.addAttribute("msg", "성공");
			model.addAttribute("memberVo", memberVo);
			session.setAttribute("mem_name", memberVo.getMem_name());
			session.setAttribute("mem_id", memberVo.getMem_id());
			session.setAttribute("mem_pass", memberVo.getMem_pass());
			go = "index";
		} else {	
			model.addAttribute("msg","실패");
			model.addAttribute("memberVo", memberVo);
			go = "member/login";
		}
		return go;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "index";
	}
	
	
	
	
	
	
}
