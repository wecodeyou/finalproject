package com.it.wecodeyou.atag.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.atag.repository.IAtagMapper;

@Service
public class AtagService implements IAtagService {
	
	@Autowired
	IAtagMapper dao;
	
	@Override
	public boolean insertAtag(ArrayList<Integer> sendTagList, Integer articleNo) throws SQLException {
		if(sendTagList.size() == 0) {
			return true;
		}
		for (int i = 0; i < sendTagList.size(); i++) {
			try {
				dao.insertAtag(sendTagList.get(i), articleNo);
				System.out.println("dao.insertAtag 실행: " + sendTagList.get(i));
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("dao Exeption!: " + sendTagList.get(i));
				return false;
			}
			
		}
		return true;
	}

}
