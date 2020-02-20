package com.kh.team2.controlloer;

import java.util.List;




import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.domain.ReviewVo;
import com.kh.team2.service.AdminService;
import com.kh.team2.service.BoardService;
import com.kh.team2.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Inject
	ReviewService reviewService;
	
	@Inject
	AdminService adminService;
	
	// 리뷰게시판
	@RequestMapping(value ="/reviewBoard",method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto) throws Exception {
		List<ReviewVo> list = reviewService.listAll(pagingDto);
		List<ProductVo> productList = adminService.readAllPDT();
		int totalCount = reviewService.listCount(pagingDto);
//		ReviewVo reviewVo = new ReviewVo();
		
		pagingDto.setTotalCount(totalCount);
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("productList", productList);
		return "/review/reviewBoard";
	}
	
	// 글쓰러가기
	@RequestMapping(value ="/reviewRegister",method = RequestMethod.GET)
	public String reviewRegister(Model model) throws Exception {
		
		System.out.println("글쓰기들어옴");
		
		return "/review/reviewRegister";
	}
	
	// 글등록
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public String insertReview(Model model, PagingDto pagingDto, ReviewVo reviewVo) throws Exception {
//		reviewService.insertReview(reviewVo);

		return "redirect:/review/reviewBoard";
	}
	
	// 글 상세보기
	@RequestMapping(value ="/reviewContent",method = RequestMethod.GET)
	public String reviewContent(Model model, PagingDto pagingDto) throws Exception {
		
		return "/review/reviewContent";
	}

		
}
