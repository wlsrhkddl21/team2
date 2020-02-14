package com.kh.team2.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.ProductVo;
import com.kh.team2.persistence.ProductDao;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDao productDao;
	
	@Override
	public ProductVo readByPdtNum(int pdt_num) throws Exception {
		return productDao.readPDT(pdt_num);
	}

}
