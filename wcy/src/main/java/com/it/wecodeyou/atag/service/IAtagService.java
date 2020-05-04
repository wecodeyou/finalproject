package com.it.wecodeyou.atag.service;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IAtagService {
	//insert tag
		public boolean insertAtag(ArrayList<Integer> sendTagList, Integer productNo) throws SQLException ;
}
