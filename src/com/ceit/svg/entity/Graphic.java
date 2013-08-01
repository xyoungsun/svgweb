package com.ceit.svg.entity;

import java.sql.Blob;

/**
 * 
 * 
 *
 */

public class Graphic {
	// create table GRAPHIC
	// (
	// ID NUMBER(10) not null,
	// NAME VARCHAR2(40) not null,
	// PARENTID NUMBER(10) not null,
	// DATA BLOB,
	// BGBMP BLOB,
	// DISPINDEX NUMBER(10),
	// AUTHORIZES VARCHAR2(2000),
	// IPS VARCHAR2(1000),
	// GRAPHICSIZE VARCHAR2(20),
	// CANVASSIZE VARCHAR2(20),
	// ISNEW NUMBER(1),
	// CITYID NUMBER(10),
	// UPDATEDATE VARCHAR2(100)
	// )

	private Integer id;
	private String name;
	private Integer parentId;
	private Blob data;
	private Blob bgbmp;
	private Integer dispIndex;
	private String authorizes;
	private String ips;
	private String graphicSize;
	private String canvasSize;
	private Integer isNew;
	private Integer cityId;
	private String updateDate;

	public Integer getId() {
		return id;
	}

	private void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Blob getData() {
		return data;
	}

	public void setData(Blob data) {
		this.data = data;
	}

	public Blob getBgbmp() {
		return bgbmp;
	}

	public void setBgbmp(Blob bgbmp) {
		this.bgbmp = bgbmp;
	}

	public Integer getDispIndex() {
		return dispIndex;
	}

	public void setDispIndex(Integer dispIndex) {
		this.dispIndex = dispIndex;
	}

	public String getAuthorizes() {
		return authorizes;
	}

	public void setAuthorizes(String authorizes) {
		this.authorizes = authorizes;
	}

	public String getIps() {
		return ips;
	}

	public void setIps(String ips) {
		this.ips = ips;
	}

	public String getGraphicSize() {
		return graphicSize;
	}

	public void setGraphicSize(String grahicSize) {
		this.graphicSize = grahicSize;
	}

	public String getCanvasSize() {
		return canvasSize;
	}

	public void setCanvasSize(String canvasSize) {
		this.canvasSize = canvasSize;
	}

	public Integer getIsNew() {
		return isNew;
	}

	public void setIsNew(Integer isNew) {
		this.isNew = isNew;
	}

	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

}
