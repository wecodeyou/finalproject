package com.it.wecodeyou.atag.repository;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

public interface IAtagMapper {
	
	public void insertAtag(@Param("aTagNo") Integer aTagNo, @Param("aArticleNo") Integer aArticleNo) throws SQLException;

}
