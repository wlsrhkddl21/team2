package com.kh.team2.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.MyLunchVo;

@Repository
public class MyLunchDaoImpl implements MyLunchDao {
	
	private static final String NAMESPCE="com.kh.mappers.myLunchMapper";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertMLB(MyLunchVo myLunchVo) throws Exception {
		sqlSession.insert(NAMESPCE+".insertMLB",myLunchVo);
		
	}

	@Override
	public void updateMLB(MyLunchVo myLunchVo) throws Exception {
		sqlSession.update(NAMESPCE+".updateMLB",myLunchVo);
		
	}

	@Override
	public MyLunchVo readMLB(int lunch_num) throws Exception {
		return sqlSession.selectOne(NAMESPCE+".readMLB"+lunch_num);
	}

	@Override
	public List<MyLunchVo> readAllMLB() throws Exception {
		
		return sqlSession.selectList(NAMESPCE+".readAllMLB");
	}

	@Override
	public void deleteMLB(int lunch_num) throws Exception {
		sqlSession.delete(NAMESPCE+".deleteMLB");
		
	}

}
