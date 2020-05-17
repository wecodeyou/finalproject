package com.it.wecodeyou.interest.sevice;

import java.sql.SQLException;
import java.util.List;

import com.it.wecodeyou.interest.model.InterestReportVO;
import com.it.wecodeyou.interest.model.InterestVO;
import com.it.wecodeyou.interest_list.model.Interest_ListVO;

public interface IInterestService {
	
	   // insert (설문조사 결과 저장)
	   public boolean insertInterest(InterestVO ivo) throws SQLException;
	   
	   // check (중복검사)
	   public Integer checkUserNo(Integer interestUserNo) throws SQLException;
	   
	   // update (유저 interest 필드 true로)
	   public boolean updateInterest(Integer userNo)  throws SQLException;
	   
	   // 대답 당 개수 구하기
		public Integer countAnswer(String interestListAnswer);
		
		// 총 설문조사 참여 인원 구하기
		public Integer countInterest();
		
		// id로 해당 항목 구하기
		public String getAnswer(String interestListId);
		
		// 모든 항목, id 구하기
		public List<Interest_ListVO> getAllIndex();
		
		// index별 개수 desc
		public List<InterestReportVO> getInterestReportByIndex(String interestIndex);
		
		// all column
		public List<String> getAllColumnName();

		// lang
		public List<String> getIndexLang();

		// period
		public List<String> getIndexPeriod();

		// goal
		public List<String> getIndexGoal();

		// funnel
		public List<String> getIndexFunnel();
		
		// 타입별 총 답들 리스트
		public List<String> getInterestsByType(String interestListType);
		
}
