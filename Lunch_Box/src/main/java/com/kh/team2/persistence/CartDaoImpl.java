package com.kh.team2.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public void updataCount(int count, int cart_num) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("count", count);
		paramMap.put("cart_num", cart_num);
		sqlSession.update(NAMESPACE+".updateCount",paramMap);
	}

}
