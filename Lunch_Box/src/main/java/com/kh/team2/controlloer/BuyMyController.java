package com.kh.team2.controlloer;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team2.domain.BuyDto;
import com.kh.team2.domain.BuyMyVo;
import com.kh.team2.domain.BuyVo;
import com.kh.team2.domain.CartDto;
import com.kh.team2.domain.MemberVo;
import com.kh.team2.domain.PointDto;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.service.AdminService;
import com.kh.team2.service.BuyService;
import com.kh.team2.service.CartService;
import com.kh.team2.service.MemberService;
import com.kh.team2.service.MyLunchService;

@Controller
@RequestMapping("/shop/*")
public class testController {
	@Inject
	private AdminService adminService;

	@Inject
	MemberService memberService;
	
	@Inject
	BuyService buyService;
	
	@Inject
	CartService carService;
	
	@Inject
	MyLunchService myLunchService;
	
	// 구매 페이지 (바로구매)
	
		@RequestMapping(value = "/buyMy", method = RequestMethod.POST)
		public String buyMy(HttpServletRequest request,BuyMyVo myVo,Model model) throws Exception {
			HttpSession session = request.getSession();
			String mem_id = (String) session.getAttribute("mem_id");
			MemberVo memberVo = memberService.readMember(mem_id);

//			System.out.println(mem_id);

			model.addAttribute("memberVo", memberVo);
			model.addAttribute("vo",myVo);
			System.out.println(myVo);

			return "shop/buyMy";
		}
		
		@RequestMapping(value = "/completeMy", method = RequestMethod.POST)
		//BuyVo buyVo,CartDto cartDto,PointDto pointDto), method = RequestMethod.POST)
		public String complete(HttpServletRequest request,BuyMyVo buyVo,PointDto pointDto) throws Exception {
			HttpSession session = request.getSession();
			String mem_id = (String) session.getAttribute("mem_id");
			buyVo.setMem_id(mem_id);
//		System.out.println(buyVo);
//		System.out.println(pointDto);
			buyService.buyMy(buyVo, pointDto);

			return "shop/complete";
		}
		
		
}
