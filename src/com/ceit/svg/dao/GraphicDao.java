package com.ceit.svg.dao;

import java.util.List;

import com.ceit.svg.entity.Graphic;

/**
 * 对于graphic表的操作
 * @author ceit
 *
 */
public interface GraphicDao {
	
	/**
	 * 删
	 * @param g
	 */
	void delete(Graphic g);
	
	/**
	 * 更新
	 * @param g
	 */
	void update(Graphic g);
	
	/**
	 * 获得Graohic对象
	 * @param id
	 * @return
	 */
	Graphic getGarphicById(int id);
	
	/**
	 * 获得一组记录
	 * @param parentId
	 * @return
	 */
	List<Graphic> getGraphicsByParentId(int parentId);
	
	

}
