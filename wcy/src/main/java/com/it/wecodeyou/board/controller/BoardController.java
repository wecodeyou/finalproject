package com.it.wecodeyou.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.board.model.BoardVO;
import com.it.wecodeyou.board.service.IArticleService;
import com.it.wecodeyou.board.service.IBoardService;
import com.it.wecodeyou.member.service.IMemberService;

@RestController
@RequestMapping(value="/board")
public class BoardController {
	private ModelAndView mv = new ModelAndView();
	
	@Autowired
	private IBoardService boardService;
	
	@Autowired
	private IArticleService articleService;
	
	@Autowired
	private IMemberService memberService;
	
	@GetMapping("/list")
	public ModelAndView selectBoard() {
		mv.addObject("boardList", boardService.list());
		mv.setViewName("board/boardList");
		return mv;
	}
	
	@GetMapping("/register")
	public ModelAndView registerBoard() {
		mv.setViewName("board/boardRegister");
		return mv;
	}
	@PostMapping("/register")
	public ModelAndView registerBoard(BoardVO bvo, Model model) {
		boardService.insert(bvo);
		
		return mv;
	}
	
	@GetMapping("/{boardNo}")
	public ModelAndView board(ModelAndView mv, @PathVariable Integer boardNo) {
		BoardVO bvo = boardService.getInfoByNo(boardNo);
		System.out.println("Get /board/{boardTitle} Board Info: \r\n" 
						+ bvo.toString());
		List<ArticleVO> avo = articleService.list(boardNo);
		mv.addObject("board", bvo);
		mv.addObject("articleList", avo);
		mv.setViewName("/board/ArticleList");
		return mv;
	}
	
	@GetMapping("/{boardNo}/register")
	public ModelAndView registerArticle(ModelAndView mv, @PathVariable Integer boardNo) {
		mv.addObject("boardNo", boardNo);
		mv.setViewName("/board/articleForm");
		return mv;
	}

	@PostMapping("/{boardNo}/register")
	public String registerArticle(@PathVariable Integer boardNo, @RequestBody ArticleVO avo) {
		avo.setArticleBoardNo(boardNo);
		if(articleService.insert(avo) == 1) {
			return "register-success";
		} else {
			return "register-fail";			
		}
	}
	
	@GetMapping("/article/{articleNo}")
	public ModelAndView articleDetail(@PathVariable Integer articleNo, ModelAndView mv) {
		
		ArticleVO avo = articleService.getOneInfo(articleNo);
		Board
		mv.setViewName("/board/articleDetail");
		return mv;
	}
}
