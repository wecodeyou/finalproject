package com.it.wecodeyou.episode.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.episode.model.EpisodeVO;
import com.it.wecodeyou.episode.repository.IEpisodeMapper;

@Service
public class EpisodeService implements IEpisodeService {

	
	@Autowired
	IEpisodeMapper dao;
	
	@Override
	public ArrayList<EpisodeVO> getAllEpisode() throws SQLException {
		
		
		
		return dao.getAllEpisode();
	}
	
	

}
