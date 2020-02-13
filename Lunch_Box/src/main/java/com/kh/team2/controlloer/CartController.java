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
	
	@RequestMapping(value = "/list" , method = RequestMethod.GET)
	public String view(Model model,CartVo vo) throws Exception {
		System.out.println("장바구니 리스트");
		List<CartVo> list = cartService.cartList("jang");
		model.addAttribute("list",list);
		return "cart/cartList"; 
		
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String inset(CartVo vo) throws Exception {
		cartService.cartInsert(vo);
		return "redirect:/cart/list";
	}
	@RequestMapping(value = "/delete/{num}")
	public String delete(@PathVariable("num") int num) throws Exception {
		cartService.cartDelete(num);
		return "redirect:/cart/list";
	}
}
