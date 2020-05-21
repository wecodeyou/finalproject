package com.it.wecodeyou.board.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.it.wecodeyou.tag.model.TagVO;
import com.it.wecodeyou.tag.service.ITagService;

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
	@Autowired
	private ITagService tagService;

	
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
	public ModelAndView board(ModelAndView mv, @PathVariable Integer boardNo, PageVO paging)  throws SQLException  {

		BoardVO bvo = boardService.getInfoByNo(boardNo);
		System.out.println("Get /board/{boardTitle} Board Info: \r\n" 
						+ bvo.toString());
		List<ArticleVO> avo2 = articleService.list(paging);
		
		//article no의 각각의 hashtag를 담을 map 
		Map<Integer, Object> tagMap = new HashMap<Integer, Object>();
		for (int i = 0; i < avo2.size(); i++) {
			List<String> tvo = articleService.searchTagByArticle(avo2.get(i).getArticleNo());

			System.out.println("con current key: " + i);
			tagMap.put(i, tvo);
		}
		mv.addObject("tagMap", tagMap);

		paging.setBoardNo(boardNo);
		List<ArticleVO> list = articleService.list(paging);
		ArrayList<MemberVO> userNameList = new ArrayList<MemberVO>();
		
		for (int i = 0; i<list.size();i++) {
			userNameList.add(memberService.getOneInfo(list.get(i).getArticleWriter()));
			
		}
		for(ArticleVO avo: list) {
			System.out.println(avo.toString());
		}
		PageCreator pc = new PageCreator();
		pc.setPaging(paging);
		pc.setArticleTotalCount(articleService.countArticles(boardNo));
		System.out.println(pc.toString());
		
		ArrayList<TagVO> nameList = tagService.getAllTag();
	    ArrayList<TagVO> ptagList = tagService.searchPTagNo();
	    mv.addObject("ptagList", ptagList);
	    mv.addObject("nameList", nameList);
	    mv.addObject("userNameList", userNameList);

		mv.addObject("board", bvo);
		mv.addObject("articleList", list);
		mv.addObject("pc", pc);
		
		//mv.setViewName("/board/ArticleList");
		mv.setViewName("/board/article-main");
		return mv;
	}
	
	
	
	
	@GetMapping("/{boardNo}/register")
	public ModelAndView registerArticle(ModelAndView mv, @PathVariable Integer boardNo) {
		mv.addObject("boardNo", boardNo);
		mv.setViewName("/board/articleForm");
		return mv;
	}

	@PostMapping("/{boardNo}/register")
	public ModelAndView registerArticle(@PathVariable Integer boardNo, ArticleTagVO atvo, ModelAndView mv) {
		System.out.println(atvo.toString());
		ArticleVO avo = new ArticleVO();
		avo.setArticleTitle(atvo.getArticleTitle());
		avo.setArticleContent(atvo.getArticleContent());
		avo.setArticleWriter(atvo.getArticleWriter());
		avo.setArticleBoardNo(boardNo);
		
		//tag number list
        ArrayList<Integer> sendTagList = atvo.getSendTagList();
		if(articleService.insert(avo, sendTagList) == 1) {
			mv.addObject("message", "register-success");
			mv.setViewName("redirect:/board/" + boardNo);
		} else {
			mv.addObject("message", "register-fail");
			mv.setViewName("redirect:/board/" + boardNo + "/register");
		}
		return mv;
	}
	
	@GetMapping("/article/{articleNo}")
	public ModelAndView articleDetail(@PathVariable Integer articleNo, ModelAndView mv) throws NumberFormatException, SQLException {
		
		ArticleVO avo = articleService.getOneInfo(articleNo);
		BoardVO bvo = boardService.getInfoByNo(avo.getArticleBoardNo());
		MemberVO uvo = null;
		
		List<ReplyUserVO> replyList = replyService.listByArticle(articleNo);
		
		ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
		ArrayList<String> imgList = new ArrayList<String>(); 
		for (int i =0; i< replyList.size(); i++) {
			
			memberList.add(memberService.getOneInfo(replyList.get(i).getReplyWriter()));
			imgList.add(memberList.get(i).getUserProfileImg());
		}
		
		try {
			uvo = memberService.getOneInfo(avo.getArticleWriter());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("GET /article/{articleNo} - \r\n Article : " + avo.toString());
		System.out.println( "User : " + uvo.toString());
		System.out.println("Board : " + bvo.toString());
		System.out.println("Total Replies : " + replyList.size());
		System.out.println("tags: " + tagService.getTagsByArticle(articleNo));
		mv.addObject("tag", tagService.getTagsByArticle(articleNo));
		mv.addObject("user", uvo);
		mv.addObject("board", bvo);
		mv.addObject("article", avo);
		mv.addObject("replyList", replyList);
		mv.addObject("profileImg",imgList);
		mv.setViewName("/board/articleDetail");
		return mv;
	}
	
	@PostMapping("/{boardNo}/post-reply")
	public ModelAndView postReply(@PathVariable Integer boardNo, ReplyVO rvo, HttpSession session, ModelAndView mv) throws NumberFormatException, SQLException {
		System.out.println(rvo.toString());
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		rvo.setReplyWriter(mvo.getUserNo());
		rvo.setReplyDepth(replyService.getDepth(rvo.getReplyParent()));
		rvo.setReplyOrder(replyService.getMaxOrder(rvo.getReplyParent()));
		System.out.println("답글: " + rvo);
			replyService.insertReply(rvo);
		String viewName  = "redirect:/board/article/" + rvo.getReplyArticleNo();
		mv.setViewName(viewName);
		return mv;
	}
	@PostMapping("/{boardNo}/post-comment")
	public String postComment(@PathVariable Integer boardNo, @RequestBody ReplyVO rvo, HttpSession session) throws NumberFormatException, SQLException {
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		int depth = replyService.getMaxDepth(rvo.getReplyArticleNo());
		rvo.setReplyDepth(depth);
		rvo.setReplyWriter(mvo.getUserNo());
		System.out.println(rvo.toString());
		if(replyService.insertComment(rvo) == 1) {
			return "post-reply-success";
		} else {
		return "post-reply-fail";
		}
	}
	
}
