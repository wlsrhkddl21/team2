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
	public ProductVo readPDT(int pdt_num) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".readPDT",pdt_num);
	}

	@Override
	public List<ProductVo> readAllPDT() throws Exception {
		return sqlSession.selectList(NAMESPACE+".readAllPDT");

	}

	@Override
	public void insertPDT(ProductVo productVo) throws Exception {
		sqlSession.insert(NAMESPACE+".insertPDT",productVo);
		
	}

	@Override
	public void deletePDT(int pdt_num) throws Exception {
		sqlSession.delete(NAMESPACE+".deletePDT",pdt_num);
		
	}

	@Override
	public void updatePDT(ProductVo productVo) throws Exception {
		sqlSession.update(NAMESPACE+".updatePDT",productVo);
		
	}

	

}
