package com.it.wecodeyou.tag.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.tag.model.TagVO;
import com.it.wecodeyou.tag.service.ITagService;

@RestController
@RequestMapping("/tag")
public class TagController {
	
	@Autowired
	private ITagService service;
	
	
	@GetMapping("")
	public ModelAndView tag(ModelAndView mv) throws SQLException {
		
		ArrayList<TagVO>nameList = service.getAllTag();
		  
		mv.setViewName("tag/getAllTag");
		mv.addObject("nameList", nameList);
		
		return mv;
	}
	
	@GetMapping("/searchByBtn")
	public ModelAndView searchByBtn(ModelAndView mv) throws SQLException {
		 
		ArrayList<TagVO>nameList = service.getAllTag();
		ArrayList<TagVO> ptagList = service.searchPTagNo();
		mv.addObject("ptagList", ptagList);
		mv.addObject("nameList", nameList);
		mv.setViewName("tag/searchByBtn");
		
		return mv;
	}
	
	@GetMapping("/searchByInput")
	public ModelAndView searchByInput(ModelAndView mv) throws SQLException {
		 
		ArrayList<TagVO>nameList = service.getAllTag();
		ArrayList<TagVO> ptagList = service.searchPTagNo();
		mv.addObject("ptagList", ptagList);
		mv.addObject("nameList", nameList);
		mv.setViewName("tag/searchByInput");
		
		return mv;
	}
	
	//@ResponseBody
	 @PostMapping("/checkTagDetail")
	 public Map<String, ArrayList<String>> checkTagDetail(@RequestBody String q) throws SQLException {
			System.out.println("/tag/checkTagDetail : 태그검색 POST 요청 발생!");
			
			Map<String, ArrayList<String>> retVal = new HashMap<String, ArrayList<String>>();
			
		    ArrayList<String> nameList = new ArrayList<>();
		    ArrayList<String> noList = new ArrayList<>();
		    
		    for (int i = 0; i < service.checkTagDetail(q).size(); i++) {
				nameList.add(service.checkTagDetail(q).get(i).getTagName());
				noList.add(String.valueOf(service.checkTagDetail(q).get(i).getTagNo()));
			}
		    
		     if(nameList.size() == 0) {
		         nameList.add(q);
		         noList.add("no result");
		      }
		     
	         retVal.put("nameList", nameList); //nameList 태그명
	         retVal.put("noList", noList); //noList 태그 넘버명 (현재 문자열 배열)
			
		 return retVal;
	 }
	 
	@PostMapping("/insertTag")
	public String insertTag(@RequestBody String tag) throws SQLException {
		System.out.println("/tag/insertTag : 등록 POST 요청 발생!");
		System.out.println("등록할 name: " + tag);
		String no = null;
			if(service.checkTag(tag) == 0) {
				
				Boolean chk = service.insertTag(tag); 
				
				if(chk) {
					no = String.valueOf(service.checkTagDetail(tag).get(0).getTagNo());
				}else {
					no = "fail";
				}
			}else {
				System.out.println("중복 태그 방지");
				no = "fail";
			}
			
			
		return no;
	}
	
	@GetMapping("/searchProductByTag/{tagNo}")
	public ModelAndView searchProductByTag(@PathVariable ("tagNo") Integer tagNo, ModelAndView mv) throws SQLException {
		System.out.println("/tag/searchProductByTag : 태그로 상품 검색 POST 요청 발생!");
		
		String tagName = service.getTagName(tagNo);
		
		ArrayList<ArticleVO> avoList = service.searchArticleByTag(tagNo);
		ArrayList<ProductVO> pvoList = service.searchProductByTag(tagNo);
		
		System.out.println("article 수: " + avoList.size());
		
		if(pvoList.size()==0 && avoList.size()==0) {
			//검색결과가 없다면 추천 검색어 (중복 배제하기)
			ArrayList<TagVO> tagList = service.searchAPTagNo();
			mv.addObject("tagList", tagList);
		} else {
			List<ProductVO> productList = new ArrayList<>();
			List<ProductVO> offList = new ArrayList<>();
			List<ProductVO> onList = new ArrayList<>();
			
			for (ProductVO pvo : pvoList) {
				if(pvo.getProductType().equals("0")) {
					productList.add(pvo);
				} else if(pvo.getProductType().equals("1")) {
					offList.add(pvo);
				} else {
					onList.add(pvo);
				}
			}
			//article
			mv.addObject("avoList", avoList);
			//product
			mv.addObject("productList", productList);
			mv.addObject("offList", offList);
			mv.addObject("onList", onList);
			mv.addObject("pvoList", pvoList);
		}
		mv.addObject("tagName", tagName);
		mv.setViewName("tag/btnSearchResult");
		
		return mv;
	}

}
