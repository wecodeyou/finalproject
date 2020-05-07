package com.it.wecodeyou.product.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.product.repository.IProductMapper;
import com.it.wecodeyou.ptag.repository.IPtagMapper;

@Service
public class ProductService implements IProductService {
	
	@Autowired
	IProductMapper pdao;
	
	@Autowired
	IPtagMapper ptagdao;
	
	@Override
	public Integer register(ProductVO pvo) {
		return pdao.insertProduct(pvo);
	}

	@Override
	public void update(ProductVO pvo) {
		pdao.updateProduct(pvo);
	}

	@Override
	public void remove(Long productNo) {
			pdao.deleteProduct(productNo);
	}

	@Override
	public List<ProductVO> list() {
		
		return pdao.list();
	}

	@Override
	public ProductVO getOneInfo(Integer productNo) {
		return pdao.getOneInfo(productNo);
	}

	@Override
	public boolean insertPtag(ArrayList<Integer> sendTagList, Integer productNo) {
		
		for (int i = 0; i < sendTagList.size(); i++) {
			try {
				ptagdao.insertPtag(sendTagList.get(i), productNo);
			} catch (SQLException e) {
				System.out.println("dao insertPtag Exeption!: " + sendTagList.get(i));
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}

	
	
	@Override
	public ArrayList<ProductVO> purchasedOn(Integer userNo) {
		// TODO Auto-generated method stub
		return pdao.purchasedOn(userNo);
	}

}
