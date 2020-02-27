package com.kh.team2;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.FaqVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.domain.ReviewVo;
import com.kh.team2.service.AdminService;
import com.kh.team2.service.BoardService;
import com.kh.team2.service.FaqService;
import com.kh.team2.service.ReviewService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	AdminService adminService;
	@Inject
	BoardService boardService;
	@Inject
	FaqService faqService;
	@Inject
	ReviewService reviewService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception{
//		logger.info("Welcome home! The client locale is {}.", locale);
		PagingDto dto = new PagingDto();
		dto.setStartRow(1);
		dto.setEndRow(5);
		List<ProductVo> top3List = adminService.readTOP3();
		List<BoardVo> hotList = boardService.hotList(dto);
		List<FaqVo> faqList = faqService.listAll(dto);
		List<ProductVo> pdtList = adminService.readAllPDT();
		List<ReviewVo> reviewList = reviewService.reviewList(dto);
		System.out.println(reviewList);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("top3List", top3List );
		model.addAttribute("hotList", hotList);
		model.addAttribute("faqList", faqList);
		model.addAttribute("pdtList", pdtList);
		model.addAttribute("reviewList", reviewList);
		
		return "index";
//		return "contact";
	}
	
}
