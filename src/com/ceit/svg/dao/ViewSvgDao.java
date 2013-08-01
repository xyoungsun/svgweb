package com.ceit.svg.dao;

import java.io.InputStream;
import java.sql.Blob;

public interface ViewSvgDao {
	
	public Blob getSvgFileById(int id);
	

}
