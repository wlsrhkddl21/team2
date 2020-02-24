package com.kh.team2.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class ProductDaoImpl implements ProductDao {
private static final String NAMESPACE = "com.kh.mappers.productMapper";
	
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public int selectSingleCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectSubCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updatePdtSales(int pdt_num,int pdt_sales) {
		Map<String,Integer> param = new HashMap<String, Integer>();
		
		param.put("pdt_num",pdt_num);
		param.put("pdt_sales",pdt_sales);
		
		sqlSession.update(NAMESPACE+".updatePdtSales",param);
	}

}
