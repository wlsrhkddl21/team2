package com.kh.team2.persistence;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.BuyDetailVo;
import com.kh.team2.domain.BuyJoinDto;
import com.kh.team2.domain.BuyVo;

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
		sqlSession.insert(NAMESPACE+".insertBuyDetail",vo);
	}

	@Override
	public int getSeqBuyNextVal() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getSeqBuyNextVal");
	}

	@Override
	public List<BuyJoinDto> selectJoinByMemId(String mem_id) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".selectJoinByMemId",mem_id);
	}

	@Override
	public List<BuyJoinDto> selectReadAll() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".selectReadAll");
	}

}
