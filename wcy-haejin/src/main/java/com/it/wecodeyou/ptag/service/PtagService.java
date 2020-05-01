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
	public boolean insertPtag(ArrayList<Integer> sendTagList, Integer productNo) throws SQLException {
		
		for (int i = 0; i < sendTagList.size(); i++) {
			try {
				dao.insertPtag(sendTagList.get(i), productNo);
				System.out.println("dao.insertPtag 실행: " + sendTagList.get(i));
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("dao Exeption!: " + sendTagList.get(i));
				return false;
			}
			
		}
		return true;
		
	}

	
	
}
