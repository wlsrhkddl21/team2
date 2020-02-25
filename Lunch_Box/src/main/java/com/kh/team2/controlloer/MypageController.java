package com.kh.team2.controlloer;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team2.domain.BuyJoinDto;
import com.kh.team2.domain.MemberVo;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.persistence.MemberDao;
import com.kh.team2.service.AdminService;
import com.kh.team2.service.BuyService;
import com.kh.team2.service.MemberService;

@RequestMapping(value="/mp/*")

@Controller
public class MypageController {
	@Inject
	MemberService memberService;
	
	@Inject
	AdminService adminService;
	
	@Inject
	BuyService buyService;
	
	@RequestMapping(value="/",method = RequestMethod.GET)
	public String myPage(HttpServletRequest request,Model model) throws Exception{
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		MemberVo memberVo = memberService.readMember(mem_id);
		
		model.addAttribute("memberVo",memberVo);
		
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/buyList",method = RequestMethod.GET)
	public String buyList(HttpServletRequest request,Model model) throws Exception{
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		MemberVo memberVo = memberService.readMember(mem_id);
		List<ProductVo> proList = adminService.readAllPDT();
		List<BuyJoinDto> list = buyService.selectJoinByMemId(mem_id);
		
		model.addAttribute("proList",proList);
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("buyList",list);
		
		return "mypage/buyList";
	}
	
	@RequestMapping(value="/pointList",method = RequestMethod.GET)
	public String pointList(HttpServletRequest request,Model model) throws Exception{
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		MemberVo memberVo = memberService.readMember(mem_id);
		
		model.addAttribute("memberVo",memberVo);
		
		
		return "mypage/pointList";
	}
}
