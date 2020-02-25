package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.RevReplyVo;

public interface RevReplyDao {

	// 댓글 등록
	public void insertReply(RevReplyVo replyVo) throws Exception;
	
	// 댓글 목록
	public List<RevReplyVo> list(int rep_bno) throws Exception;
	
	// 댓글 수정
	public void update(RevReplyVo replyVo) throws Exception;
	
	// 댓글 삭제
	public void delete(int rep_num) throws Exception;
}
