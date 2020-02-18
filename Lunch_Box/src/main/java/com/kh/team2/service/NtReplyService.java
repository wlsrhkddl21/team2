package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.ntReplyVo;

public interface NtReplyService {
	
	// 댓글쓰기
	public void create(ntReplyVo ntreReplyVo) throws Exception;
	// 댓글목록
	public List<ntReplyVo> list(int ntbno) throws Exception;
}
