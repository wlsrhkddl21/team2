package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.QnaReplyVo;

public interface QnaReplyDao {
		
	// 댓글 등록
		public void create(QnaReplyVo qnaReplyVo) throws Exception;
		// 댓글 목록
		public List<QnaReplyVo> list(int qrnum) throws Exception;
		// 댓글 수정
		public void update(QnaReplyVo qnaReplyVo) throws Exception;
		// 댓글 삭제
		public void delete(int qrnum) throws Exception;
		// 본글삭제시 댓글삭제
		public void deleteNum(int qna_ref) throws Exception;
}
