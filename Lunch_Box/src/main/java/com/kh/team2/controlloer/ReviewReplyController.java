package com.kh.team2.controlloer;

//import java.util.List;

import javax.inject.Inject;

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
	
//	@RequestMapping(value="/all/{ntbno}", method = RequestMethod.GET)
//	public List<ntReplyVo> list(@PathVariable("ntbno") int ntbno) throws Exception {
//		return ntReplyService.list(ntbno);
//	}
//	
//	@RequestMapping(value="/update", method = RequestMethod.PUT)
//	public String update(@RequestBody ntReplyVo ntreplyVo) throws Exception {
//		ntReplyService.update(ntreplyVo);
//		return "success";
//	}
	
	
}
