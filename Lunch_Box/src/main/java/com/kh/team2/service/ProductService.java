package com.kh.team2.service;


import com.kh.team2.domain.ProductVo;

public interface ProductService {
	public ProductVo readByPdtNum(int pdt_num) throws Exception;
}
