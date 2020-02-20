package com.kh.team2.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.PointVo;

@Repository
public class PointDaoImpl implements PointDao {
	
	private static final String NAMESPACE = "com.kh.mappers.pointMapper";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void updatePoint(int point, String mem_id)throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("point",point);
		paramMap.put("mem_id",mem_id);
		sqlSession.update(NAMESPACE+".updateMemPoint",paramMap);
	}

	@Override
	public void insertPoint(PointVo vo) throws Exception {
		sqlSession.insert(NAMESPACE+".insertPoint",vo);
	}

}
