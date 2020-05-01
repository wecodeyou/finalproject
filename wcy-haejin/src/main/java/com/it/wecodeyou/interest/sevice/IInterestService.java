package com.it.wecodeyou.interest.sevice;

import java.sql.SQLException;

import com.it.wecodeyou.interest.model.InterestVO;

public interface IInterestService {
	
	   // insert (설문조사 결과 저장)
	   public boolean insertInterest(InterestVO ivo) throws SQLException;
	   
	   // check (중복검사)
	   public Integer checkUserNo(Integer interestUserNo) throws SQLException;
	   
	   // update (유저 interest 필드 true로)
	   public boolean updateInterest(Integer userNo)  throws SQLException;

}
