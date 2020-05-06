package com.it.wecodeyou.product.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.off.model.OffProductVO;
import com.it.wecodeyou.off.model.OffVO;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.product.service.IProductService;

@RestController
@RequestMapping(value="/product")
public class ProductController {
	
	@Autowired
	IProductService productService;
	
	@GetMapping(value="")
	public ModelAndView list(ModelAndView mv) {
		List<ProductVO> pList = productService.list();

		mv.addObject("productList", pList);
		mv.setViewName("/product/list");
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
	
}
