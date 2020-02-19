package com.kh.team2.controlloer;



import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.ui.Model;
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
	public Map<String, Object> price(@RequestParam("price")int price,@RequestParam("count")int count) throws Exception {
		int total = price * count; 
		double point = total * 0.05;
		System.out.println(point);
		String strTotal = df.format(total);
		String strPoint = df.format(point);
		System.out.println(strPoint);
		Map<String, Object> map = new HashMap<>();
		map.put("strTotal", strTotal);
		map.put("strPoint", strPoint);
		return map;
	}
	
	@RequestMapping(value = "/totalPrice", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> totalPrice() throws Exception {
		List<CartVo> list = cartService.cartList("jang");
		int totalPrice = 0;
		int tip = 0;
		int result = 0;
		for (CartVo vo : list) {
			result += vo.getPdt_total();
		}
		totalPrice = result;
		if ( totalPrice < 50000) {
			tip = 2500;
			totalPrice = result + tip;
		}
		String strResult = df.format(result);
		String strTotalPrice = df.format(totalPrice);
		String strTip = df.format(tip);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("strResult", strResult);
		map.put("strTotalPrice", strTotalPrice);
		map.put("strTip", strTip);
		return map;
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
} 
