package com.it.wecodeyou.episode.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.it.wecodeyou.episode.model.EpisodeVO;

public interface IEpisodeService {

	
	//강의내용 출력
	public ArrayList<EpisodeVO> getAllEpisode () throws SQLException;
	
	
	
}
