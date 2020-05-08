package com.it.wecodeyou.purchase.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.purchase.model.PurchaseVO;
import com.it.wecodeyou.purchase.repository.IPurchaseMapper;

@Service
public class PurchaseService implements IPurchaseService {

	@Autowired
	private IPurchaseMapper dao;

	@Override
	public void insertPurchase(PurchaseVO pv) {
		dao.insertPurchase(pv);
	}

	@Override
	public ArrayList<PurchaseVO> selectAllPurchase() {
		return dao.selectAllPurchase();
	}

	@Override
	public ArrayList<PurchaseVO> selectUsersPurchase(Integer user_no) {
		return dao.selectUsersPurchase(user_no);
	}

	@Override
	public void updateRefund(PurchaseVO pv) {
		dao.updateRefund(pv);
	}

}