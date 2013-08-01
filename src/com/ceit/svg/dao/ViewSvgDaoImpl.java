package com.ceit.svg.dao;



import java.sql.Blob;
import java.sql.SQLException;

import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ceit.svg.entity.Graphic;
import com.ceit.svg.hibernate.HibernateSessionUtil;

public class ViewSvgDaoImpl extends HibernateDaoSupport implements ViewSvgDao  {


	
	public Blob getSvgFileById(int id) {
		//HibernateSessionUtil.beginTransaction();
		Session session = HibernateSessionUtil.currentSession();
		Graphic sg = (Graphic)session.get(Graphic.class, id);
		
		return sg.getData();
	}

}
