package com.kh.team2.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.ntReplyVo;

@Repository
public class ntReplyDaoImpl implements ntReplyDao {

	private static final String NAMESPACE = "com.kh.mappers.ntReplyMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void create(ntReplyVo ntreplyVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", ntreplyVo);
	}

	@Override
	public List<ntReplyVo> list(int ntbno) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".list", ntbno);
	}

	@Override
	public void update(ntReplyVo ntreplyVo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", ntreplyVo);
	}

	@Override
	public void delete(int ntrno) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", ntrno);
	}

	@Override
	public void deleteNum(int not_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteNum", not_num);
	}

}
