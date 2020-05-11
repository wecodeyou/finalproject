package com.it.wecodeyou.search.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.board.service.IArticleService;
import com.it.wecodeyou.commons.PageCreator;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.product.service.IProductService;
import com.it.wecodeyou.search.model.SearchVO;
import com.it.wecodeyou.search.service.ISearchService;
import com.it.wecodeyou.tag.model.TagVO;
import com.it.wecodeyou.tag.service.ITagService;

@RestController 
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	ISearchService service;
	
	@Autowired 
	IArticleService articleService;
	
	@Autowired
	ITagService tagService;
	
	@Autowired
	IProductService productService;
	
	
	//home에서 기본 검색
   	@GetMapping("")
	public ModelAndView search(SearchVO svo, ModelAndView mv) throws SQLException {
		System.out.println("URL: /search 메인검색 GET -> result: ");
		
		String productType = svo.getProductType();
		System.out.println("넘어온 상품타입: " + productType);
		
		String condition = svo.getCondition();
		
		PageCreator pc = new PageCreator();
		pc.setPaging(svo);
		
		// 검색어 정규식으로 만들기 (mapper 용)
		String search = svo.getQ();

		String str[] = search.split(" ");
		String keyword = "";
		for (int i = 0; i < str.length; i++) {
			if (i != str.length - 1) {
				keyword += str[i] + "|";
			} else {
				keyword += str[i];
			}
		}
		System.out.println("keyword 정규식 변환 후: " + keyword);
		svo.setQ(keyword);
		
		//1. 게시글 검색 
		List<ArticleVO> articleList = null;
		//2-1. 상품 전체 검색 
		List<ProductVO> allProductList = null;
		
		if(condition.equals("title")) {
			articleList = articleService.getArticleListByTitle(svo);
			allProductList = productService.getProductByTitle(svo);
		} else if(condition.equals("titleContent")) { 
			articleList = articleService.getArticleByTitleContent(svo);
			allProductList = productService.getProductByTitleContent(svo);
		} else if(condition.equals("hashtag")) {
			articleList = tagService.getArticleByHashtag(svo);
			allProductList = tagService.getProductByHashtag(svo);
			search = "#" + search;
		} 
		
		//2-2. 상품 전체를 product, off, on 3가지 type으로 나누기
		List<ProductVO> productList = new ArrayList<>();
		List<ProductVO> offList = new ArrayList<>();
		List<ProductVO> onList = new ArrayList<>();
		
		if(allProductList != null) {
			for (ProductVO pvo : allProductList) { 
				 if (pvo.getProductType().equals("0")) {
					 onList.add(pvo); 
				 } else if(pvo.getProductType().equals("1") ) {
					 offList.add(pvo);
				 } else { 
					 productList.add(pvo); 
				 } 
			} 
		}
		
		//hashtag
		Map<Integer, Object> tagMapArticle = new HashMap<Integer, Object>();
		Map<Integer, Object> tagMapOnline = new HashMap<Integer, Object>();
		Map<Integer, Object> tagMapOffline = new HashMap<Integer, Object>();
		Map<Integer, Object> tagMapProduct = new HashMap<Integer, Object>();
		
		for (int i = 0; i < articleList.size(); i++) {
			System.out.println(articleList.get(i).getArticleTitle());
			List<String> tvo = articleService.searchTagByArticle(articleList.get(i).getArticleNo());
			tagMapArticle.put(i, tvo);
		}
		for (int i = 0; i < onList.size(); i++) {
			System.out.println("onList name: " + onList.get(i).getProductName());
			List<String> tvo = tagService.searchTags(onList.get(i).getProductNo());
			tagMapOnline.put(i, tvo);
		}
		for (int i = 0; i < offList.size(); i++) {
			System.out.println("onList name: " + offList.get(i).getProductName());
			List<String> tvo = tagService.searchTags(offList.get(i).getProductNo());
			tagMapOffline.put(i, tvo);
		}
		for (int i = 0; i < productList.size(); i++) {
			System.out.println("onList name: " + productList.get(i).getProductName());
			List<String> tvo = tagService.searchTags(productList.get(i).getProductNo());
			tagMapProduct.put(i, tvo);
		}
		//검색어 결과에 따른 String[] hashtag가 담긴 Map
		mv.addObject("tagA", tagMapArticle);
		mv.addObject("tagOn", tagMapOnline);
		mv.addObject("tagOff", tagMapOffline);
		mv.addObject("tagP", tagMapProduct);
		
		//검색 추천 태그
		ArrayList<TagVO>nameList = tagService.getAllTag();
	    ArrayList<TagVO> ptagList = tagService.searchPTagNo();
	    mv.addObject("ptagList", ptagList);
	    mv.addObject("nameList", nameList);
	      
	    //검색어 & 조건
	    mv.addObject("search", search);
	    mv.addObject("condition", condition);
		
	    //검색어 결과 리스트
	    mv.addObject("articleList", articleList);
	    mv.addObject("allProductList", allProductList);
	    mv.addObject("onList",  onList);
	    mv.addObject("offList", offList); 
		mv.addObject("productList", productList); 
		
		//페이징
		mv.addObject("pc", pc);
		
		//productType
	    mv.addObject("productType", productType);
		
		//결과 페이지
		if(productType == null ) {
			mv.setViewName("search/searchResult");
		} else if(productType.equals("0") || productType.equals("1") || productType.equals("2")) {
			mv.setViewName("search/productlist");
		} else {
			mv.setViewName("search/articles");
		}

		return mv;
	}
  
}
