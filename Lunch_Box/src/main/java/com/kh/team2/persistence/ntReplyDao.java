package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.ntReplyVo;

public interface ntReplyDao {
	
	// 댓글 등록
	public void create(ntReplyVo ntreplyVo) throws Exception;
	// 댓글 목록
	public List<ntReplyVo> list(int ntbno) throws Exception;
	// 댓글 수정
	public void update(ntReplyVo ntreplyVo) throws Exception;
	// 댓글 삭제
	public void delete(int ntrno) throws Exception;
	// 본글삭제시 댓글삭제
	public void deleteNum(int not_num) throws Exception;
	
}
