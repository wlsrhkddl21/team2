package com.kh.team2.controlloer;

import java.io.File;
import java.io.FileInputStream;
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
import com.kh.team2.service.AdminService;
import com.kh.team2.service.BoardService;
import com.kh.team2.service.ReviewService;
import com.kh.team2.util.ReviewFileUploadUtil;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Inject
	ReviewService reviewService;
	
	@Inject
	AdminService adminService;
	
	@Resource
	private String uploadPath;
	
	// 리뷰게시판
	@RequestMapping(value ="/reviewBoard",method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto) throws Exception {
		System.out.println(pagingDto);
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
		List<ProductVo> list = reviewService.productName();
		System.out.println(list);
		model.addAttribute("list", list);
		return "/review/reviewRegister";
	}
	
	// 글등록
	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
	public String insertReview(ReviewVo reviewVo, MultipartHttpServletRequest request) throws Exception { 
		System.out.println(reviewVo);
//		reviewService.insertReview(reviewVo);
		MultipartFile file = request.getFile("file");
		String originalFileName = file.getOriginalFilename();
		System.out.println("file:" + originalFileName);
		String revPath = ReviewFileUploadUtil.uploadFile(uploadPath+"/review", originalFileName, file.getBytes(), true);
		String revMainPath = revPath.replace("\\", "/");
		reviewVo.setRev_image(revMainPath);
//		System.out.println("글쓰고 리뷰게시판옴");
		reviewService.insertReview(reviewVo);
		return "redirect:/review/reviewBoard";
	}
	
	// 글 상세보기
	@RequestMapping(value ="/reviewContent",method = RequestMethod.GET)
	public String reviewContent(@RequestParam("rev_num") int rev_num,@ModelAttribute PagingDto pagingDto,Model model) throws Exception {
		ReviewVo reviewVo = reviewService.readReview(rev_num);
		model.addAttribute("reviewVo", reviewVo);
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
		
}
