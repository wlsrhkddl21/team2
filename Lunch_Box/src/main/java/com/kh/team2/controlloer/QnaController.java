package com.kh.team2.controlloer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.QnaVo;
import com.kh.team2.service.QnaService;

@Controller
@RequestMapping("/board/")
public class QnaController {
	@Inject
	QnaService qnaService;
	
	@RequestMapping(value ="qna",method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto) throws Exception {
		List<QnaVo> list = qnaService.listAll(pagingDto);
		int totalCount = qnaService.listCount(pagingDto);
		pagingDto.setTotalCount(totalCount);
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "board/qna";
	}

	// QnA 등록페이지로 이동
	@RequestMapping(value="/qnaRegister", method = RequestMethod.GET)
	public String ntRegist(Model model, PagingDto pagingDto) throws Exception {
		model.addAttribute("pagingDto", pagingDto);
		return "board/qnaRegister";
	}
	
	// QnA 등록하기
	@RequestMapping(value= "/qnaRegister", method = RequestMethod.POST)
	public String ntRegisterPOST(QnaVo qnaVo, PagingDto pagingDto) throws Exception {
//		System.out.println(boardVo);
		qnaService.create(qnaVo);
		return "redirect:/board/qna?page=1&perPage=" + pagingDto.getPerPage();
	}
	
	// QnA 답변작성 페이지로 이동
		@RequestMapping(value="/qnaAnswer", method = RequestMethod.GET)
		public String qnaAnswer(Model model, PagingDto pagingDto) throws Exception {
			model.addAttribute("pagingDto", pagingDto);
			return "board/qnaAnswer";
		}
		
	// QnA 답변등록하기
	@RequestMapping(value= "/qnaAnswer", method = RequestMethod.POST)
	public String answerPOST(QnaVo qnaVo, PagingDto pagingDto) throws Exception {
//		System.out.println(boardVo);
		qnaService.answer(qnaVo);
		return "redirect:/board/qna?page=1&perPage=" + pagingDto.getPerPage();
	}
	
	// 글읽기
	@RequestMapping(value="/qnaRead", method = RequestMethod.GET)
	public String read(@RequestParam("qna_num") int qna_num,
			@ModelAttribute PagingDto pagingDto, Model model) throws Exception {
		QnaVo qnaVo = qnaService.read(qna_num);
		model.addAttribute("qnaVo", qnaVo);
		return "board/qnaRead";
	}
//	
//	// 글수정
//	@RequestMapping(value="/qnaUpdate", method = RequestMethod.POST)
//	public String update(BoardVo boardVo, 
//			@ModelAttribute PagingDto pagingDto) throws Exception {
//		boardService.update(boardVo);
//		return "redirect:/board/ntRead?not_num=" + boardVo.getNot_num() + "&page=" 
//				+ pagingDto.getPage() + "&perPage=" + pagingDto.getPerPage();
//	}
//	
//	// 글삭제
//	@RequestMapping(value="/qnaDelete", method = RequestMethod.GET)
//	public String delete(@RequestParam("not_num") int not_num) throws Exception {
//		boardService.delete(not_num);
//		return "redirect:/board/notice";
//	}
	
}
