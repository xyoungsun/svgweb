package com.ceit.svg.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ceit.svg.entity.Graphic;

/**
 * graphic表的数据库操作
 * @author ceit
 *
 */
public class GraphicDaoImpl extends HibernateDaoSupport implements GraphicDao {
	

	/**
	 * 删除
	 */
	public void delete(Graphic g) {
		getHibernateTemplate().delete(g);
		
	}

	/**
	 * 更新
	 */
	public void update(Graphic g) {
		getHibernateTemplate().update(g);
		
	}

	/**
	 * 根据主键获取
	 */
	public Graphic getGarphicById(int id) {
		return getHibernateTemplate().get(Graphic.class, id);
	}

	/**
	 * 根据父id获取(父id为graphicgroup中的)
	 */
	public List<Graphic> getGraphicsByParentId(int parentId) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
