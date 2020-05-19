package com.it.wecodeyou.purchase.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.purchase.model.PurchaseResultVO;
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

	@Override
	public ArrayList<PurchaseResultVO> getMonthlyEarnings() {
		return dao.getMonthlyEarnings();
	}

	@Override
	public ArrayList<PurchaseResultVO> getAnnualEarnings() {
		return dao.getAnnualEarnings();
	}

	@Override
	public PurchaseResultVO getThisMonthlyEarnings() {
		return dao.getThisMonthlyEarnings();
	}

	@Override
	public PurchaseResultVO getThisAnnualEarnings() {
		return dao.getThisAnnualEarnings();
	}

	@Override
	public ArrayList<PurchaseVO> selectUsersPurchaseOn(Integer user_no) {
		// TODO Auto-generated method stub
		return dao.selectUsersPurchaseOn(user_no);
	}

	@Override
	public void updateExpire(PurchaseVO pv) {
		dao.updateExpire(pv);
		System.out.println("기간만료로 seat_no = 0 업데이트 완료!");
		// TODO Auto-generated method stub
		
		
	}

	@Override
	public void insertOffPro(PurchaseVO pv) {
		dao.insertOffPro(pv);
	}

	@Override
	public void insertOnPro(PurchaseVO pv) {
		dao.insertOnPro(pv);
	}

}