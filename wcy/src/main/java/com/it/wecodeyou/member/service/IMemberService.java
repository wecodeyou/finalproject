package com.it.wecodeyou.member.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.it.wecodeyou.member.model.MemberVO;

public interface IMemberService {

   
   // 회원가입
   public void insertMember(MemberVO mvo);
   
   // 정보 수정 (userNo 받아서 생일, 휴대폰번호, 프로필 이미지, 주소 수정)
   public void changeInfo(MemberVO mvo);
   
   // 비밀번호 변경
   public void changePw(MemberVO mvo);
   
   // 회원탈퇴
   public void deleteMember(Integer userNo);   
   
   // 한 사람 정보 전체 출력 (마이페이지)
   public MemberVO getOneInfo(Integer userNo) throws SQLException;
   
   // 로그인을 위한 정보출력 (로그인)
   public MemberVO checkLogin(String userEmail);
   
   // 회원 전체 정보 출력 (관리자페이지)
   public ArrayList<MemberVO> getAllInfo() throws SQLException ;
   
   // 이메일 찾기
   public MemberVO findEmail(MemberVO mvo);
   
   // 이메일 중복체크
   Integer checkEmail(String userEmail);
   
   // 전화번호 중복체크
   Integer checkTel(String userTel);
   
   public MemberVO findMemberById(String userEmail);
   
   // 설문조사 true 인지 false 인지
   public int checkInterest(Integer userNo) throws SQLException;
   
   // 설문조사 등록시 true로 수정
   public void updateInterest(Integer userNo) throws SQLException;
   
   // 유저타입 변경
   public void changeUserType(MemberVO mvo) throws SQLException;
}