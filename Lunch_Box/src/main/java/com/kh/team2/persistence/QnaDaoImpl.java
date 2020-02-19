package com.kh.team2.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	private static final String NAMESPACE = "com.kh.mappers.qnaMapper";
	
	private SqlSession sqlSession;
	
	@Override
	public int getNextVal() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getNextVal");
	}

	@Override
	public List<BoardVo> listAll(PagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", pagingDto);
	}

	@Override
	public int listCount(PagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + ".listCount", pagingDto);
		return count;
	}


}
