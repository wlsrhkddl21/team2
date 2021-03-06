package com.kh.team2.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.CertifyVo;

@Repository
public class CertifyDaoImpl implements CertifyDao {
	
	private static final String NAMESPACE = "com.kh.team2.mappers.certifyMapper";

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void certifySetKey(CertifyVo certifyVo) throws Exception {
		sqlSession.insert(NAMESPACE+".setKey",certifyVo);
	}

	@Override
	public int certifyCheck(String certify_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".idCheck",certify_id);
	}

	@Override
	public void certifyKeyUpdate(CertifyVo certifyVo) throws Exception {
		sqlSession.update(NAMESPACE+".keyUpdate",certifyVo);
	}

	@Override
	public int certify(CertifyVo certifyVo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".certify",certifyVo);
	}

	@Override
	public void certifySuccess(String certify_id) throws Exception {
		sqlSession.update(NAMESPACE+".certifySuccess",certify_id);
	}

	@Override
	public String ynCheck(String certify_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".certifyCheck",certify_id);
	}

	@Override
	public void deleteCertify(String certify_id) throws Exception {
		sqlSession.delete(NAMESPACE+".deleteCertify",certify_id);
	}

}
