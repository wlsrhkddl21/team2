package com.kh.team2.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.CartVo;

@Repository
public class CartDaoImpl implements CartDao {

	private static final String NAMESPACE = "com.kh.team2.mappers.cartMapper";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<CartVo> cartList(String mem_id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".cartList",mem_id);
	}

	@Override
	public void cartInsert(CartVo vo) throws Exception {
		sqlSession.insert(NAMESPACE+".addCart",vo);
	}

	@Override
	public void cartDelete(int num) throws Exception {
		sqlSession.update(NAMESPACE+".deleteCart",num);
	}

	@Override
	public void allDelete() throws Exception {
		sqlSession.delete(NAMESPACE+".deleteAll");
	}

}
