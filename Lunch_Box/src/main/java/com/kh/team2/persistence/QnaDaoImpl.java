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

	@Override
	public void create(QnaVo vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", vo);
	}

	@Override
	public void answer(QnaVo vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".answer", vo);
	}

	@Override
	public void updateSuccess(QnaVo vo) throws Exception {
		sqlSession.update(NAMESPACE + ".success", vo);
	}

	@Override
	public void delete(int qna_ref) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", qna_ref);
	}

	@Override
	public void update(QnaVo vo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", vo);
	}

}
