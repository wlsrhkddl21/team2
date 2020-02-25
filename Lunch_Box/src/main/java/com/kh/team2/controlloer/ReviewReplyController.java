package com.kh.team2.controlloer;

import java.util.List;

//import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.team2.domain.RevReplyVo;
import com.kh.team2.service.RevReplyService;

@RestController
@RequestMapping("/reviewReply")
public class ReviewReplyController {

	@Inject
	private RevReplyService replyService;
	
	@RequestMapping(value="/insertReply", method = RequestMethod.POST)
	public String insertReply(@RequestBody RevReplyVo replyVo) throws Exception {
		replyService.insertReply(replyVo);
		return "success";
	}
	
	@RequestMapping(value="/list/{rep_bno}", method = RequestMethod.GET)
	public List<RevReplyVo> list(@PathVariable("rep_bno") int rep_bno) throws Exception {
		return replyService.list(rep_bno);
	}
	
	@RequestMapping(value="/update", method = RequestMethod.PUT)
	public String update(@RequestBody RevReplyVo replyVo) throws Exception {
		replyService.update(replyVo);
		return "success";
	}
	
	@RequestMapping(value="/delete/{rep_num}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("rep_num") int rep_num) throws Exception {
		replyService.delete(rep_num);
		return "success";
	}
	
	
}
