package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.ProductVo;

public interface AdminDao {
	public void insertPDT() throws Exception;
	public void deletePDT() throws Exception;
	public void updatePDT() throws Exception;
	public void readPDT() throws Exception;
	public List<ProductVo> readAllPDT() throws Exception;
}
