package com.kh.team2.persistence;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;


@Repository
public class BoardDaoImpl implements BoardDao {
	
	private static final String NAMESPACE = "com.kh.mappers.boardMapper";

	@Inject
	private SqlSession sqlSession;

	
	@Override
	public int listCount(PagingDto pagingDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + ".listCount", pagingDto);
		return count;
	}


	@Override
	public List<BoardVo> listAll(PagingDto pagingDto) throws Exception {
		 
		return sqlSession.selectList(NAMESPACE + ".listAll", pagingDto);
	}


	@Override
	public void create(BoardVo vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", vo);
	}


	@Override
	public int getNextVal() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getNextVal");
	}


	@Override
	public BoardVo read(int not_num) throws Exception {
		BoardVo vo = sqlSession.selectOne(NAMESPACE + ".read", not_num); 
		return vo;
	}


	@Override
	public void delete(int not_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", not_num);
	}


	@Override
	public void update(BoardVo vo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", vo);
	}

}
