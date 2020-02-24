package com.kh.team2.persistence;

import com.kh.team2.domain.RevReplyVo;

public interface RevReplyDao {

	// 댓글 등록
	public void insertReply(RevReplyVo replyVo) throws Exception;
}
