package com.kh.team2.controlloer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/mp/*")

@Controller
public class MypageController {
	//멤버 Vo 저장하기
	@RequestMapping(value="/",method = RequestMethod.GET)
	public String myPage() throws Exception{
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/buyList",method = RequestMethod.GET)
	public String buyList(Model model,String lunch_type) throws Exception{
		return "mypage/buyList";
	}
	
	@RequestMapping(value="/pointList",method = RequestMethod.GET)
	public String pointList(Model model,String lunch_type) throws Exception{
		return "mypage/pointList";
	}
}
