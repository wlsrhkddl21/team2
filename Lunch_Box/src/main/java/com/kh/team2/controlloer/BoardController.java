package com.kh.team2.controlloer;

import java.util.List;



import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Inject
	BoardService boardService;
	
	@RequestMapping(value ="notice",method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		List<BoardVo> list = boardService.listAll(); 
		model.addAttribute("list", list);
		return "board/notice";
	}
	
}
