package com.kh.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.CartVo;
import com.kh.team2.persistence.CartDao;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	private CartDao cartDao;
	
	@Override
	public List<CartVo> cartList(String mem_id) throws Exception {
		 return cartDao.cartList(mem_id);
		
	}

	@Override
	public void cartInsert(CartVo vo) throws Exception {
		cartDao.cartInsert(vo);
	}

	@Override
	public void cartDelete(int num) throws Exception {
		cartDao.cartDelete(num);
	}

	@Override
	public void allDelete() throws Exception {
		cartDao.allDelete();
	}

	@Override
	public void updateCount(int count, int cart_num) throws Exception {
		cartDao.updataCount(count, cart_num);
	}

	@Override
	public int isCart(int pdt_num,String mem_id) throws Exception {
		return cartDao.isCart(pdt_num,mem_id);
	}

	@Override
	public void countUp(int cart_count, int pdt_num) throws Exception {
		cartDao.countUp(cart_count, pdt_num);
	}

}
