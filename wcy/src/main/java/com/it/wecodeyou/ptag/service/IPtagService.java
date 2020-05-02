package com.it.wecodeyou.ptag.service;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IPtagService {
	
	//insert tag
	public boolean insertPtag(ArrayList<Integer> sendTagList, Integer productNo) throws SQLException ;

}
