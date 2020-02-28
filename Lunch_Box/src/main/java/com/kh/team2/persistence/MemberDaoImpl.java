package com.kh.team2.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	public static final String NAMESPACE = "com.kh.team2.mappers.memberMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVo memberVo) {
		sqlSession.insert(NAMESPACE + ".insertMember", memberVo);

	}

	@Override
	public MemberVo readMember(String mem_id) {
		return sqlSession.selectOne(NAMESPACE +".readMember", mem_id);
	}

	@Override
	public MemberVo readWithPw(String mem_id, String mem_pass) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mem_id", mem_id);
		paramMap.put("mem_pass", mem_pass);
		return sqlSession.selectOne(NAMESPACE + ".readWithPw", paramMap);
	}


	@Override
	public int idCheck(String mem_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".idCheck", mem_id);
	}

	@Override
	public void memUpdate(MemberVo memVo) throws Exception {
		sqlSession.update(NAMESPACE+".memUpdate",memVo);
		
	}

}
