package com.ceit.svg.hibernate;
import java.io.IOException;  
  
  
import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;   
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;

import xe.HibernateUtil_bak;

  
public class HibernateSessionFilter implements Filter {    
	private static final Logger log = Logger.getLogger(SessionFactory.class) ;
      
     
    

    protected FilterConfig filterConfig = null;

    public void init(FilterConfig filterConfig)throws ServletException{
	this.filterConfig = filterConfig;
    }
    
    public void destroy(){
        this.filterConfig = null;
    }    

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
	throws IOException, ServletException {
        try{
            chain.doFilter(request, response);
        }
        finally{
            try{
                HibernateSessionUtil.commitTransaction();
            }catch (Exception e){
                HibernateSessionUtil.rollbackTransaction();
            }finally{
            	HibernateSessionUtil.closeSession();
            }   
        }

    }
    
}  