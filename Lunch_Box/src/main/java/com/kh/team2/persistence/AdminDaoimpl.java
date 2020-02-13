package com.kh.team2.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.ProductVo;

@Repository
public class AdminDaoimpl implements AdminDao {
	private static final String NAMESPACE ="com.kh.mappers.productMapper";
	
	@Inject
	SqlSession sqlSession;
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
		return sqlSession.selectList(NAMESPACE+".readAllPDT");

	}

}
