package com.kh.team2.controlloer;




import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		return "member/join";
	}
	@ResponseBody
	@RequestMapping(value = "/joinCheck", method = RequestMethod.POST)
	public String check(HttpServletRequest request, MemberVo memberVo, Model model) throws Exception{
		String mem_pass = request.getParameter("mem_pass");
		String mem_pass2 = request.getParameter("mem_pass2");
		String isCheck = request.getParameter("isCheck");
		String msg = "msgCheck";
		if (isCheck.equals("true")) {
			if(mem_pass.equals(mem_pass2) && !mem_pass.equals("")) {
				msg = "success";
			} else {
				msg = "fail";
			}
		}
		return msg;
	}
	
	@RequestMapping(value = "/joinPost", method = RequestMethod.POST)
	public String insertMember(MemberVo memberVo, HttpServletRequest request) throws Exception {
		String detailAddress = request.getParameter("detailAddress");
		String mem_address = memberVo.getMem_address();
		System.out.println(mem_address);
		System.out.println(detailAddress);
		String sumAddress = mem_address+" "+detailAddress;
		memberVo.setMem_address(sumAddress);
		service.insertMember(memberVo);
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, LogingDto logingDto, Model model) {
		
		return "member/login";
	}
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPost(HttpServletRequest request, LogingDto logingDto, Model model, MemberVo memberVo) throws Exception {
		memberVo = service.login(logingDto);
		HttpSession session = request.getSession();
		String go = "";
		if (memberVo != null) {
			session.setAttribute("msg", "success");
			session.setAttribute("memberVo", memberVo);
			session.setAttribute("mem_name", memberVo.getMem_name());
			session.setAttribute("mem_id", memberVo.getMem_id());
			session.setAttribute("mem_pass", memberVo.getMem_pass());
			go = "redirect:/";
		} else {	
			session.setAttribute("msg","fail");
			session.setAttribute("memberVo", memberVo);
			go = "member/login";
		}
		return go;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public Map<String, Object> idCheck(HttpServletRequest request, Model model) throws Exception {
		String mem_id = request.getParameter("mem_id");
		String isCheck = request.getParameter("isCheck");
		String msg = "이메일을 입력해주세요";
		int chk = service.idCheck(mem_id);
		if (!mem_id.equals("")) {
			if (chk == 0) {
				isCheck = "true";
				msg = "사용 가능한 아이디";
			} else {
				msg = "사용중인 아이디";
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", msg);
		map.put("isCheck", isCheck);
		return map;
	}
	
	@RequestMapping(value="/memUpdate",method=RequestMethod.POST)
	public String memUpdate(MemberVo memberVo) throws Exception{
		System.out.println(memberVo);
		return null;
	}
					
	
}
