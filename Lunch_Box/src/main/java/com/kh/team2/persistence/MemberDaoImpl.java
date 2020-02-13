package com.kh.team2.persistence;

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

}
