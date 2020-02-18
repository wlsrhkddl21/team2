package com.kh.team2.controlloer;



import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.team2.domain.CartVo;
import com.kh.team2.service.CartService;

@RestController
@RequestMapping("/cart")
public class CartAjaxController {
	
	@Inject
	CartService cartService;
	
	
	@RequestMapping(value ="/updateCount", method = RequestMethod.PUT)
	public String updateCount(@RequestBody CartVo cartVo) throws Exception {
		if (cartVo.getCart_count() < 1 ) {
			cartVo.setCart_count(1);
		}
		cartService.updateCount(cartVo.getCart_count(), cartVo.getCart_num()); 
		return "success";
	}
	
	@RequestMapping(value ="/buy",method= RequestMethod.POST)
	@ResponseBody
	public void checkBuy(@RequestBody CartVo[] arrCart) {
		System.out.println(arrCart.length);
		for (CartVo vo : arrCart) {
			System.out.println(vo);
		}
		
	}
} 
