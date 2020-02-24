package com.kh.team2.persistence;

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

}
