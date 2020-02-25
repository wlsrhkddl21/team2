package com.kh.team2.controlloer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.FaqVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.ReviewVo;
import com.kh.team2.service.BoardService;
import com.kh.team2.service.FaqService;
import com.kh.team2.service.ReviewService;

@RequestMapping(value="/cs/*")

@Controller
public class csCenterController {
	
	@Inject
	BoardService boardService;
	@Inject
	ReviewService reviewService;
	@Inject
	FaqService faqService;
	@RequestMapping(value ="/",method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto) throws Exception {
		List<BoardVo> listPage = boardService.listPage(pagingDto);
		List<BoardVo> hotList = boardService.hotList(pagingDto);
		List<ReviewVo> reviewList = reviewService.reviewList(pagingDto);
		List<FaqVo> list = faqService.listAll(pagingDto);
		
		int totalCount = boardService.listCount(pagingDto);
		pagingDto.setTotalCount(totalCount);
		model.addAttribute("listPage", listPage);
		model.addAttribute("hotList", hotList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("list", list);
		
		model.addAttribute("pagingDto", pagingDto);
		return "board/csCenter";
	}
//	@RequestMapping(value="/",method = RequestMethod.GET)
//	public String csCenter() throws Exception{
//		return "board/csCenter";
//	}
	
	@RequestMapping(value="/notice",method = RequestMethod.GET)
	public String notice(Model model,String lunch_type) throws Exception{
		return "board/notice";
	}
	
	@RequestMapping(value="/qna",method = RequestMethod.GET)
	public String qna(Model model,String lunch_type) throws Exception{
		return "board/qna";
	}
}
