package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.CartVo;

public interface CartService {

	// 장바구니 보기
	public List<CartVo> cartList(String mem_id) throws Exception;
	// 장바구니 넣기
	public void cartInsert(CartVo vo) throws Exception;
	// 장바구니 선택 삭제
	public void cartDelete(int num) throws Exception;
	// 장바구니 전체 삭제
	public void allDelete(String mem_id) throws Exception;
	// 장바구니 수량 수정
	public void updateCount(int count,int cart_num) throws Exception;
	// 장바구니 체크
	public int isCart(int pdt_num,String mem_id) throws Exception;
	// 장바구니 중복 합
	public void countUp(int cart_count,int pdt_num,String mem_id) throws Exception;
	// 장바구니리스트 갯수
	public int cartCount(String mem_id) throws Exception;
}
