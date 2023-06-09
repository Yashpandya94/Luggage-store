package com.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import com.entities.Store;
import com.entities.StoreOwner;

public class StoreOwnerdao {

	 public SessionFactory factory ;
	 public StoreOwnerdao(SessionFactory factory){
		  this.factory = factory ; 
	 } 
	 
	 public boolean saveStoreowner(String name,long phone,String email,String encryptedPassword){ 
		  boolean issaved = false ;
		 try {
			  StoreOwner st = new StoreOwner(name,phone,email,encryptedPassword) ;
			 Session session = factory.openSession(); 
			 Transaction tx = session.beginTransaction() ; 
			 session.save(st) ; 
			 tx.commit(); 
			 session.close();
			 issaved = true ;
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			issaved = false ;
		} 
		 return issaved ;
	 } 
	 
	 public StoreOwner getcustomerByphone(long phn){
		 Session s  = this.factory.openSession();
		  Query query = s.createQuery("from StoreOwner as c where c.keeperphone = :e");
		  query.setParameter("e", phn) ;
		  StoreOwner cus = (StoreOwner) query.list().get(0);
		  return cus ;
	 }
	 
}
