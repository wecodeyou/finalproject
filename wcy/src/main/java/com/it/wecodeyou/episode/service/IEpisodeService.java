package com.it.wecodeyou.episode.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.it.wecodeyou.episode.model.EpisodeVO;

public interface IEpisodeService {

	
	//product_no 받아서  해당 product 강의내용 출력
	public ArrayList<EpisodeVO> getAllEpisode1(Integer productNo) throws SQLException;
	
	//episode_source 받아서 해당 강의 내용 출력
	public ArrayList<EpisodeVO> getAllEpisode2(String episodeSource) throws SQLException;
	
	public Integer getProductNo(Integer episodeOnNo) throws SQLException;

	public Integer insertEpisode(EpisodeVO evo) throws SQLException;

	public Integer getOnNo(Integer productNo) throws SQLException;
	
}
