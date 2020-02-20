package com.kh.team2.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.QnaVo;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	private static final String NAMESPACE = "com.kh.mappers.qnaMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int getNextVal() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getNextVal");
	}

	@Override
	public List<QnaVo> listAll(PagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", pagingDto);
	}

	@Override
	public int listCount(PagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + ".listCount", pagingDto);
		return count;
	}

	@Override
	public QnaVo read(int qna_num) throws Exception {
		QnaVo vo = sqlSession.selectOne(NAMESPACE + ".read", qna_num);
		return vo;
	}


}
