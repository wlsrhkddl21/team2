package com.kh.team2.controlloer;

import java.text.DecimalFormat;
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
	public String view(Model model,CartVo vo) throws Exception {
		List<CartVo> list = cartService.cartList("jang");
		boolean isEmpty = false;
		int totalPrice = 0;
		int tip = 0;
		int result = 0;
		DecimalFormat tp = new DecimalFormat("###,###,###,###");
		if (list.isEmpty()) {
			isEmpty = true;
			System.out.println("비어있음");
		}
		for (int i = 0; i < list.size() ; i++ ) {
			result += list.get(i).getPdt_total();
		}
		totalPrice = result;
		if ( totalPrice < 50000) {
			tip = 2500;
			totalPrice = result - tip;
		}
		String strResult = tp.format(result);
		String strTotalPrice = tp.format(totalPrice);
		String strTip = tp.format(tip);
		model.addAttribute("tip",strTip);
		model.addAttribute("result",strResult);
		model.addAttribute("total",strTotalPrice);
		model.addAttribute("list",list);
		model.addAttribute("isEmpty",isEmpty);
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
	
	@RequestMapping(value = "/oneDelete/{cart_num}", method = RequestMethod.GET)
	public String oneDelete(@PathVariable("cart_num") int cart_num) throws Exception {
		cartService.cartDelete(cart_num);
		return "redirect:/cart/list";
	}
	
	@RequestMapping(value = "/delete",method = RequestMethod.POST)
	@ResponseBody
	public String delete(@RequestParam("checkArr") List<String> checkArr) throws Exception {
		for (int i = 0; i < checkArr.size() ; i++) {
			System.out.println(checkArr.get(i));
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


