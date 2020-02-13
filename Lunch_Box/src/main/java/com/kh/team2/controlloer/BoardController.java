package com.kh.team2.controlloer;

import java.util.List;




import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Inject
	BoardService boardService;
	
	@RequestMapping(value ="notice",method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto) throws Exception {
		List<BoardVo> list = boardService.listAll(pagingDto); 
		int totalCount = boardService.listCount(pagingDto);
		pagingDto.setTotalCount(totalCount);
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "board/notice";
	}

	// 글등록폼 -> /board/register -> GET 방식 요청 처리
	@RequestMapping(value="/ntRegister", method = RequestMethod.GET)
	public String nrRegist(Model model, PagingDto pagingDto) throws Exception {
		model.addAttribute("pagingDto", pagingDto);
		return "board/ntRegister";
	}
	
	
	
	
	
}
