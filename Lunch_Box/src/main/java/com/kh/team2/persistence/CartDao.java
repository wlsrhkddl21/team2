package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.CartVo;

public interface CartDao {
	// ��ǰ ����
	public List<CartVo> cartList(String mem_id) throws Exception;
	// ��ٱ��Ͽ� �߰�
	public void cartInsert(CartVo vo) throws Exception;
	// ��ٱ��� ���� ����
	public void cartDelete(int num) throws Exception;
}