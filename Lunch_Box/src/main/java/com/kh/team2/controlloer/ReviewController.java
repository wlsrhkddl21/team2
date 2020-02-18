package com.kh.team2.controlloer;

import java.util.List;




import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.ReviewVo;
import com.kh.team2.service.BoardService;
import com.kh.team2.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Inject
	ReviewService reviewService;
	
	@RequestMapping(value ="/reviewBoard",method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto) throws Exception {
		System.out.println("¸®ºä°Ô½ÃÆÇ µé¾î¿È");
		List<ReviewVo> list = reviewService.listAll(pagingDto);
		int totalCount = reviewService.listCount(pagingDto);
		pagingDto.setTotalCount(totalCount);
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "/review/reviewBoard";
	}

		
}
