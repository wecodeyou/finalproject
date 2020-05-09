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
import com.it.wecodeyou.search.model.SearchVO;
import com.it.wecodeyou.search.service.ISearchService;
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
	
	//home에서 기본 검색 (paging처리 O)
   	@GetMapping("")
	public ModelAndView search(SearchVO svo, ModelAndView mv) throws SQLException {
		System.out.println("URL: /search GET -> result: ");
		System.out.println("메인 검색");
		System.out.println("검색어: " + svo.getQ());
		
		//페이지 처리???
		PageCreator pc = new PageCreator();
		pc.setPaging(svo);
		
		//검색 정규식으로 만들기
		String search = svo.getQ();
		
		String str[] = search.split(" ");
		String keyword = "";
		for (int i = 0; i < str.length; i++) {
			if(i != str.length-1) {
				keyword += str[i] + "|";
			} else {
				keyword += str[i];
			}
			
		}
		System.out.println("keyword 정규식 변환 후: " + keyword);
		svo.setQ(keyword);
		
		List<ArticleVO> articleList = null;
		articleList = service.searchArticleByKeywordList(svo);
		for (ArticleVO a : articleList) {
			System.out.println(a.getArticleTitle());
		}
		
		List<ProductVO> allProductList = null;
		allProductList = service.searchAllProductByKeywordList(svo);
		
		// product, off, on type으로 나눠서 저장
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
		mv.addObject("search", search);
		mv.addObject("productList", productList); 
		mv.addObject("offList", offList); 
		mv.addObject("onList",  onList);
		mv.addObject("articleList", articleList);
		mv.addObject("allProductList", allProductList);
		mv.setViewName("search/searchResult");
		return mv;
	}
  
	@GetMapping("/articles")
	public ModelAndView products(SearchVO svo, ModelAndView mv) throws SQLException {
		System.out.println("URL: /search/products GET -> result: ");
		System.out.println("products검색");
		
		System.out.println("넘어온 상품타입: " + svo.getProductType());
   		
		// 페이지 처리???
		PageCreator pc = new PageCreator();
		pc.setPaging(svo);

		// 검색 정규식으로 만들기
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
		
		if(svo.getProductType().equals("3")) {
			List<ArticleVO> articleList = null;
			articleList = service.searchArticleByKeywordList(svo);
			
			// article no의 각각의 hashtag를 담을 map
			Map<Integer, Object> tagMap = new HashMap<Integer, Object>();
			for (int i = 0; i < articleList.size(); i++) {
				System.out.println(articleList.get(i).getArticleTitle());
				List<String> tvo = articleService.searchTagByArticle(articleList.get(i).getArticleNo());
				tagMap.put(i, tvo);
			}
			mv.addObject("articleList", articleList);
			mv.addObject("tagMap", tagMap);
			mv.addObject("search", search);
			mv.addObject("articleList", articleList);
			mv.setViewName("search/articles");
			
		} else {
			//online만 가져오기
			List<ProductVO> productList = service.productByKeywordList(svo);
			System.out.println("productList 사이즈: " + productList.size());
			
			// article no의 각각의 hashtag를 담을 map
			Map<Integer, Object> tagMap = new HashMap<Integer, Object>();

			for (int i = 0; i < productList.size(); i++) {
				System.out.println("product name: " + productList.get(i).getProductName());
				List<String> tvo = tagService.searchTags(productList.get(i).getProductNo());
				tagMap.put(i, tvo);
			}
			
			mv.addObject("tagMap", tagMap);
			mv.addObject("search", search);
			mv.addObject("productList", productList);
			mv.setViewName("search/productlist");
		}
		
   		return mv;
   	}
	
}
