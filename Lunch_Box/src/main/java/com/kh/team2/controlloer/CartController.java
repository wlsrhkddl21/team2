package com.kh.team2.controlloer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team2.domain.CartVo;
import com.kh.team2.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Inject
	CartService cartService;
	
	
	@RequestMapping(value = "/list" , method = RequestMethod.GET)
	public String view(Model model) throws Exception {
		List<CartVo> list = cartService.cartList("jang");
		boolean isEmpty = false;
		if (list.isEmpty()) {
			isEmpty = true;
		}
		model.addAttribute("list",list);
		model.addAttribute("isEmpty",isEmpty);
		return "cart/cartList"; 
		
	}
	
	@RequestMapping(value = "/insert/{pdt_num}/{count}", method = RequestMethod.GET)
	public String inset(@PathVariable("pdt_num") int pdt_num,
						@PathVariable("count") int count) throws Exception {
		CartVo vo = new CartVo();
		int isCart = cartService.isCart(pdt_num);
		if (isCart > 0) {
			cartService.countUp(count, pdt_num);
		} else {
			vo.setMem_id("jang");
			vo.setPdt_num(pdt_num);
			vo.setCart_count(count);
			cartService.cartInsert(vo);
		}
		return "redirect:/cart/list";
	}
	
	@RequestMapping(value = "/oneDelete/{cart_num}", method = RequestMethod.GET)
	public String oneDelete(@PathVariable("cart_num") int cart_num) throws Exception {
		cartService.cartDelete(cart_num);
		return "redirect:/cart/list";
	}
	
	@RequestMapping(value = "/delete",method = RequestMethod.POST)
	@ResponseBody
	public String delete(@RequestParam("checkArr") List<String> checkArr) throws Exception {
		for (int i = 0; i < checkArr.size() ; i++) {
			cartService.cartDelete(Integer.parseInt(checkArr.get(i)));
		}
		return "success";
	}
	@RequestMapping(value = "/deleteAll",method = RequestMethod.GET)
	public String deleteAll() throws Exception {
		cartService.allDelete();
		return "redirect:/cart/list";
	}
	
	
	
}


