package com.kh.team2.controlloer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.team2.domain.FaqVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.service.FaqService;

@Controller
@RequestMapping("/board/")
public class FaqController {
	@Inject
	FaqService faqService;
	
	@RequestMapping(value ="faq",method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto) throws Exception {
		List<FaqVo> list = faqService.listAll(pagingDto);
		int totalCount = faqService.listCount(pagingDto);
		pagingDto.setTotalCount(totalCount);
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "board/faq";
	}

	// Faq 등록페이지로 이동
	@RequestMapping(value="/faqRegister", method = RequestMethod.GET)
	public String faqRegist(Model model, PagingDto pagingDto) throws Exception {
		model.addAttribute("pagingDto", pagingDto);
		return "board/faqRegister";
	}
	
	// Faq 등록하기
	@RequestMapping(value= "/faqRegister2", method = RequestMethod.POST)
	public String faqRegisterPOST(FaqVo faqVo, PagingDto pagingDto) throws Exception {
		faqService.create(faqVo);
		return "redirect:/board/faq?page=1&perPage=" + pagingDto.getPerPage();
	}
	
	
	// 글읽기
	@RequestMapping(value="/faqRead", method = RequestMethod.GET)
	public String read(@RequestParam("faq_num") int faq_num,
			@ModelAttribute PagingDto pagingDto, Model model) throws Exception {
		FaqVo faqVo = faqService.read(faq_num);
		model.addAttribute("faqVo", faqVo);
		return "board/faqRead";
	}
	
	// 글수정
	@RequestMapping(value="/faqUpdate", method = RequestMethod.POST)
	public String update(FaqVo faqVo, 
			@ModelAttribute PagingDto pagingDto) throws Exception {
		faqService.update(faqVo);
		return "redirect:/board/faqRead?faq_num=" + faqVo.getFaq_num() + "&page=" 
				+ pagingDto.getPage() + "&perPage=" + pagingDto.getPerPage();
	}
	
	// 글삭제
	@RequestMapping(value="/faqDelete", method = RequestMethod.GET)
	public String delete(@RequestParam("faq_num") int faq_num) throws Exception {
		faqService.delete(faq_num);
		return "redirect:/board/faq";
	}
	
}
