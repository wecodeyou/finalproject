package com.it.wecodeyou.purchase.service;

import java.util.ArrayList;

import com.it.wecodeyou.purchase.model.PurchaseResultVO;
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
	
	// 월간 수입
	public ArrayList<PurchaseResultVO> getMonthlyEarnings();
	
	// 연간 수입
	public ArrayList<PurchaseResultVO> getAnnualEarnings();
	
	// 이 달의 수입
	public PurchaseResultVO getThisMonthlyEarnings();
	
	// 올 해의 수입
	public PurchaseResultVO getThisAnnualEarnings();
	
	// 회원번호 받아서 온라인 구매내역 조회
	public ArrayList<PurchaseVO> selectUsersPurchaseOn(Integer user_no);
	
	//수강 기간 만료 > seat_no = 0 으로 설정
	public void updateExpire(PurchaseVO pv);
	
	// 오프강의구매 
	public void insertOffPro(PurchaseVO pv);
	
	// 온강의구매
	public void insertOnPro(PurchaseVO pv);
	
}