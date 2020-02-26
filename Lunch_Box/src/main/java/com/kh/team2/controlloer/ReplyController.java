package com.kh.team2.controlloer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.team2.domain.QnaReplyVo;
import com.kh.team2.domain.ntReplyVo;
import com.kh.team2.service.NtReplyService;
import com.kh.team2.service.QnaReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Inject
	private NtReplyService ntReplyService;
	@Inject
	private QnaReplyService qnaReplyService;
	
	// 공지사항 댓글
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String register(@RequestBody ntReplyVo ntreplyVo) throws Exception {
		ntReplyService.create(ntreplyVo);
		return "success";
	}
	
	@RequestMapping(value="/all/{ntbno}", method = RequestMethod.GET)
	public List<ntReplyVo> list(@PathVariable("ntbno") int ntbno) throws Exception {
		return ntReplyService.list(ntbno);
	}
	
	@RequestMapping(value="/update", method = RequestMethod.PUT)
	public String update(@RequestBody ntReplyVo ntreplyVo) throws Exception {
		ntReplyService.update(ntreplyVo);
		return "success";
	}
	
	@RequestMapping(value="/delete/{ntrno}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("ntrno") int ntrno) throws Exception {
		ntReplyService.delete(ntrno);
		return "success";
	}
	
	// QNA 댓글
	@RequestMapping(value="/qnaRegister", method = RequestMethod.POST)
	public String register(@RequestBody QnaReplyVo qnaReplyVo) throws Exception {
		qnaReplyService.create(qnaReplyVo);
		return "success";
	}
	
	@RequestMapping(value="/qnaAll/{qrbno}", method = RequestMethod.GET)
	public List<QnaReplyVo> qnaList(@PathVariable("qrbno") int qrbno) throws Exception {
		return qnaReplyService.list(qrbno);
	}
	
	@RequestMapping(value="/qnaUpdate", method = RequestMethod.PUT)
	public String qnaUpdate(@RequestBody QnaReplyVo qnaReplyVo) throws Exception {
		qnaReplyService.update(qnaReplyVo);
		return "success";
	}
	
	@RequestMapping(value="/qnaDelete/{qrnum}", method = RequestMethod.DELETE)
	public String qnaDelete(@PathVariable("qrnum") int qrnum) throws Exception {
		qnaReplyService.delete(qrnum);
		return "success";
	}
	
}
