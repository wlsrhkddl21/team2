package com.kh.team2.controlloer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team2.domain.CartVo;
import com.kh.team2.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Inject
	CartService cartService;
	
	// ��ٱ��� ����Ʈ ����
	@RequestMapping(value = "/list" , method = RequestMethod.GET)
	public String view(Model model,CartVo vo) throws Exception {
		System.out.println("��ٱ��� ����Ʈ");
		List<CartVo> list = cartService.cartList("jang");
		model.addAttribute("list",list);
		return "cart/cartList"; 
		
	}
	
	@RequestMapping(value = "/insert/{num}/{count}", method = RequestMethod.GET)
	public String inset(@PathVariable("num") int num,
						@PathVariable("count") int count,CartVo vo) throws Exception {
		vo.setPdt_num(num);
		vo.setCart_count(count);
		vo.setMem_id("jang");
		System.out.println(vo);
		cartService.cartInsert(vo);
		return "redirect:/cart/list";
	}
	@RequestMapping(value = "/delete/{num}")
	public String delete(@PathVariable("num") int num) throws Exception {
		cartService.cartDelete(num);
		return "redirect:/cart/list";
	}
}
