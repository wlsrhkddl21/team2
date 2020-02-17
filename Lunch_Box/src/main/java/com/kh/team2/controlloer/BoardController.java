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
import com.kh.team2.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Inject
	BoardService boardService;
	
	@RequestMapping(value ="notice",method = RequestMethod.GET)
	public String list(Model model, PagingDto pagingDto) throws Exception {
		List<BoardVo> list = boardService.listAll(pagingDto);
		List<BoardVo> hotList = boardService.hotList(pagingDto);
		int totalCount = boardService.listCount(pagingDto);
		pagingDto.setTotalCount(totalCount);
		model.addAttribute("list", list);
		model.addAttribute("hotList", hotList);
		model.addAttribute("pagingDto", pagingDto);
		return "board/notice";
	}

	// 湲��벑濡앺뤌 -> /board/register -> GET 諛⑹떇 �슂泥� 泥섎━
	@RequestMapping(value="/ntRegister", method = RequestMethod.GET)
	public String ntRegist(Model model, PagingDto pagingDto) throws Exception {
		model.addAttribute("pagingDto", pagingDto);
		return "board/ntRegister";
	}
	
	// 湲��벑濡� -> POST
	@RequestMapping(value= "/ntRegister", method = RequestMethod.POST)
	public String ntRegisterPOST(BoardVo boardVo, PagingDto pagingDto) throws Exception {
//		System.out.println(boardVo);
		boardService.create(boardVo);
		return "redirect:/board/notice?page=1&perPage=" + pagingDto.getPerPage();
	}
	
	// 湲��씫湲�
	@RequestMapping(value="/ntRead", method = RequestMethod.GET)
	public String read(@RequestParam("not_num") int not_num,
			@ModelAttribute PagingDto pagingDto, Model model) throws Exception {
		BoardVo boardVo = boardService.read(not_num);
		model.addAttribute("boardVo", boardVo);
		return "board/ntRead";
	}
	
	// 湲��닔�젙
	@RequestMapping(value="/ntUpdate", method = RequestMethod.POST)
	public String update(BoardVo boardVo, 
			@ModelAttribute PagingDto pagingDto) throws Exception {
		boardService.update(boardVo);
		return "redirect:/board/ntRead?not_num=" + boardVo.getNot_num() + "&page=" 
				+ pagingDto.getPage() + "&perPage=" + pagingDto.getPerPage();
	}
	
	@RequestMapping(value="/ntDelete", method = RequestMethod.GET)
	public String delete(@RequestParam("not_num") int not_num) throws Exception {
		boardService.delete(not_num);
		return "redirect:/board/notice";
	}
	// 以묒슂怨듭��벑濡�
	@RequestMapping(value="/hotUpdate", method = RequestMethod.POST)
	public String hotUpdate(BoardVo boardVo, 
			@ModelAttribute PagingDto pagingDto) throws Exception {
		boardService.hotUpdate(boardVo);
		return "redirect:/board/ntRead?not_num=" + boardVo.getNot_num() + "&page=" 
				+ pagingDto.getPage() + "&perPage=" + pagingDto.getPerPage();
	}
	
	// 以묒슂怨듭�以묒�
	@RequestMapping(value="/hotDelete", method = RequestMethod.POST)
	public String hotDelete(BoardVo boardVo, 
			@ModelAttribute PagingDto pagingDto) throws Exception {
		boardService.hotDelete(boardVo);
		return "redirect:/board/ntRead?not_num=" + boardVo.getNot_num() + "&page=" 
		+ pagingDto.getPage() + "&perPage=" + pagingDto.getPerPage();
	}
	
	// 리뷰 게시판
	@RequestMapping(value="/reviewBoard", method = RequestMethod.GET)
	public String reviewBoard() throws Exception {
		
		return "board/reviewBoard";
	}
	
}
