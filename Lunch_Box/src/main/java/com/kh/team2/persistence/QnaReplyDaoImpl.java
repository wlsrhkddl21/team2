package com.kh.team2.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.QnaReplyVo;

@Repository
public class QnaReplyDaoImpl implements QnaReplyDao {

	private static final String NAMESPACE = "com.kh.mappers.qnaReplyMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void create(QnaReplyVo qnaReplyVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", qnaReplyVo);
	}

	@Override
	public List<QnaReplyVo> list(int qrnum) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".list", qrnum);
	}

	@Override
	public void update(QnaReplyVo qnaReplyVo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", qnaReplyVo);
	}

	@Override
	public void delete(int qrnum) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", qrnum);
	}

	@Override
	public void deleteNum(int qna_ref) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteNum", qna_ref);
	}

}
