package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.ntReplyVo;

public interface NtReplyService {
	
	// 댓글쓰기
	public void create(ntReplyVo ntreReplyVo) throws Exception;
	// 댓글목록
	public List<ntReplyVo> list(int ntbno) throws Exception;
	// 댓글수정
	public void update(ntReplyVo ntreplyVo) throws Exception;
	// 댓글 삭제
	public void delete(int ntrno) throws Exception;
}
