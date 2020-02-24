package com.kh.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.ProductVo;
import com.kh.team2.persistence.AdminDao;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	AdminDao adminDao;

	@Override
	public ProductVo readPDT(int pdt_num) throws Exception {
		return adminDao.readPDT(pdt_num);

	}

	@Override
	public List<ProductVo> readAllPDT() throws Exception {
		return adminDao.readAllPDT();
	}

	@Override
	public void deletePDT(int pdt_num) throws Exception {
		adminDao.deletePDT(pdt_num);
	}

	@Override
	public void updatePDT(ProductVo productVo) throws Exception {
		adminDao.updatePDT(productVo);
	}


	@Override
	public void insertPDT(ProductVo productVo) throws Exception {
		adminDao.insertPDT(productVo);
	}

	@Override
	public List<ProductVo> readTOP3() throws Exception {
		// TODO Auto-generated method stub
		return adminDao.readTOP3();
	}

}
