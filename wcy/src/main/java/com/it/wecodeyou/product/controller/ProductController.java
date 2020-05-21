package com.it.wecodeyou.product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.member.model.MemberVO;
import com.it.wecodeyou.off.model.OffCourseVO;
import com.it.wecodeyou.off.model.OffProductVO;
import com.it.wecodeyou.off.model.OffVO;
import com.it.wecodeyou.off.service.IOffService;
import com.it.wecodeyou.on.model.OnCourseVO;
import com.it.wecodeyou.on.model.OnVO;
import com.it.wecodeyou.on.service.IOnService;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.product.service.IProductService;
import com.it.wecodeyou.sub_product.model.SubProductVO;
import com.it.wecodeyou.sub_product.service.ISubProductService;

@RestController
@RequestMapping(value="/product")
public class ProductController {
	
	@Autowired
	IProductService productService;
	@Autowired
	IOffService offService;
	@Autowired
	ISubProductService subService;
	@Autowired
	IOnService onService;
	@GetMapping(value="")
	public ModelAndView list(ModelAndView mv) {
		List<ProductVO> pList = productService.list();

		mv.addObject("productList", pList);
		mv.setViewName("/product/list");
		//mv.setViewName("/admin");
		return mv;
	}
	
	@GetMapping(value="/register")
	public ModelAndView register(ModelAndView mv){
		mv.setViewName("/product/register");
		return mv;
	}
	
	//등록에 성공하면 매개객체인 pvo에 자동으로 productNo가 등록된다.(getOneInfo를 써서 확인 안해도 됨)
	//그리고 product.register(pvo)는 성공시 1, 실패시 0 리턴
	@PostMapping(value="/register")
	public String register(@RequestBody OffProductVO opvo) {

		ProductVO pvo = new ProductVO();
		pvo.setProductName(opvo.getProductName());
		pvo.setProductPrice(opvo.getProductPrice());
		pvo.setProductType(opvo.getProductType());
		pvo.setProductThumb(opvo.getProductThumb());
		pvo.setProductDetail(opvo.getProductDetail());
		
		System.out.println("POST /product/register - inputInfo: \r" + pvo.toString());
		
		int result = productService.register(pvo);
		
		//insert into product_tag table
		ArrayList<Integer> sendTagList = opvo.getSendTagList();
		boolean insertChk = productService.insertPtag(sendTagList, pvo.getProductNo());
		
		System.out.println("ProductNo after Insert : " + pvo.getProductNo() + " \r\n Result : " + result);
		if (result == 1 || insertChk == true) {
			return "product_success";
		} else {
			return "product_fail";
		}
	}

	  @GetMapping("/{productNo}")
	  public ModelAndView info(@PathVariable Integer productNo, ModelAndView mv) {
		  
		  ProductVO pvo = productService.getOneInfo(productNo);
		  System.out.println("/off/{productNo} ProductVO : \r\n" + pvo.toString());
		  	mv.addObject("product", pvo);
		  	mv.setViewName("/off/detail");
		  return mv;
	  }
	
	  @GetMapping("/registerMain")
	  public ModelAndView registerMain(ModelAndView mv) {
		  mv.setViewName("/product/registerMain");
		  return mv;
	  }
	  
	  
	  @PostMapping("/register-off")
	  public String registerOff(@RequestBody OffCourseVO ocvo, HttpSession session) {
		  System.out.println("/register-off : \n " + ocvo.toString());
		  MemberVO login = (MemberVO) session.getAttribute("login");
		  
		  ProductVO pvo = new ProductVO();
		  pvo.setProductType("1");
		  pvo.setProductDetail(ocvo.getDetail());
		  pvo.setProductName(ocvo.getName());
		  pvo.setProductPrice(ocvo.getPrice());
		  pvo.setProductThumb(ocvo.getThumb());
		  
		  OffVO ovo = new OffVO();
		  ovo.setOffAuthor(login.getUserEmail());
		  ovo.setOffCategory(ocvo.getType());
		  ovo.setOffPlace(ocvo.getPlace());
		  ovo.setOffRoom(ocvo.getRoom());
		  ovo.setOffSeats(ocvo.getSeats());
		  ovo.setOffStartAt(ocvo.getOffStartAt());
		  ovo.setOffEndAt(ocvo.getOffEndAt());
		  
		  SubProductVO spvo = new SubProductVO();
		  spvo.setSpBook(ocvo.getBook());
		  spvo.setSpLecName(ocvo.getName());
		  spvo.setSpProId(pvo.getProductNo());
		  spvo.setSpScope("오프라인");
		  spvo.setSpThum(ocvo.getThumb());
		  
			// tag number list
			ArrayList<Integer> sendTagList = ocvo.getSendTagList();
			int result = offService.insert(pvo, ovo, sendTagList);
			System.out.println("ID값" + result);
		 if(result != 0){
			 spvo.setSpProId(result);
			 System.out.println(spvo.toString());
			if(subService.insert(spvo) ==1 ) {
			  return "register-success";
			} else {
				return "subservice-error";
			}
			
		 } else {
			  return "register-fail";			 
		 }
	  }
	  
	  @PostMapping("/register-on")
	  public String registerOn(@RequestBody OnCourseVO ocvo, HttpSession session) {
		  System.out.println("/register-on : \n " + ocvo.toString());
		  MemberVO login = (MemberVO) session.getAttribute("login");
		  
		  ProductVO pvo = new ProductVO();
		  pvo.setProductType("0");
		  pvo.setProductDetail(ocvo.getDetail());
		  pvo.setProductName(ocvo.getName());
		  pvo.setProductPrice(ocvo.getPrice());
		  pvo.setProductThumb(ocvo.getThumb());
		  
		  OnVO ovo = new OnVO();
		  ovo.setOnAuthor(login.getUserEmail());
		  ovo.setOnCategory(ocvo.getCategory());
		  ovo.setOnDays(ocvo.getDays());

		  SubProductVO spvo = new SubProductVO();
		  spvo.setSpBook(ocvo.getBook());
		  spvo.setSpLecName(ocvo.getName());
		  spvo.setSpProId(pvo.getProductNo());
		  spvo.setSpScope("온라인");
		  spvo.setSpThum(ocvo.getThumb());
		  
			// tag number list
			ArrayList<Integer> sendTagList = ocvo.getSendTagList();
			int result = onService.insert(pvo, ovo, sendTagList);
			System.out.println("ID값" + result);
		 if(result != 0){
			 spvo.setSpProId(result);
			 System.out.println(spvo.toString());
			if(subService.insert(spvo) ==1 ) {
			  return "register-success";
			} else {
				return "subservice-error";
			}
			
		 } else {
			  return "register-fail";			 
		 }
	  }
}
