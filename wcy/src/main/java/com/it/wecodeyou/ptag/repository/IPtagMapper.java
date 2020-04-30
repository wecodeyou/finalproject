package com.it.wecodeyou.ptag.repository;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

public interface IPtagMapper {
	
	public void insertPtag(@Param("pTagNo") Integer pTagNo, @Param("pProductNo") Integer pProductNo) throws SQLException;
	
}
