package com.kh.team2.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.ReviewVo;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	public static final String NAMESPACE = "com.kh.team2.mappers.reviewMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public ReviewVo selectList(int rev_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".selectList", rev_num);
	}

	@Override
	public List<ReviewVo> listAll(PagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", pagingDto);
	}

	@Override
	public int listCount(PagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE +".listCount", pagingDto);
		return count;
	}

}
