package com.kh.team2.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.team2.domain.ProductVo;

@Repository
public class ProductDaoImpl implements ProductDao {
	private static final String NAMESPACE = "com.kh.mappers.productMapper";

	@Inject
	private SqlSession sqlSession;

	@Override
	public ProductVo readPDT(int pdt_num) throws Exception {
		ProductVo vo = sqlSession.selectOne(NAMESPACE +".readPDT",pdt_num);
		return vo;
	}

}
