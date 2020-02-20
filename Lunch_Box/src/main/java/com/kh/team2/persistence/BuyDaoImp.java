package com.kh.team2.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.BuyDetailVo;
import com.kh.team2.domain.BuyVo;
import com.kh.team2.domain.PointVo;

@Repository
public class BuyDaoImp implements BuyDao {

	private static final String NAMESPACE = "com.kh.mappers.buyMapper";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void insertBuy(BuyVo vo) throws Exception {
		sqlSession.insert(NAMESPACE+".insertBuy",vo);
	}

	@Override
	public void insertBuyDetail(BuyDetailVo vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE+".insertBuyDetail",vo);
	}

	@Override
	public int getSeqBuyNextVal() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getSeqBuyNextVal");
	}

}
