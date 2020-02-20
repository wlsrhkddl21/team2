package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.QnaVo;

public interface QnaService {

	// 공지사항 글목록
	public List<QnaVo> listAll(PagingDto pagingDto) throws Exception;
	// 글갯수
	public int listCount(PagingDto pagingDto) throws Exception;
	// 글 읽기
	public QnaVo read(int qna_num) throws Exception;
	// 글쓰기
	public void create(QnaVo vo) throws Exception;
	// 답변등록
	public void answer(QnaVo vo) throws Exception;
}
