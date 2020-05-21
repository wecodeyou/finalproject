package com.it.wecodeyou.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// 이게 왜 안쓰이는 거지 ?
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.board.model.ReplyVO;
import com.it.wecodeyou.board.model.ShowArticleVO;
import com.it.wecodeyou.board.model.ShowReplyVO;
import com.it.wecodeyou.board.service.IArticleService;
import com.it.wecodeyou.board.service.IReplyService;
import com.it.wecodeyou.member.model.MemberVO;
import com.it.wecodeyou.member.service.IMemberService;
import com.it.wecodeyou.mypage.model.MyMainVO;
import com.it.wecodeyou.off.model.OffProductVO;
import com.it.wecodeyou.off.service.IOffService;
import com.it.wecodeyou.on.service.IOnService;
import com.it.wecodeyou.point_purchase.service.IPoint_PurchaseService;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.product.service.IProductService;
import com.it.wecodeyou.purchase.model.PurchaseVO;
import com.it.wecodeyou.purchase.model.ShowVO;
import com.it.wecodeyou.purchase.service.IPurchaseService;
import com.it.wecodeyou.review.model.ReviewVO;
import com.it.wecodeyou.review.model.ShowReviewVO;
import com.it.wecodeyou.review.service.IReviewService;
import com.it.wecodeyou.sub_product.service.ISubProductService;

@RestController
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private IMemberService mservice;
	@Autowired
	private IReviewService rservice;
	@Autowired
	private IProductService pdservice;
	@Autowired
	private IPurchaseService pservice;
	@Autowired
	private IOffService oservice;
	@Autowired
	private IOnService onservice;
	@Autowired
	private IPoint_PurchaseService ppservice;	
	@Autowired
	private IArticleService aservice;
	@Autowired
	private IReplyService reservice;
	@Autowired
	private ISubProductService spreservice;
	
	@GetMapping("/")
	public ModelAndView mypageMain(ModelAndView mv, HttpSession session) {
		
		Integer user_no = ((MemberVO)session.getAttribute("login")).getUserNo();
		ArrayList<PurchaseVO> p_befor_list = pservice.selectUsersPurchase(user_no);
		ArrayList<PurchaseVO> p_list = new ArrayList<PurchaseVO>();
		ArrayList<MyMainVO> mm_list = new ArrayList<>();
		for (int i = 0; i < p_befor_list.size(); i++) {
			if(!p_befor_list.get(i).isPurchaseIsrefund()) {
				p_list.add(p_befor_list.get(i));
			}
		}// 환불된거는 걸러주는 작업 
		
/*
	private Integer productNo;
	private String productName;
	private Integer productType;
	private String spThum;
	private String spLecName;
	private Integer purchaseAmount;
	private Timestamp purchaseDate;
	private Timestamp offStartAt;
	private Timestamp offEndAt;
	private String offPlace;
	private String offRoom;
*/
		for (int i = 0; i < p_list.size(); i++) {
			MyMainVO mmvo = new MyMainVO();
			Integer pro_no = p_list.get(i).getPurchaseProNo();
			mmvo.setPurchaseNo(p_list.get(i).getPurchaseNo());
			mmvo.setProductNo(pro_no);
			mmvo.setProductName(pdservice.getOneInfo(pro_no).getProductName());
			mmvo.setProductType(Integer.parseInt(pdservice.getOneInfo(pro_no).getProductType()));
			mmvo.setSpThum(spreservice.showSubPro(pro_no).getSpThum());
			mmvo.setSpLecName(spreservice.showSubPro(pro_no).getSpLecName());
			mmvo.setPurchaseAmount(p_list.get(i).getPurchaseAmount());
			mmvo.setPurchaseDate(p_list.get(i).getPurchaseDate());
			if(Integer.parseInt(pdservice.getOneInfo(pro_no).getProductType())==1) {
				mmvo.setOffStartAt(oservice.getInfoByProductNo(pro_no).getOffStartAt());
				mmvo.setOffEndAt(oservice.getInfoByProductNo(pro_no).getOffEndAt());
				mmvo.setOffPlace(oservice.getInfoByProductNo(pro_no).getOffPlace());
				mmvo.setOffRoom(oservice.getInfoByProductNo(pro_no).getOffRoom());
			}
			mm_list.add(mmvo);
		}
		String reviewUser = ((MemberVO)session.getAttribute("login")).getUserEmail();
		ArrayList<ReviewVO> re_list = rservice.getAllReviewByUser(reviewUser); 
		for (int i = 0; i < mm_list.size(); i++) {
			for (int j = 0; j < re_list.size(); j++) {
				if(mm_list.get(i).getProductNo() == re_list.get(j).getReviewProductNo()) {
					mm_list.get(i).setIsWrite(1);
					break;
				}
			}
		}
		for (int i = 0; i < mm_list.size(); i++) {
			if(mm_list.get(i).getIsWrite() == null) {
				mm_list.get(i).setIsWrite(0);
			}
		}
		
		mv.addObject("mm_list",mm_list);
		mv.setViewName("mypage/mypage-main");
		
		return mv;
	}
	/*
	 * @PostMapping("/isWrite") public String isWrite( @RequestBody Integer
	 * reviewProductNo, HttpSession session) {
	 * System.out.println("/review/isWrite : POST 요청 발생!");
	 * 
	 * String reviewUser = ((MemberVO)session.getAttribute("login")).getUserEmail();
	 * ArrayList<ReviewVO> re_list = service.getAllReviewByUser(reviewUser); for
	 * (int i = 0; i < re_list.size(); i++) {
	 * if(re_list.get(i).getReviewProductNo()==reviewProductNo) { return "overed"; }
	 * } return "not"; }
	 */
	
	
	@GetMapping("/leclist")
	public ModelAndView lectureList(ModelAndView mv, ReviewVO rvo, HttpSession session) {

		System.out.println("/mypage/leclist : GET 요청 발생!");

		mv.setViewName("mypage/mypage-lecList");
		ArrayList<PurchaseVO> pv_list = new ArrayList<PurchaseVO>();
		pv_list = pservice.selectUsersPurchase(((MemberVO) session.getAttribute("login")).getUserNo());
		mv.addObject("pv_list", pv_list);
		// mv.addObject(rvo);
		return mv;
	}

	@GetMapping("/myinfoChange")
	public ModelAndView myInfo(ModelAndView mv, HttpServletResponse res ,HttpSession session, HttpServletRequest req) throws IOException, SQLException {
		System.out.println("/mypage/myinfoChange : GET 요청 발생!");
		if(session.getAttribute("login") == null) {
			 mv.setViewName("home");
	         res.setContentType("text/html; charset=UTF-8");
			 PrintWriter out_email = res.getWriter();
	         out_email.println("<script>alert('장기간 미활동으로 로그아웃되었습니다. 다시 로그인 해주세요.');</script>");
	         out_email.flush();
	         
		}else {
			mv.setViewName("mypage/mypage-change");			
			// Timestamp t = new Timestamp(System.currentTimeMillis());
			// SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
			MemberVO mvo = (MemberVO) session.getAttribute("login");
			if(mvo.getUserBirthday() != null) {
				mv.addObject("user_birthday", sdf.format(mvo.getUserBirthday()));
			}
			/*
			 * if (req.getParameter("change") != null) { mv.addObject("change",
			 * req.getParameter("change")); System.out.println(req.getParameter("change"));
			 * }
			 */
		}
		return mv;
	}

	@GetMapping("/pointInfo")
	public ModelAndView pointInfo(ModelAndView mv, HttpSession session) throws SQLException {
		System.out.println("/mypage/pointInfo : GET 요청 발생!");
		mv.setViewName("mypage/mypage-point");
		Integer user_no = ((MemberVO)session.getAttribute("login")).getUserNo();
		ArrayList<PurchaseVO> p_list = pservice.selectUsersPurchase(user_no);
		ArrayList<ShowVO> s_list = new ArrayList<ShowVO>();

    	for (int i = 0; i < p_list.size(); i++) {
    		ShowVO sv = new ShowVO();
    		sv.setPurchaseProName(pdservice.getOneInfo(p_list.get(i).getPurchaseProNo()).getProductName());
			sv.setPurchaseAmount(p_list.get(i).getPurchaseAmount());
			sv.setPurchaseDate(p_list.get(i).getPurchaseDate());
			s_list.add(sv);
		}
    	mv.addObject("m_list",s_list);
		mv.addObject("p_list",ppservice.getOnePurchaseList(user_no));
		
		return mv;
	}

	@GetMapping("/recentAct")
	public ModelAndView recentAct(ModelAndView mv, HttpSession session) {
		System.out.println("/mypage/recentAct : GET 요청 발생!");
		Integer user_no = ((MemberVO)session.getAttribute("login")).getUserNo();
		String user_email = ((MemberVO)session.getAttribute("login")).getUserEmail();
		
		//리뷰포장 start
		ArrayList<ReviewVO> r_list = rservice.getAllReviewByUser(user_email);
		ArrayList<ShowReviewVO> s_list = new ArrayList<>(); 	
		for (int i = 0; i < r_list.size(); i++) {
			ShowReviewVO svo = new ShowReviewVO();
			svo.setReviewCreatedAt(r_list.get(i).getReviewCreatedAt());
			svo.setContent(r_list.get(i).getContent());
			svo.setReviewStar(r_list.get(i).getReviewStar());
			svo.setReviewProductName(pdservice.getOneInfo(r_list.get(i).getReviewProductNo()).getProductName());
			svo.setReviewNo(r_list.get(i).getReviewNo());
			s_list.add(svo);
		}
		mv.addObject("s_list",s_list);// 리뷰 포장 end

		// 게시물 포장 start
		ArrayList<ArticleVO> a_list = aservice.getAllByUserNo(user_no);
		ArrayList<ShowArticleVO> sa_list = new ArrayList<>();
		for (int i = 0; i < a_list.size(); i++) {
			ShowArticleVO savo = new ShowArticleVO();
			savo.setArticleNo(a_list.get(i).getArticleNo());
			savo.setArticleContent(a_list.get(i).getArticleContent());
			savo.setArticleCreatedAt(a_list.get(i).getArticleCreatedAt());
			savo.setArticleTitle(a_list.get(i).getArticleTitle());
			switch(a_list.get(i).getArticleBoardNo()){
			case 1:
				savo.setArticleBoardType("자유");
				break;
			case 4:
				savo.setArticleBoardType("질문");
				break;
			case 5:
				savo.setArticleBoardType("정기모임/스터디");
				break;
			case 6:
				savo.setArticleBoardType("IT 행사");
				break;
			case 7:
				savo.setArticleBoardType("공유");
				break;
			default:
				savo.setArticleBoardType("자유");
				break;
			}
			sa_list.add(savo);
		}
		mv.addObject("sa_list",sa_list);
		// 게시물포장 end 
		
		// 댓글포장 start
		ArrayList<ReplyVO> re_list = reservice.listByUser(user_no);
		ArrayList<ShowReplyVO> srp_list = new ArrayList<ShowReplyVO>();
		for (int i = 0; i < re_list.size(); i++) {
			ShowReplyVO srvo = new ShowReplyVO();
			srvo.setReplyNo(re_list.get(i).getReplyArticleNo());
			srvo.setReplyContent(re_list.get(i).getReplyContent());
			srvo.setReplyCreatedAt(re_list.get(i).getReplyCreatedAt());
			srvo.setReplyArticleTitle(aservice.getOneInfo((int)re_list.get(i).getReplyArticleNo()).getArticleTitle());
			srp_list.add(srvo);
		}
		mv.addObject("srp_list",srp_list);
		
		mv.setViewName("mypage/mypage-recentAct");
		return mv;
	}

	// 비밀번호 변경 시 비밀번호 맞는지 확인
	@PostMapping("/pwCheck")
	public String loginCheck(@RequestBody String userPw, HttpSession session) throws SQLException {
		System.out.println("/mypage/pwCheck : 비밀번호 확인 POST 요청 발생!");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(); // 비밀번호 암호화 하여 db 저장하기 위한 객체 선언

		if (encoder.matches(userPw, ((MemberVO) session.getAttribute("login")).getUserPw())) {
			return "OK";			
		} else {
			return "NO";			
		}
	}

	@GetMapping("/mylec")
	public ModelAndView mylec(ModelAndView mv, HttpSession session) {
		System.out.println("/mypage/mylec : GET 요청 발생!");
		mv.setViewName("mypage/mypage-mylec2");
		
		String msg = "";
		ArrayList<ProductVO> pro_lec_list; 
		ArrayList<PurchaseVO> pur_lec_list;
		pro_lec_list = pdservice.purchasedOn(((MemberVO)session.getAttribute("login")).getUserNo());
		pur_lec_list = pservice.selectUsersPurchaseOn(((MemberVO)session.getAttribute("login")).getUserNo());
		if (pro_lec_list == null && pur_lec_list == null) {
			msg = "수강중인 온라인 강의가 없습니다.";
			mv.addObject("msg",msg);
			return mv;
		}
		Integer[] days = new Integer[pur_lec_list.size()];
		for (int i = 0; i <pur_lec_list.size();i++) {
			
			/*	 days.set(i, onservice.getDays(pur_lec_list.get(i))); */
			days[i] = onservice.getDays(pur_lec_list.get(i));
			System.out.println("days : "+ days[i] + "   pur_lec_list : " + pur_lec_list.get(i));
			if (days[i]<=0) {
				pservice.updateExpire(pur_lec_list.get(i));
				pro_lec_list = pdservice.purchasedOn(((MemberVO)session.getAttribute("login")).getUserNo());
				pur_lec_list = pservice.selectUsersPurchaseOn(((MemberVO)session.getAttribute("login")).getUserNo());
				continue;
			}
		}
		//구매내역에 있는 온라인 강의
		mv.addObject("pro_lec_list",pro_lec_list);
		mv.addObject("pur_lec_list",pur_lec_list);
		mv.addObject("days",days);

		
		//오프라인 강의 담기(유저별 따로 처리)
		  List<OffProductVO> offList = new ArrayList<OffProductVO>(); 
		  List<OffProductVO> classList = new ArrayList<OffProductVO>();
		  List<PurchaseVO> purchaseList = new ArrayList<PurchaseVO>();
		  OffProductVO temp;
		  System.out.println("/mypage/mylec : GET 요청 발생!");
		  mv.setViewName("mypage/mypage-mylec");
		  MemberVO mvo = (MemberVO)session.getAttribute("login"); 
			  purchaseList = pservice.selectUsersPurchase(mvo.getUserNo());
			  if(purchaseList.size() != 0) {
				  for(PurchaseVO pvo : purchaseList) {
					  temp = oservice.getOffProduct(pvo.getPurchaseProNo());
					  if(temp.getProductType().equals("1")) {
						  offList.add(temp);
					  } 
				  } 

			  }
			  classList = oservice.getOffProductByAuthor(mvo.getUserEmail());	
		  mv.addObject("classList", classList);
		  mv.addObject("offList", offList);
		  mv.addObject("offPurchaseList", purchaseList);
		
		return mv;
	}
	
    @PostMapping("/changeInfo")
    public String changePw(HttpSession session, @RequestBody MemberVO mvo) {
    	System.out.println(mvo);
    	mservice.changePw(mvo);
    	mservice.changeInfo(mvo);
    	session.removeAttribute("login");    	  
    	
    	return "Success";
    }
    
	@GetMapping("/review")
	public ModelAndView reviewPage(ModelAndView mv, HttpSession session, HttpServletRequest req) {
		mv.setViewName("mypage/mypage-reviewPage");
		Integer pro_no = Integer.parseInt(req.getParameter("p"));
		mv.addObject("proName",pdservice.getOneInfo(pro_no).getProductName());
		mv.addObject("pno",Integer.parseInt(req.getParameter("p")));
		mv.addObject("writer",((MemberVO)session.getAttribute("login")).getUserEmail());
		System.out.println(((MemberVO)session.getAttribute("login")).getUserEmail());
		return mv;
	}
	
}
