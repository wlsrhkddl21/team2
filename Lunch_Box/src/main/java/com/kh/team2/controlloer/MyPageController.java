package com.kh.team2.controlloer;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team2.domain.BuyJoinDto;
import com.kh.team2.domain.BuyMyVo;
import com.kh.team2.domain.MemberVo;
import com.kh.team2.domain.PointVo;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.service.AdminService;
import com.kh.team2.service.BuyService;
import com.kh.team2.service.MemberService;

@RequestMapping(value="/mp/*")

@Controller
public class MyPageController {
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
		List<BuyJoinDto> buyFirstlist = new ArrayList<BuyJoinDto>();
		int buy_num =0;
		for(BuyJoinDto buyJoinDto : list) {
			if(buyJoinDto.getBuy_num()!=buy_num) {
				buyFirstlist.add(buyJoinDto);
				buy_num = buyJoinDto.getBuy_num();
			}
		}
		
		model.addAttribute("buyFirstlist",buyFirstlist);
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
		
		List<PointVo> list = memberService.pointList(mem_id);
		
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("list",list);
		
		
		
		return "mypage/pointList";
	}

	@RequestMapping(value="/buyMyList",method = RequestMethod.GET)
	public String buyMyList(HttpServletRequest request,Model model) throws Exception{
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		List<BuyMyVo> list = buyService.selectBuyMyByMemId(mem_id);
		System.out.println(list);
		model.addAttribute("list",list);
		
		return "mypage/buyMyList";
	}
	@RequestMapping(value="/myInfo",method = RequestMethod.GET)
	public String myInfo(HttpServletRequest request,Model model) throws Exception{
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		MemberVo memVo = memberService.readMember(mem_id);
		model.addAttribute("memVo",memVo);
		
		return "mypage/myInfo";
	}
	
	@RequestMapping(value="/memUpdate",method=RequestMethod.POST)
	public String memUpdate(HttpServletRequest request,MemberVo memberVo) throws Exception{
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		String mem_detailAddress = request.getParameter("mem_detailAddress");
		String sumAddress = memberVo.getMem_address()+" "+mem_detailAddress;
		memberVo.setMem_address(sumAddress);
		memberVo.setMem_id(mem_id);
		memberService.memUpdate(memberVo);
		session.setAttribute("msg", "수정완료");
		return "redirect:/mp/myInfo";
				
	}
					
	
}
