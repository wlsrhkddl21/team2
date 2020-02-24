package com.kh.team2.controlloer;



import java.text.DecimalFormat;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.team2.domain.CartVo;
import com.kh.team2.service.CartService;

@RestController
@RequestMapping("/cart")
public class CartAjaxController {
	@Inject
	CartService cartService;
	
	
	DecimalFormat df = new DecimalFormat("###,###,###,###");
	
	
	 
	@RequestMapping(value ="/price", method = RequestMethod.POST)
	@ResponseBody
	public String price(@RequestParam("price")int price,@RequestParam("count")int count) throws Exception {
		int total = price * count; 
		String strTotal = df.format(total);
		return strTotal;
	}
	
	@RequestMapping(value ="/buy",method= RequestMethod.POST)
	@ResponseBody
	public void checkBuy(@RequestBody CartVo[] arrCart) {
		System.out.println(arrCart.length);
		for (CartVo vo : arrCart) {
			System.out.println(vo);
		}
	}
	
	@RequestMapping(value = "/updateCount", method = RequestMethod.POST)
	@ResponseBody
	public int updateCount(@RequestBody CartVo vo) throws Exception {
		if (vo.getCart_count() < 1) {
			vo.setCart_count(1);
		}
		cartService.updateCount(vo.getCart_count(), vo.getCart_num());
		return vo.getCart_count();
	}
	
	@RequestMapping(value = "/format" , method = RequestMethod.POST)
	@ResponseBody
	public String formatPrice(@RequestParam("price")int price) throws Exception {
		System.out.println(price);
		String result = df.format(price);
		return result;
	}
} 
