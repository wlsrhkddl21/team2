package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.QnaVo;

public interface QnaDao {
	
	// 다음 시퀀스 값 얻기
	public int getNextVal() throws Exception;
	// 공지사항 데이터 목록
	public List<QnaVo> listAll(PagingDto pagingDto) throws Exception;
	// 데이터 개수
	public int listCount(PagingDto pagingDto) throws Exception;
	// 데이터 읽기
	public QnaVo read(int qna_num) throws Exception;
	// 데이터 추가
	public void create(QnaVo vo) throws Exception;
	// 답변 데이터 추가
	public void answer(QnaVo vo) throws Exception;
	// 답변추가시 success 변경
	public void updateSuccess(QnaVo vo) throws Exception;
//	// 데이터 삭제
//	public void delete(int not_num)  throws Exception; 
//	// 데이터 수정
//	public void update(BoardVo vo) throws Exception;
//	// 중요공지사항 추가
//	public void hotUpdate(BoardVo vo) throws Exception;
//	// 중요공지사항 삭제
//	public void hotDelete(BoardVo vo) throws Exception;
//	// 조회수 추가
//	public void updateViewCount(int not_num) throws Exception;
}
