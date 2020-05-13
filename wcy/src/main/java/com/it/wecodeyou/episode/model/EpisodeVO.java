package com.it.wecodeyou.episode.model;

public class EpisodeVO {

	private Integer episodeNo;
	private Integer episodeOnNo;
	private Integer episodeRowNo;
	private String episodeName;
	private String episodeSource;
	
	
	
	public EpisodeVO() {}
	
	public EpisodeVO(Integer episodeNo, Integer episodeOnNo, Integer episodeRowNo, String episodeName,
			String episodeSource) {
		super();
		this.episodeNo = episodeNo;
		this.episodeOnNo = episodeOnNo;
		this.episodeRowNo = episodeRowNo;
		this.episodeName = episodeName;
		this.episodeSource = episodeSource;
	}
	public Integer getEpisodeNo() {
		return episodeNo;
	}
	public void setEpisodeNo(Integer episodeNo) {
		this.episodeNo = episodeNo;
	}
	public Integer getEpisodeOnNo() {
		return episodeOnNo;
	}
	public void setEpisodeOnNo(Integer episodeOnNo) {
		this.episodeOnNo = episodeOnNo;
	}
	public Integer getEpisodeRowNo() {
		return episodeRowNo;
	}
	public void setEpisodeRowNo(Integer episodeRowNo) {
		this.episodeRowNo = episodeRowNo;
	}
	public String getEpisodeName() {
		return episodeName;
	}
	public void setEpisodeName(String episodeName) {
		this.episodeName = episodeName;
	}
	public String getEpisodeSource() {
		return episodeSource;
	}
	public void setEpisodeSource(String episodeSource) {
		this.episodeSource = episodeSource;
	}
	

	
	
	
	
}
