package com.kh.team2.persistence;


import com.kh.team2.domain.ProductVo;

public interface ProductDao {
	public ProductVo readByPdtNum(int pdt_num) throws Exception;
}
