package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.QnaReplyVo;

public interface QnaReplyService {
	// 댓글쓰기
		public void create(QnaReplyVo qnaReplyVo) throws Exception;
		// 댓글목록
		public List<QnaReplyVo> list(int qrbno) throws Exception;
		// 댓글수정
		public void update(QnaReplyVo qnaReplyVo) throws Exception;
		// 댓글 삭제
		public void delete(int qrnum) throws Exception;
}
