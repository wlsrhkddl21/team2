package com.kh.team2.controlloer;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.SynchronousQueue;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.MemberVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.domain.ReviewVo;
import com.kh.team2.persistence.ReviewDao;
import com.kh.team2.service.AdminService;
import com.kh.team2.service.BoardService;
import com.kh.team2.service.BuyService;
import com.kh.team2.service.ReviewService;
import com.kh.team2.util.ReviewFileUploadUtil;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Inject
	BuyService buyService;
	
	@Inject
	ReviewService reviewService;
	
	@Inject
	ReviewDao reviewDao;
	
	@Inject
	AdminService adminService;
	
	@Resource
	private String uploadPath;
	
	// 리뷰게시판
	@RequestMapping(value ="/reviewBoard",method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto) throws Exception {
		List<ReviewVo> list = reviewService.listAll(pagingDto);
		List<ProductVo> productList = adminService.readAllPDT();
		int totalCount = reviewService.listCount(pagingDto);
		
		pagingDto.setTotalCount(totalCount);
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		model.addAttribute("productList", productList);
		return "/review/reviewBoard";
	}
	
	// 글쓰러가기
	@RequestMapping(value ="/reviewRegister",method = RequestMethod.GET)
	public String reviewRegister(Model model,@RequestParam String buy_num) throws Exception {
		List<ProductVo> list = reviewService.productName();
		model.addAttribute("buy_num",buy_num);
		model.addAttribute("list", list);
		return "/review/reviewRegister";
	}
	
	// 글등록
	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
	public String insertReview(ReviewVo reviewVo, MultipartHttpServletRequest request) throws Exception { 
		int buy_num = Integer.parseInt(request.getParameter("buy_num"));
		int rev_num = reviewDao.getRev_num();
		System.out.println("buy:"+buy_num);
		System.out.println("rev_num:"+rev_num);
		List<Integer> BRNum = new ArrayList<Integer>();
		BRNum.add(buy_num);
		BRNum.add(rev_num);
		reviewVo.setRev_num(rev_num);
		MultipartFile file = request.getFile("file");
		String originalFileName = file.getOriginalFilename();
		String revPath = ReviewFileUploadUtil.uploadFile(uploadPath+"/review", originalFileName, file.getBytes(), true);
		String revMainPath = revPath.replace("\\", "/");
		reviewVo.setRev_image(revMainPath);
		buyService.buy_reviewUpdate(BRNum);
		reviewService.insertReview(reviewVo);
		return "redirect:/review/reviewBoard";
	}
	
	// 글 상세보기
	@RequestMapping(value ="/reviewContent",method = RequestMethod.GET)
	public String reviewContent(@ModelAttribute PagingDto pagingDto,
								Model model,@RequestParam("rev_num")int rev_num) throws Exception {
		List<ProductVo> list = reviewService.productName();
		ReviewVo vo = reviewService.readReview(rev_num);
		model.addAttribute("list", list);
		model.addAttribute("reviewVo", vo);
		return "/review/reviewContent";
	}
	
	@RequestMapping(value = "/displayFile", method =  RequestMethod.GET)
	@ResponseBody
	public byte[] displayFile(@RequestParam("fileName") String fileName) throws Exception {
		String realPath = uploadPath+"\\review" + File.separator + fileName.replace("/", "\\");
		FileInputStream is = new FileInputStream(realPath);
		byte[] bytes = IOUtils.toByteArray(is);
		is.close();
		return bytes;
	}
	
	// 리뷰삭제
	@RequestMapping(value = "/reviewDelete", method = RequestMethod.GET)
	public String reviewDelete(@RequestParam("rev_num") int rev_num) throws Exception {
		reviewService.reviewDelete(rev_num);
		return "redirect:/review/reviewBoard";
	}
}
