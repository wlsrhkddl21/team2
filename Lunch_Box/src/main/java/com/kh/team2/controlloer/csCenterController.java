package com.kh.team2.controlloer;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/cs/*")

@Controller
public class csCenterController {
	//멤버 Vo 저장하기
	@RequestMapping(value="/",method = RequestMethod.GET)
	public String csCenter() throws Exception{
		return "board/csCenter";
	}
	
	@RequestMapping(value="/notice",method = RequestMethod.GET)
	public String notice(Model model,String lunch_type) throws Exception{
		return "board/notice";
	}
	
	@RequestMapping(value="/qna",method = RequestMethod.GET)
	public String qna(Model model,String lunch_type) throws Exception{
		return "board/qna";
	}
}
