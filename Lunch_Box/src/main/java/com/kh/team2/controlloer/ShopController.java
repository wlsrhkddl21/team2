package com.kh.team2.controlloer;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.team2.domain.BuyDto;
import com.kh.team2.domain.BuyVo;
import com.kh.team2.domain.CartDto;
import com.kh.team2.domain.MemberVo;
import com.kh.team2.domain.PointDto;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.service.AdminService;
import com.kh.team2.service.BuyService;
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

	@Inject
	BuyService buyService;

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
	public String detail(@PathVariable("pdt_num") int pdt_num, Model model) throws Exception {
		System.out.println("detail Shop Controller");
		ProductVo productVo = productService.readByPdtNum(pdt_num);

		model.addAttribute("productVo", productVo);

		return "shop/detail";
	}

	// 구매 페이지 (바로구매)
	@RequestMapping(value = "/buy", method = RequestMethod.POST)
	public String buy(HttpServletRequest request, Model model,CartDto cartDto) throws Exception {
		// for(int i=0; i<pdt_num.length;i++) {

		List<BuyDto> list = new ArrayList<>();
		int pdt_num[] = cartDto.getPdt_num();
		int buy_count[] = cartDto.getBuy_count();

		for (int i = 0; i < pdt_num.length; i++) {
//			System.out.println("상품번호:" + pdt_num[i] + "갯수:" + buy_count[i]);
			ProductVo pdtVo = productService.readByPdtNum(pdt_num[i]);

			BuyDto dto = new BuyDto(); // 주문 내역 보여주는 dto
			dto.setPdt_num(pdt_num[i]);
			dto.setBuy_count(buy_count[i]);
			dto.setPdt_name(pdtVo.getPdt_name());
			dto.setPdt_price(pdtVo.getPdt_price());

			list.add(dto);

		}
		// 구매자 정보
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		MemberVo memberVo = memberService.readMember(mem_id);

//		System.out.println(mem_id);

		model.addAttribute("memberVo", memberVo);
		model.addAttribute("list", list);

		return "shop/buy";
	}

	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public String complete(BuyVo buyVo,CartDto cartDto,PointDto pointDto) throws Exception {
		// buy 마스터 테이블 추가
		// 디테일 테이블 추가
		// 결제 완료 후 멤버 포인트 수정
		
		buyService.buy(buyVo, pointDto, cartDto);

		return "shop/complete";
	}

	@RequestMapping(value = "/buy/detail")
	public String buyDetail() {
		return "mypage/buy";
	}
}
