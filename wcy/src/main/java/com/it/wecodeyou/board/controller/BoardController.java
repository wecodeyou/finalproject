package com.it.wecodeyou.board.controller;

import java.sql.SQLException;
import java.util.ArrayList;
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

import com.it.wecodeyou.board.model.ArticleTagVO;
import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.board.model.BoardVO;
import com.it.wecodeyou.board.model.ReplyUserVO;
import com.it.wecodeyou.board.model.ReplyVO;
import com.it.wecodeyou.board.service.IArticleService;
import com.it.wecodeyou.board.service.IBoardService;
import com.it.wecodeyou.board.service.IReplyService;
import com.it.wecodeyou.commons.PageCreator;
import com.it.wecodeyou.commons.PageVO;
import com.it.wecodeyou.member.model.MemberVO;
import com.it.wecodeyou.member.service.IMemberService;

@RestController
@RequestMapping(value="/board")
public class BoardController {

	@Autowired
	private IMemberService memberService;
	@Autowired
	private IBoardService boardService;
	@Autowired
	private IArticleService articleService;
	@Autowired
	private IReplyService replyService;	

	
	@GetMapping("/list")
	public ModelAndView selectBoard(ModelAndView mv) {
		mv.addObject("boardList", boardService.list());
		mv.setViewName("board/boardList");
		return mv;
	}
	@GetMapping("/register")
	public ModelAndView registerBoard(ModelAndView mv) {
		mv.setViewName("board/boardRegister");
		return mv;
	}
	@PostMapping("/register")
	public ModelAndView registerBoard(BoardVO bvo, Model model,  ModelAndView mv) {
		if(boardService.insert(bvo) == 1) {
			mv.setViewName("/board/boardList");
		} else {
			mv.addObject("message", "Board Register Failed");
			mv.setViewName("/board/boardRegister");
		}
		return mv;
	}
	
	@GetMapping("/{boardNo}")
	public ModelAndView board(ModelAndView mv, @PathVariable Integer boardNo, PageVO paging) {
		BoardVO bvo = boardService.getInfoByNo(boardNo);
		System.out.println("Get /board/{boardTitle} Board Info: \r\n" 
						+ bvo.toString());
		paging.setBoardNo(boardNo);
		List<ArticleVO> list = articleService.list(paging);
		for(ArticleVO avo: list) {
			System.out.println(avo.toString());
		}
		PageCreator pc = new PageCreator();
		pc.setPaging(paging);
		pc.setArticleTotalCount(articleService.countArticles(boardNo));
		System.out.println(pc.toString());
		mv.addObject("board", bvo);
		mv.addObject("articleList", list);
		mv.addObject("pc", pc);
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
	public String registerArticle(@PathVariable Integer boardNo, ArticleTagVO atvo) {
		System.out.println(atvo.toString());
		ArticleVO avo = new ArticleVO();
		avo.setArticleTitle(atvo.getArticleTitle());
		avo.setArticleContent(atvo.getArticleContent());
		avo.setArticleWriter(atvo.getArticleWriter());
		avo.setArticleBoardNo(boardNo);
		
		//tag number list
        ArrayList<Integer> sendTagList = atvo.getSendTagList();
        
		if(articleService.insert(avo, sendTagList) == 1) {
			return "register-success";
		} else {
			return "register-fail";			
		}
	}
	
	@GetMapping("/article/{articleNo}")
	public ModelAndView articleDetail(@PathVariable Integer articleNo, ModelAndView mv) {
		
		ArticleVO avo = articleService.getOneInfo(articleNo);
		BoardVO bvo = boardService.getInfoByNo(avo.getArticleBoardNo());
		MemberVO uvo = null;
		List<ReplyUserVO> replyList = replyService.listByArticle(articleNo);
		try {
			uvo = memberService.getOneInfo(avo.getArticleWriter());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("GET /article/{articleNo} - \r\n Article : " + avo.toString());
		System.out.println( "User : " + uvo.toString());
		System.out.println("Board : " + bvo.toString());
		System.out.println("Total Replies : " + replyList.size());
		mv.addObject("user", uvo);
		mv.addObject("board", bvo);
		mv.addObject("article", avo);
		mv.addObject("replyList", replyList);
		mv.setViewName("/board/articleDetail");
		return mv;
	}
	
	@PostMapping("/{boardNo}/post-reply")
	public String postReply(@PathVariable Integer boardNo, @RequestBody ReplyVO rvo) {
		System.out.println(rvo.toString());
		if(replyService.insert(rvo) == 1) {
			return "post-reply-success";
		} else {
		return "post-reply-fail";
		}
	}
	
}
