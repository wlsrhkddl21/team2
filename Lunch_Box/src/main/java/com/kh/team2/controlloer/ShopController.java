package com.kh.team2.controlloer;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.team2.domain.BuyVo;
import com.kh.team2.domain.MemberVo;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.service.AdminService;
import com.kh.team2.service.MemberService;
import com.kh.team2.service.ProductService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {
	// 상품 정보 불러오기 (readPDT)
	@Inject
	private AdminService adminService;
	
	@Inject
	private ProductService productService;
	
	@Inject
	MemberService memberService;

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
	public String buy(HttpServletRequest request,BuyVo vo,Model model,@RequestParam("total_price") int total_price) throws Exception {
		System.out.println("buy Shop Controller");
		System.out.println("BuyVo:"+vo);
//		model.addAttribute("buyVo",vo);
		List<BuyVo> list = new ArrayList<BuyVo>();
			
		BuyVo vo2 = new BuyVo(0, 0, null, null, 6000, null, 1, null, "test1");
		BuyVo vo3 = new BuyVo(0, 0, null, null, 8000, null, 3, null, "test1");
		
		list.add(vo);
		list.add(vo2);
		list.add(vo3);
		
		List<Integer> pointList = new ArrayList<>();
		
		for(BuyVo vo1: list) {
			int point = (int) ((vo1.getBuy_price())*0.05);
			pointList.add(point);
		}
		

		// 구매자 정보 
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		MemberVo memberVo = memberService.readMember(mem_id);
		
//		System.out.println(mem_id);
		
		model.addAttribute("list",list);
		model.addAttribute("memberVo",memberVo);
		
		return "shop/buy";
	}
}
