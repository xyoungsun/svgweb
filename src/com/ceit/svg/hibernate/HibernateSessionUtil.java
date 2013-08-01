package com.ceit.svg.hibernate;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class HibernateSessionUtil 
{
	
	private static final Logger log = Logger.getLogger(SessionFactory.class) ;
	
	
    public static final ThreadLocal tLocalsess = new ThreadLocal();

    public static final ThreadLocal tLocaltx = new ThreadLocal();

    
    private static final SessionFactory sessionFactory = buildSessionFactory();

	private static SessionFactory buildSessionFactory() {
		try {
			// Create the SessionFactory from hibernate.cfg.xml
			return new Configuration().configure().buildSessionFactory();
		} catch (Throwable ex) {
			// Make sure you log the exception, as it might be swallowed
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}
    
    /*
     * getting the thread-safe session for using
     */
    public static Session currentSession(){
        Session session = (Session) tLocalsess.get();

        //open a new one, if none can be found.
        try{
            if (session == null){
                session = openSession();
                tLocalsess.set(session);
            }
        }catch (HibernateException e){
            log.error("无法获取Session对象！");
        }
        return session;
    }

    /*
     * closing the thread-safe session
     */
    public static void closeSession(){

        Session session = (Session) tLocalsess.get();
        tLocalsess.set(null);
        try{
            if (session != null && session.isOpen()){
                session.close();
            }

        }catch (HibernateException e){
            log.error("关闭Session出错！");
        }
    }

    /*
     * begin the transaction
     */
    public static void beginTransaction(){
        Transaction tx = (Transaction) tLocaltx.get();
        try{
            if (tx == null){
                tx = currentSession().beginTransaction();
                tLocaltx.set(tx);
            }
        }catch (HibernateException e){
            log.error("开始Transaction出错！");
        }
    }

    /*
     * close the transaction
     */
    public static void commitTransaction(){
        Transaction tx = (Transaction) tLocaltx.get();
        try{
            if (tx != null && !tx.wasCommitted() && !tx.wasRolledBack())
                tx.commit();
            tLocaltx.set(null);
        }catch (HibernateException e){
            log.error("提交Transaction出错！");
        }
    }

    /*
     * for rollbacking
     */
    public static void rollbackTransaction(){
        Transaction tx = (Transaction) tLocaltx.get();
        try{
            tLocaltx.set(null);
            if (tx != null && !tx.wasCommitted() && !tx.wasRolledBack()){
                tx.rollback();
            }
        }catch (HibernateException e){
            log.error("回滚Transaction出错！");
        }
    }

    private static Session openSession() throws HibernateException{
        return sessionFactory.openSession();
    }

    
}