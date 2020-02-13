package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.ProductVo;

public interface AdminService {

	public void insertPDT(ProductVo productVo) throws Exception;
	public void deletePDT(int pdt_num) throws Exception;
	public void updatePDT(ProductVo productVo) throws Exception;
	public ProductVo readPDT(int pdt_num) throws Exception;
	public List<ProductVo> readAllPDT() throws Exception;

}
