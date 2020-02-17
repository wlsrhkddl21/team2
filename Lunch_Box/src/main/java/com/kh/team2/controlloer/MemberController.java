package com.kh.team2.controlloer;




import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	@RequestMapping(value = "/joinPost", method = RequestMethod.POST)
	public String insertMember(HttpServletRequest request, MemberVo memberVo, Model model) throws Exception{
		// text 에서 아이디 와 패스워드와 중복체크 여부 값 받아옴
		System.out.println(request.getParameter("mem_id"));
		System.out.println(request.getParameter("mem_pass"));
		System.out.println(request.getParameter("mem_pass2"));
		System.out.println(request.getParameter("isCheck"));
		String mem_id = request.getParameter("mem_id");
		String mem_pass = request.getParameter("mem_pass");
		String mem_pass2 = request.getParameter("mem_pass2");
		String isCheck = request.getParameter("isCheck");
		// isChk true  == 공백을 확인
		// pass 워드 공백 이 아니거나 서로 같을 경우 
		// msg 줘
		String msg = "fail";
		if (isCheck.equals("true") && !mem_id.equals("")) {
			msg = "success";
		} else if (mem_pass == mem_pass2 && !mem_pass.equals("") && !mem_pass2.equals("")) {
			msg = "fail";
		}
		
		
		return msg;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, LogingDto logingDto, Model model) {
//		System.out.println("loginGet");
		
		return "member/login";
	}
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPost(HttpServletRequest request, LogingDto logingDto, Model model, MemberVo memberVo) throws Exception {
//		System.out.println("loginGet");
		System.out.println("logingDto:" + logingDto);
		memberVo = service.login(logingDto);
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
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "index";
	}
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(HttpServletRequest request, Model model) throws Exception {
		String mem_id = request.getParameter("mem_id");
		int idChk = 2;
		if (!mem_id.equals("")) {
		idChk = service.idCheck(mem_id);
		}
		return String.valueOf(idChk);
	}

					
	
}
