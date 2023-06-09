package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Store;
import com.entities.StoreOwner;

public class Storedao {

	public SessionFactory factory ;
	 public Storedao(SessionFactory factory){
		  this.factory = factory ; 
		  
	 }
		  public boolean saveStore(String storeName, String storePhoto, String storeDescription, String type, String address,
					String country, String city, String state, long pinCode, double longitude, double latitude, StoreOwner storeowner){ 
			  boolean issaved = false ;
			 try {
				 Store store = new Store(storeName,storePhoto,storeDescription,type,address,country,city,state,pinCode,longitude,latitude,storeowner);
				  
				 Session session = factory.openSession(); 
				 Transaction tx = session.beginTransaction() ; 
				 session.save(store) ; 
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
		  
		    
	        /* 
	         * public Employee getempbyId(int id) {
   	 Session s  = this.factory.openSession();
	  Query query = s.createQuery("from Employee as e where e.id = :e");
	  query.setParameter("e", id) ;
	  Employee emp = (Employee) query.list().get(0);
	  return emp ;
    } 
	         * */ 
		  
		     public Store getstorebyId(int id) {
		    	 Session s  = this.factory.openSession();
		   	  Query query = s.createQuery("from Store as e where e.id = :e");
		   	  query.setParameter("e", id) ;
		   	  Store store = (Store) query.list().get(0);
		   	  return store ;
		    	 
		     }
		  
		    public List<Store> getstoreBYcity(String city){
		    	List<Store> list = new ArrayList<Store>() ; 
		    	
		    	try {
		    	Session session = factory.openSession() ;
		    	Query query = session.createQuery("FROM Store as s WHERE s.city LIKE :e") ;
		    	query.setParameter("e", "%"+city+"%"); 
		    	 list = query.list() ;
		    	}
		    	catch(HibernateException e) {
		    		e.printStackTrace();
		    	}
		    	return list ;
		    }
	 } 

