package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.CartVo;

public interface CartService {

	// ��ٱ��� ����
	public List<CartVo> cartList(String mem_id) throws Exception;
	// ��ٱ��� �ֱ�
	public void cartInsert(CartVo vo) throws Exception;
	// ��ٱ��� ���� ����
	public void cartDelete(int num) throws Exception;
}
