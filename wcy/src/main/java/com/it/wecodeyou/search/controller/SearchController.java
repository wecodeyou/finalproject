package com.it.wecodeyou.search.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.commons.PageCreator;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.search.model.SearchVO;
import com.it.wecodeyou.search.service.ISearchService;

@RestController 
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	ISearchService service;
	
	//home에서 기본 검색 (paging처리 X)
   	@GetMapping("")
	public ModelAndView search(SearchVO svo, ModelAndView mv) throws SQLException {

		System.out.println("URL: /tag/search GET -> result: ");
		System.out.println("메인 검색");
		System.out.println("검색어: " + svo.getQ());
		
		
		
		List<ArticleVO> articleList = null;
		List<ProductVO> allProductList = null;
		
		articleList = service.searchAllArticleByKeyWord(svo);
		allProductList = service.searchAllProductByKeyWord(svo);
		System.out.println("검색된 article 수: " + articleList.size());
		System.out.println("검색된 product 수: " + allProductList.size());
		
		// product, off, on type으로 나눠서 저장
		if (allProductList.size() > 0) {
			List<ProductVO> productList = new ArrayList<>();
			List<ProductVO> offList = new ArrayList<>();
			List<ProductVO> onList = new ArrayList<>();

			for (ProductVO pvo : allProductList) {
				if (pvo.getProductType().equals("0")) {
					productList.add(pvo);
				} else if (pvo.getProductType().equals("1")) {
					offList.add(pvo);
				} else {
					onList.add(pvo);
				}
			}
			mv.addObject("productList", productList);
			mv.addObject("offList", offList);
	        mv.addObject("onList", onList);
		} 
		
		mv.addObject("keyword", svo.getQ());
		mv.addObject("articleList", articleList);
		mv.addObject("allProductList", allProductList);
		mv.setViewName("tag/searchResult");

		return mv;
	}
   
   	//(paging처리 O) -> article / product 별로 나누기 (각 컨트롤러에서 처리해도 될 듯?)
 	@GetMapping("/list")
 	public String list(SearchVO svo, Model model) throws SQLException {

 		System.out.println("URL: /board/list GET -> result: ");
 		System.out.println("parameter(페이지번호): " + svo.getPage() + "번");
 		System.out.println("svo.getCountPerPage(): " + svo.getCountPerPage()+ "번");
 		System.out.println("검색어: " + svo.getQ());
 		
 		PageCreator pc = new PageCreator();
 		pc.setPaging(svo);
 		
 		List<ArticleVO> articleList = null;
 		//List<ProductVO> productList = null;
 		
 		articleList = service.searchArticleByKeyWord(svo);
 		System.out.println("검색된 article 수: " + articleList.size());
 		
 		for (ArticleVO avo : articleList) {
			System.out.println(avo.getArticleTitle() + " " + avo.getArticleContent());
		}
 		
 		model.addAttribute("articleList", articleList);
 		//model.addAttribute("productList", productList);
 		model.addAttribute("pc", pc);

 		return "tag/searchResult";
 	}

}
