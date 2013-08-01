package com.ceit.svg.display.action;

import java.io.InputStream;
import java.io.StringBufferInputStream;

import com.ceit.svg.dao.ViewSvgDao;
import com.ceit.svg.dao.ViewSvgDaoImpl;
import com.ceit.svg.service.GraphicManager;
import com.opensymphony.xwork2.ActionSupport;

public class ViewSvgAction extends ActionSupport {
	
	/**
	 * 返回的文件内容
	 */
	private InputStream inputStream; 
	/*private ViewSvgDao viewSvgDao = new ViewSvgDaoImpl();
	
	

	public InputStream getInputStream() {
		return inputStream;
	}

	public String execute() throws Exception {
		System.out.println("调用ViewSvgAction");
		System.out.println();
		return SUCCESS;
	}
	
	public String getSvgFile() throws Exception {
		System.out.println("调用ViewSvgAction_getSvgFile()");
		viewSvgDao.getSvgFileById(47);
		inputStream = viewSvgDao.getSvgFileById(47).getBinaryStream(); 
		return SUCCESS;
	}*/
	/**
	 * 服务类
	 */
	private GraphicManager graphicManager;

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public GraphicManager getGraphicManager() {
		return graphicManager;
	}

	public void setGraphicManager(GraphicManager graphicManager) {
		this.graphicManager = graphicManager;
	}
	
	public String getSvgFile() throws Exception {
		inputStream = graphicManager.getSVGFileById(47);
		return SUCCESS;
	}
	
	
	
	

}
