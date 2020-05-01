package com.it.wecodeyou.interest.sevice;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.interest.model.InterestVO;
import com.it.wecodeyou.interest.repository.IInterestMapper;
import com.it.wecodeyou.member.repository.IMemberMapper;

@Service
public class InterestService implements IInterestService{
	
	@Autowired
	   private IInterestMapper dao;
	
	@Autowired
		private IMemberMapper mdao;

	@Override
	public boolean insertInterest(InterestVO ivo)  throws SQLException {
		try {
			dao.insertInterest(ivo);
		} catch (Exception e) {
			System.out.println("dao insertInterest exception");
			return false;
		}
		return true;
	}

	@Override
	public Integer checkUserNo(Integer interestUserNo)  throws SQLException {
		// TODO Auto-generated method stub
		return dao.checkUserNo(interestUserNo);
	}

	@Override
	public boolean updateInterest(Integer userNo) throws SQLException {
		try {
			mdao.updateInterest(userNo);
		} catch (Exception e) {
			System.out.println("dao updateInterest exception");
			return false;
		}
		return true;
	}
	
}
