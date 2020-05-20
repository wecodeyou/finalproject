package com.it.wecodeyou.member.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.member.model.MemberVO;
import com.it.wecodeyou.member.repository.IMemberMapper;

@Service
public class MemberService implements IMemberService {

   @Autowired
   private IMemberMapper dao;

   @Override
   public void insertMember(MemberVO mvo) {

      // 비밀번호 암호화 인코딩
      BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

      System.out.println("암호화 전 패스워드:  " + mvo.getUserPw());

      // 패스워드를 암호화하여 mvo 객체에 저장하기
      String securePw = encoder.encode(mvo.getUserPw()); // 원래 패스워드를 암호화함
      mvo.setUserPw(securePw); // 암호화 한 패스워드를 user 객체 비밀번호에 set

      System.out.println("암호화 후 패스워드:  " + securePw);

      mvo.setUserPoint(500);
      mvo.setUserType(0);
      mvo.setUserInterest(false);

      String[] profileimg = {
    		  "https://res.cloudinary.com/dl5spujr5/image/upload/v1589563322/wecodeyou/basic-profileImg-gray_d7oewb.png",
    			  "https://res.cloudinary.com/dl5spujr5/image/upload/v1589563317/wecodeyou/basic-profileImg-purple_evwe0n.png",
    			  "https://res.cloudinary.com/dl5spujr5/image/upload/v1589563311/wecodeyou/basic-profileImg-blue_l5b5bf.png",
    			  "https://res.cloudinary.com/dl5spujr5/image/upload/v1589563310/wecodeyou/basic-profileImg-apricot_zg7fo1.png"
      };
      
      double ramdom = Math.random();
      int intval = (int)(ramdom*4);
      
      if (mvo.getUserProfileImg() == null) {
    	  mvo.setUserProfileImg(profileimg[intval]);
      }
      
      dao.insertMember(mvo);
   }

   @Override
   public void changeInfo(MemberVO mvo) {
      dao.changeInfo(mvo);
   }

   @Override
   public void changePw(MemberVO mvo) {

      BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

      // 패스워드를 암호화하여 mvo 객체에 저장하기
      String securePw = encoder.encode(mvo.getUserPw()); // 원래 패스워드를 암호화함
      mvo.setUserPw(securePw); // 암호화 한 패스워드를 user 객체 비밀번호에 set

      dao.changePw(mvo);
   }

   @Override
   public void deleteMember(Integer userNo) {
      dao.deleteMember(userNo);
   }

   @Override
   public MemberVO findEmail(MemberVO mvo) {
      return dao.findEmail(mvo);
   }

   @Override
   public MemberVO getOneInfo(Integer userNo) throws SQLException {
      return dao.getOneInfo(userNo);
   }

   @Override
   public ArrayList<MemberVO> getAllInfo() throws SQLException {
      return dao.getAllInfo();
   }

   @Override
   public Integer checkEmail(String userEmail) {
      return dao.checkEmail(userEmail);
   }

   @Override
   public Integer checkTel(String userTel) {
      return dao.checkTel(userTel);
   }

   @Override
   public MemberVO checkLogin(String userEmail) {
	  dao.updateLoginedAt(userEmail);
      return dao.checkLogin(userEmail);
   }

	@Override
	public MemberVO findMemberById(String userEmail) {
		try {
			return dao.findMemberById(userEmail);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int checkInterest(Integer userNo) throws SQLException {
		return dao.checkInterest(userNo);
	}

	@Override
	public void updateInterest(Integer userNo) throws SQLException {
	}

	@Override
	public void changeUserType(MemberVO mvo) throws SQLException {
		// TODO Auto-generated method stub
		
		if (mvo.getUserType() == 0)
			mvo.setUserType(1);
		else
			mvo.setUserType(0);
		
		dao.changeUserType(mvo);
	}

	@Override
	public void updatePurchase(MemberVO mvo) {
		dao.updatePurchase(mvo);
		
	}



}