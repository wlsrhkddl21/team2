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

import com.kh.team2.domain.BuyDto;
import com.kh.team2.domain.BuyMyVo;
import com.kh.team2.domain.BuyVo;
import com.kh.team2.domain.CartDto;
import com.kh.team2.domain.MemberVo;
import com.kh.team2.domain.MyLunchVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.PointDto;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.domain.ReviewVo;
import com.kh.team2.service.AdminService;
import com.kh.team2.service.BuyService;
import com.kh.team2.service.CartService;
import com.kh.team2.service.MemberService;
import com.kh.team2.service.MyLunchService;
import com.kh.team2.service.RevReplyService;
import com.kh.team2.service.ReviewService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {
	// �긽�뭹 �젙蹂� 遺덈윭�삤湲� (readPDT)
	@Inject
	private AdminService adminService;

	@Inject
	MemberService memberService;
	
	@Inject
	BuyService buyService;
	
	@Inject
	CartService carService;
	
	@Inject
	MyLunchService myLunchService;
	
	@Inject
	RevReplyService replyService;
	
	@Inject
	ReviewService reviewService;

	// �굹留뚯쓽 �룄�떆�씫
	@RequestMapping(value = "/my")
	public String my() {

		return "shop/my"; 
	}

	
	// �씪諛� �긽�뭹
	@RequestMapping(value = "/single")
	public String single(Model model,PagingDto pagingDto,HttpServletRequest request) throws Exception {

		System.out.println("single Shop Controller");
		// 理쒓렐紐⑸줉
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		List<ProductVo> veiwList = (ArrayList)session.getAttribute("veiw");
		int cartCount = 0;
		if (mem_id != null) {
			cartCount = carService.cartCount(mem_id);
		}
		model.addAttribute("cartCount", cartCount);
		model.addAttribute("veiwList",veiwList);
		// --

		List<ProductVo> list = adminService.readAllPDT();
		model.addAttribute("list", list);

		return "shop/single";
	}

	// �긽�뭹 �긽�꽭蹂닿린
	@RequestMapping(value = "/detail/{pdt_num}", method = RequestMethod.GET)
	public String detail(@PathVariable("pdt_num") int pdt_num, Model model,HttpServletRequest request, PagingDto pagingDto) throws Exception {
		System.out.println("detail Shop Controller"); 
		//�긽�뭹 �뵒�뀒�씪 �젙蹂� 遺덈윭�삤湲�
		ProductVo productVo = adminService.readPDT(pdt_num); 
		model.addAttribute("productVo", productVo); 
		//理쒓렐 紐⑸줉
		HttpSession session = request.getSession();
		
		// 理쒓렐蹂� �긽�뭹 �꽭�뀡�뿉 異붽�
		List<ProductVo> list = (ArrayList)session.getAttribute("veiw");
		if (list == null) {
			list = new ArrayList<>();
			session.setAttribute("veiw", list);
		}
		for(int j=0 ;  j <list.size(); j++) {
		if(productVo.getPdt_num() ==list.get(j).getPdt_num()){
			list.remove(j);
			}
		}
		list.add(productVo);
		if(list.size() > 1) { 
			ProductVo productVo1 = list.get(list.size()-1);
			System.out.println(productVo1);
			for(int i =list.size(); i>1 ; i-- ) {
				list.set(i-1, list.get(i-2));
			}
			list.set(0, productVo1);
		}
		if(list.size()==6) {
			list.remove(5);
		}
		// -----------------------------------------------------
		// 理쒓렐紐⑸줉
		String mem_id = (String)session.getAttribute("mem_id");
		int cartCount = 0;
		if (mem_id != null) {
			cartCount = carService.cartCount(mem_id);
		}
		model.addAttribute("cartCount", cartCount);
		model.addAttribute("veiwList",list);
		// 理쒓렐紐⑸줉 �걹
		
		// 由щ럭�옉�꽦
		List<ReviewVo> reviewList = reviewService.readPdtNum(pdt_num);
		System.out.println(reviewList);
		model.addAttribute("reviewList", reviewList);
		// 由щ럭�옉�꽦 �걹
		
		
		return "shop/detail";
	}


	//�굹留뚯쓽 �룄�떆�씫
	@RequestMapping(value = "/detailMy", method = RequestMethod.GET)
	public String detailMy(Model model) throws Exception {
		
		List<MyLunchVo> list = myLunchService.readAllMLB("all");
		model.addAttribute("list",list);
		
		return "shop/detailMy";
	}
	
	// 援щℓ �럹�씠吏� (諛붾줈援щℓ)
	@RequestMapping(value = "/buy", method = RequestMethod.POST)
	public String buy(HttpServletRequest request, Model model,CartDto cartDto) throws Exception {
		// for(int i=0; i<pdt_num.length;i++) {

		List<BuyDto> list = new ArrayList<>();
		int pdt_num[] = cartDto.getPdt_num();
		int buy_count[] = cartDto.getBuy_count();

		for (int i = 0; i < pdt_num.length; i++) {
//			System.out.println("�긽�뭹踰덊샇:" + pdt_num[i] + "媛��닔:" + buy_count[i]);
			ProductVo pdtVo = adminService.readPDT(pdt_num[i]);

			BuyDto dto = new BuyDto(); // 二쇰Ц �궡�뿭 蹂댁뿬二쇰뒗 dto
			dto.setPdt_num(pdt_num[i]);
			dto.setBuy_count(buy_count[i]);
			dto.setPdt_name(pdtVo.getPdt_name());
			dto.setPdt_price(pdtVo.getPdt_price());
			dto.setPdt_image(pdtVo.getPdt_image());

			list.add(dto);

		}
		// 援щℓ�옄 �젙蹂�
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		MemberVo memberVo = memberService.readMember(mem_id);

//		System.out.println(mem_id);

		model.addAttribute("memberVo", memberVo);
		model.addAttribute("list", list);

		return "shop/buy";
	}

	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	//BuyVo buyVo,CartDto cartDto,PointDto pointDto), method = RequestMethod.POST)
	public String complete(BuyVo buyVo,CartDto cartDto,PointDto pointDto,HttpServletRequest request) throws Exception {
		// buy 留덉뒪�꽣 �뀒�씠釉� 異붽�
		// �뵒�뀒�씪 �뀒�씠釉� 異붽�
		// 寃곗젣 �셿猷� �썑 硫ㅻ쾭 �룷�씤�듃 �닔�젙
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		buyService.buy(buyVo, pointDto, cartDto);
		carService.allDelete(mem_id);

		return "shop/complete";
	}
	
	@RequestMapping(value = "/buyMy", method = RequestMethod.POST)
	public String buyMy(HttpServletRequest request,BuyMyVo myVo,Model model) throws Exception {
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		MemberVo memberVo = memberService.readMember(mem_id);

//		System.out.println(mem_id);

		model.addAttribute("memberVo", memberVo);
		model.addAttribute("vo",myVo);
		System.out.println(myVo);

		return "shop/buyMy";
	}
	
	@RequestMapping(value = "/completeMy", method = RequestMethod.POST)
	//BuyVo buyVo,CartDto cartDto,PointDto pointDto), method = RequestMethod.POST)
	public String complete(HttpServletRequest request,BuyMyVo buyVo,PointDto pointDto) throws Exception {
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		buyVo.setMem_id(mem_id);
//	System.out.println(buyVo);
//	System.out.println(pointDto);
		buyService.buyMy(buyVo, pointDto);

		return "shop/complete";
	}
}
