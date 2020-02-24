package com.kh.team2.service;

import com.kh.team2.domain.RevReplyVo;

public interface RevReplyService {
	
	// 댓글쓰기
	public void insertReply(RevReplyVo replyVo) throws Exception;
}
