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
}
