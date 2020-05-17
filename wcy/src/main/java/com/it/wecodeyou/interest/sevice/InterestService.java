package com.it.wecodeyou.interest.sevice;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.interest.model.InterestReportVO;
import com.it.wecodeyou.interest.model.InterestVO;
import com.it.wecodeyou.interest.repository.IInterestMapper;
import com.it.wecodeyou.interest_list.model.Interest_ListVO;
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

	@Override
	public Integer countAnswer(String interestListAnswer) {
		return dao.countAnswer(interestListAnswer);
	}

	@Override
	public Integer countInterest() {
		return dao.countInterest();
	}

	@Override
	public String getAnswer(String interestListId) {
		return dao.getAnswer(interestListId);
	}

	@Override
	public List<Interest_ListVO> getAllIndex() {
		return dao.getAllIndex();
	}

	@Override
	public List<InterestReportVO> getInterestReportByIndex(String interestIndex) {
		return dao.getInterestReportByIndex(interestIndex);
	}

	@Override
	public List<String> getAllColumnName() {
		return dao.getAllColumnName();
	}

	@Override
	public List<String> getIndexLang() {
		return dao.getIndexLang();
	}

	@Override
	public List<String> getIndexPeriod() {
		return dao.getIndexPeriod();
	}

	@Override
	public List<String> getIndexGoal() {
		return dao.getIndexGoal();
	}

	@Override
	public List<String> getIndexFunnel() {
		return dao.getIndexFunnel();
	}

	@Override
	public List<String> getInterestsByType(String interestListType) {
		return dao.getInterestsByType(interestListType);
	}
	
}
