package com.kh.team2.controlloer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team2.domain.BuyVo;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.service.AdminService;
import com.kh.team2.service.ProductService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {
	// 상품 정보 불러오기 (readPDT)
	@Inject
	private AdminService adminService;
	
	@Inject
	private ProductService productService;

	// 나만의 도시락
	@RequestMapping(value = "/my")
	public String my() {

		return "shop/my";
	}

	// 정기 배송
	@RequestMapping(value = "/sub")
	public String subscription(Model model) throws Exception {
		System.out.println("subscription Shop Controller");

		List<ProductVo> list = adminService.readAllPDT();
		model.addAttribute("list", list);

		return "shop/sub";
	}

	// 일반 상품
	@RequestMapping(value = "/single")
	public String single(Model model) throws Exception {

		System.out.println("single Shop Controller");

		List<ProductVo> list = adminService.readAllPDT();
		model.addAttribute("list", list);

		return "shop/single";
	}

	// 상품 상세보기
	@RequestMapping(value = "/detail/{pdt_num}", method = RequestMethod.GET)
	public String detail(@PathVariable("pdt_num") int pdt_num,Model model) throws Exception {
		System.out.println("detail Shop Controller");
		ProductVo productVo = productService.readByPdtNum(pdt_num);
		
		model.addAttribute("productVo",productVo);
		
		return "shop/detail";
	}
	
	
	//구매 페이지
	@RequestMapping(value = "/buy", method = RequestMethod.POST)
	public String buy(BuyVo vo,Model model) throws Exception {
		System.out.println("buy Shop Controller");
		System.out.println("BuyVo:"+vo);
		model.addAttribute("buyVo",vo);
		
		return "shop/buy";
	}
}
