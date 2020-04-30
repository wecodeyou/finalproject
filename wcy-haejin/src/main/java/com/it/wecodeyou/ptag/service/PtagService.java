package com.it.wecodeyou.ptag.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.ptag.repository.IPtagMapper;

@Service
public class PtagService implements IPtagService{
	
	@Autowired
	IPtagMapper dao;

	@Override
	public boolean insertPtag(ArrayList<String> sendTagList, Integer productNo) throws SQLException {
		
		for (int i = 0; i < sendTagList.size(); i++) {
			Integer tagNo = Integer.parseInt(sendTagList.get(i));
			System.out.println(tagNo);
			
			try {
				dao.insertPtag(tagNo, productNo);
				System.out.println(tagNo + "dao.insertPtag 실행");
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(tagNo + "dao Exeption!");
				return false;
			}
			
		}
		return true;
		
	}

	
	
}
