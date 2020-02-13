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
	public void insertPDT() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deletePDT() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void updatePDT() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void readPDT() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ProductVo> readAllPDT() throws Exception {
		
		return adminDao.readAllPDT();
	}

}
