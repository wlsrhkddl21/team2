package com.kh.team2.controlloer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team2.domain.ProductVo;
import com.kh.team2.service.AdminService;
import com.kh.team2.service.ProductService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {
	// �긽�뭹 �젙蹂� 遺덈윭�삤湲�
	@Inject
	private AdminService adminService;
	
	@Inject
	private ProductService productService;

	// �굹留뚯쓽 �룄�떆�씫
	@RequestMapping(value = "/my")
	public String my() {

		return "shop/my";
	}

	// �젙湲� 諛곗넚
	@RequestMapping(value = "/sub")
	public String subscription(Model model) throws Exception {
		System.out.println("subscription Shop Controller");

		List<ProductVo> list = adminService.readAllPDT();
		model.addAttribute("list", list);

		return "shop/sub";
	}

	// �씪諛� �긽�뭹
	@RequestMapping(value = "/single")
	public String single(Model model) throws Exception {

		System.out.println("single Shop Controller");

		List<ProductVo> list = adminService.readAllPDT();
		model.addAttribute("list", list);

		return "shop/single";
	}

	// �긽�뭹 �긽�꽭蹂닿린
	@RequestMapping(value = "/detail/{pdt_num}", method = RequestMethod.GET)
	public String detail(@PathVariable("pdt_num") int pdt_num,Model model) throws Exception {
		// @PathVariable("pdt_num") int pdt_num
		System.out.println("detail Shop Controller");
		ProductVo productVo = productService.readByPdtNum(pdt_num);
		
		model.addAttribute("productVo",productVo);
		
		return "shop/detail";
	}
}
