package com.kh.team2.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.RevReplyVo;

@Repository
public class RevReplyDaoImpl implements RevReplyDao {
	
	public static final String NAMESPACE = "com.kh.mappers.revReplyMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertReply(RevReplyVo replyVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertReply", replyVo);
	}

	@Override
	public List<RevReplyVo> list(int rep_bno) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".list", rep_bno);
	}

	@Override
	public void update(RevReplyVo replyVo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", replyVo);
		
	}

	@Override
	public void delete(int rep_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", rep_num);
		
	}

}
