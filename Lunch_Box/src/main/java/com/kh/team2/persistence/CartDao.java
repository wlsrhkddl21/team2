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
	// ��ٱ��� ��ü ����
	public void allDelete(String mem_id) throws Exception;
	// ��ٱ��� ���� ����
	public void updataCount(int count,int cart_num) throws Exception;
	// ��ٱ��� üũ
	public int isCart(int pdt_num,String mem_id) throws Exception;
	// ��ٱ��� ���� �� 
	public void countUp(int cart_count,int pdt_num,String mem_id) throws Exception;
	// ��ٱ��ϸ���Ʈ ī��Ʈ
	public int cartCount(String mem_id) throws Exception;
}
