package com.kh.team2.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.FaqVo;
import com.kh.team2.domain.PagingDto;

@Repository
public class FaqDaoImpl implements FaqDao {
	
	private static final String NAMESPACE = "com.kh.mappers.faqMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int getNextVal() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getNextVal");
	}

	@Override
	public List<FaqVo> listAll(PagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", pagingDto);
	}

	@Override
	public int listCount(PagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + ".listCount", pagingDto);
		return count;
	}

	@Override
	public void create(FaqVo vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", vo);
	}

	@Override
	public FaqVo read(int faq_num) throws Exception {
		FaqVo vo = sqlSession.selectOne(NAMESPACE + ".read", faq_num);
		return vo;
	}

	@Override
	public void delete(int faq_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", faq_num);
	}

	@Override
	public void update(FaqVo faqVo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", faqVo);
	}

}
