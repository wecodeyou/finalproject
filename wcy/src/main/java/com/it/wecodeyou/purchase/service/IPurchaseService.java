package com.it.wecodeyou.purchase.service;

import java.util.ArrayList;

import com.it.wecodeyou.purchase.model.PurchaseVO;

public interface IPurchaseService {

	// 물품 구매
	public void insertPurchase(PurchaseVO pv);

	// 모든 구매 내역 조회 (관리자용)
	public ArrayList<PurchaseVO> selectAllPurchase();

	// 회원번호를 받아서 구매 내역 조회 (유저용) isrefund = false
	// 회원번호를 받아서 취소 내역 조회 isrefund = true
	public ArrayList<PurchaseVO> selectUsersPurchase(Integer user_no);

	// 취소/환불 -> isrefund를 false 에서 true로 수정
	public void updateRefund(PurchaseVO pv);

}