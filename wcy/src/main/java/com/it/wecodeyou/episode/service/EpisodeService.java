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
	public ArrayList<EpisodeVO> getAllEpisode1(Integer productNo) throws SQLException {
		
		return dao.getAllEpisode1(productNo);
	}

	@Override
	public ArrayList<EpisodeVO> getAllEpisode2(String episodeSource) throws SQLException {
		
		return dao.getAllEpisode2(episodeSource);
	}

	@Override
	public Integer getProductNo(Integer episodeOnNo) throws SQLException {
		// TODO Auto-generated method stub
		return dao.getProductNo(episodeOnNo);
	}

	@Override
	public Integer insertEpisode(EpisodeVO evo) throws SQLException {
		// TODO Auto-generated method stub
		return dao.insertEpisode(evo);
	}

	@Override
	public Integer getOnNo(Integer productNo) throws SQLException {
		// TODO Auto-generated method stub
		return dao.getOnNo(productNo);
	}
	
	
	
	
	

}
