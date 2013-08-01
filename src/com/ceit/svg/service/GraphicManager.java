package com.ceit.svg.service;

import java.io.InputStream;
import java.sql.SQLException;

import com.ceit.svg.entity.Graphic;

public interface GraphicManager {
	
	Graphic getGraphic(int id);
	
	/**
	 * 获取graphic中保存的svg文件
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	InputStream getSVGFileById(int id) throws SQLException;

}
