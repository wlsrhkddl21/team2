package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.ProductVo;

public interface AdminService {

	public void insertPDT() throws Exception;

	public void deletePDT() throws Exception;

	public void updatePDT() throws Exception;

	public void readPDT() throws Exception;

	public List<ProductVo> readAllPDT() throws Exception;

}
