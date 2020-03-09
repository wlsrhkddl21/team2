package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.CartVo;

public interface CartDao {
	// 상품 보기
	public List<CartVo> cartList(String mem_id) throws Exception;
	// 장바구니에 추가
	public void cartInsert(CartVo vo) throws Exception;
	// 장바구니 선택 삭제
	public void cartDelete(int num) throws Exception;
	// 장바구니 전체 삭제
	public void allDelete(String mem_id) throws Exception;
	// 장바구니 수량 변경
	public void updataCount(int count,int cart_num) throws Exception;
	// 장바구니 체크
	public int isCart(int pdt_num,String mem_id) throws Exception;
	// 장바구니 수량 합 
	public void countUp(int cart_count,int pdt_num,String mem_id) throws Exception;
	// 장바구니리스트 카운트
	public int cartCount(String mem_id) throws Exception;
}
