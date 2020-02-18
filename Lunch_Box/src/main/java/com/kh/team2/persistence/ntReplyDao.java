package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.ntReplyVo;

public interface ntReplyDao {
	
	// 댓글 등록
	public void create(ntReplyVo ntreplyVo) throws Exception;
	// 댓글 목록
	public List<ntReplyVo> list(int ntbno) throws Exception;
}
