package com.kh.team2.controlloer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.team2.domain.ntReplyVo;
import com.kh.team2.service.NtReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Inject
	private NtReplyService ntReplyService;
	
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
	
	
}
