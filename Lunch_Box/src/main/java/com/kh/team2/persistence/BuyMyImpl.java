package com.kh.team2.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.BuyMyVo;

@Repository
public class BuyMyImpl implements BuyMyDao {

	private static final String NAMESPACE = "com.kh.mappers.buyMyMapper";

	@Inject
	private SqlSession sqlSession;

	@Override
	public int getSeqBuyMyNextVal() {
		return sqlSession.selectOne(NAMESPACE+".getSeqBuyMyNextVal");
	}

	@Override
	public void insertBuyMy(BuyMyVo buyMyVo) {
		sqlSession.insert(NAMESPACE+".insertBuyMy",buyMyVo);
	}

	@Override
	public List<BuyMyVo> selectBuyMyByMemId(String mem_id) {
		return sqlSession.selectList(NAMESPACE+".selectBuyMyByMemId",mem_id);
	}

}
