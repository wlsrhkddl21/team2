package com.kh.team2.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.domain.ReviewVo;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	public static final String NAMESPACE = "com.kh.mappers.reviewMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public ReviewVo readReview(int rev_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".readReview", rev_num);
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

	@Override
	public void insertReview(ReviewVo reviewVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertReview", reviewVo);
		
	}

	@Override
	public List<ProductVo> productName() throws Exception {
		List<ProductVo> list = sqlSession.selectList(NAMESPACE+".productName");
		return list;
	}

	@Override
	public List<ReviewVo> reviewList(PagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".reviewList", pagingDto);
	}

	@Override
	public void viewCount(int rev_num) throws Exception {
		sqlSession.update(NAMESPACE + ".viewCount", rev_num);
		
	}

	@Override
	public void reviewDelete(int rev_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".reviewDelete", rev_num);
		
	}

	@Override
	public List<ReviewVo> readPdtNum(int rev_pdt_name) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".readPdtNum", rev_pdt_name);
	}

	@Override
	public int getRev_num() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".getRev_num");
	}
	
	
}
