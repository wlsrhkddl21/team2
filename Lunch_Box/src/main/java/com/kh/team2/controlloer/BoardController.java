package com.kh.team2.controlloer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@RequestMapping(value ="notice",method = RequestMethod.GET)
	public String notice() {
		return "board/notice";
	}
	@RequestMapping(value ="qna",method = RequestMethod.GET)
	public String qna() {
		return "board/qna";
	}
}
