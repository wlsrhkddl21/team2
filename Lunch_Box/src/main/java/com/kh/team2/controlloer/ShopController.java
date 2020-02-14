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
	// 파일
	@Inject
	private AdminService adminService;
	
	@Inject
	private ProductService productService;

	// 占쎄돌筌???占쎈?占쎈占쎌?
	@RequestMapping(value = "/my")
	public String my() {

		return "shop/my";
	}

	// 占쎌疫뀐옙 獄怨?
	@RequestMapping(value = "/sub")
	public String subscription(Model model) throws Exception {
		System.out.println("subscription Shop Controller");

		List<ProductVo> list = adminService.readAllPDT();
		model.addAttribute("list", list);

		return "shop/sub";
	}

	// 占쎌よ?占?占쎄맒占쎈?
	@RequestMapping(value = "/single")
	public String single(Model model) throws Exception {

		System.out.println("single Shop Controller");

		List<ProductVo> list = adminService.readAllPDT();
		model.addAttribute("list", list);

		return "shop/single";
	}

	// 占쎄맒占쎈?占쎄맒占쎄쉭癰?용┛
	@RequestMapping(value = "/detail/{pdt_num}", method = RequestMethod.GET)
	public String detail(@PathVariable("pdt_num") int pdt_num,Model model) throws Exception {
		// @PathVariable("pdt_num") int pdt_num
		System.out.println("detail Shop Controller");
		ProductVo productVo = productService.readByPdtNum(pdt_num);
		
		model.addAttribute("productVo",productVo);
		
		return "shop/detail";
	}
	
	@RequestMapping(value = "/buy", method = RequestMethod.POST)
	public String buy(BuyVo vo,Model model) throws Exception {
		// @PathVariable("pdt_num") int pdt_num
		System.out.println("buy Shop Controller");
		System.out.println("BuyVo:"+vo);
		model.addAttribute("buyVo",vo);
		
		return "shop/buy";
	}
}
