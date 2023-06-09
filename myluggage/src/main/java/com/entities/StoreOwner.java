package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class StoreOwner {

	@Id 
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int storeownerID ; 
	
	@Column(nullable = false)
	private String keeperName ;
	
	@Column(nullable = false)
	private long keeperphone ;
	
	@Column(nullable = false)
	private String keeperemail ; 
	
	@Column(nullable = false)
	private String keeperpassword ;
	 
  
	public int getStoreownerID() {
		return storeownerID;
	}

	public void setStoreownerID(int storeownerID) {
		this.storeownerID = storeownerID;
	}

	public String getKeeperName() {
		return keeperName;
	}

	public void setKeeperName(String keeperName) {
		this.keeperName = keeperName;
	}

	public long getKeeperphone() {
		return keeperphone;
	}

	public void setKeeperphone(long keeperphone) {
		this.keeperphone = keeperphone;
	}

	public String getKeeperemail() {
		return keeperemail;
	}

	public void setKeeperemail(String keeperemail) {
		this.keeperemail = keeperemail;
	}

	public String getKeeperpassword() {
		return keeperpassword;
	}

	public void setKeeperpassword(String keeperpassword) {
		this.keeperpassword = keeperpassword;
	}
     
	public StoreOwner() {
		
	} 
	
  	public StoreOwner(String keeperName, long keeperphone, String keeperemail, String keeperpassword) {
		super();
		
		this.keeperName = keeperName;
		this.keeperphone = keeperphone;
		this.keeperemail = keeperemail;
		this.keeperpassword = keeperpassword;
		
	}
	
	public StoreOwner(int storeownerID, String keeperName, long keeperphone, String keeperemail, String keeperpassword	) {
		super();
		this.storeownerID = storeownerID;
		this.keeperName = keeperName;
		this.keeperphone = keeperphone;
		this.keeperemail = keeperemail;
		this.keeperpassword = keeperpassword;
	
	}
	
	
	
	
	
	
	
}
