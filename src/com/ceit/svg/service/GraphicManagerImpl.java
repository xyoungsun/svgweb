package com.ceit.svg.service;

import java.io.InputStream;
import java.sql.SQLException;

import com.ceit.svg.dao.GraphicDao;
import com.ceit.svg.entity.Graphic;

public class GraphicManagerImpl implements GraphicManager {
	
	private GraphicDao graphicDao;
	
	
	

	public GraphicDao getGraphicDao() {
		return graphicDao;
	}

	public void setGraphicDao(GraphicDao graphicDao) {
		this.graphicDao = graphicDao;
	}

	/**
	 * 获取graphic对象
	 */
	public Graphic getGraphic(int id) {
		return graphicDao.getGarphicById(id);
	}

	/**
	 * 获取svg文件
	 * @throws SQLException 
	 */
	public InputStream getSVGFileById(int id) throws SQLException {
		return graphicDao.getGarphicById(id).getData().getBinaryStream();
	}

}
