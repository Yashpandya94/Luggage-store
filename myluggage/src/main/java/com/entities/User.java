package com.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;



@Entity
public class User {

	@Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int userId ;

	 @Column(nullable = false)
	private String userName ;

	 @Column(nullable = false)
	private String userEmail ;

	 @Column(nullable = false)
	private long userPhone ;

	 @Column(nullable = false)
	private String userPassword ; 

	 @Column(nullable = false)
	private String userAddress ; 

	 @Column(nullable = false)
	private String userType ;
	 
	
	 @OneToMany(mappedBy ="user")
	 private List<Orders> order ;
	 
    public List<Orders> getOrder() {
		return order;
	}


	public void setOrder(List<Orders> order) {
		this.order = order;
	}

	public User() {
		
	}

  
	public User(int userId,String userName, String userEmail, long userPhone, String userPassword, String userAddress,
			String userType) {
		super();
		this.userId = userId ;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userPassword = userPassword;
		this.userAddress = userAddress;
		this.userType = userType;
	}

   
	public User(String userName, String userEmail, long userPhone, String userPassword, String userAddress,
			String userType) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userPassword = userPassword;
		this.userAddress = userAddress;
		this.userType = userType;
	}

    public int getUserId() {
    	return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public long getUserPhone() {
		return userPhone;
	}


	public void setUserPhone(long userPhone) {
		this.userPhone = userPhone;
	}


	public String getUserPassword() {
		return userPassword;
	}


	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}


	public String getUserAddress() {
		return userAddress;
	}


	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}


	public String getUserType() {
		return userType;
	}


	public void setUserType(String userType) {
		this.userType = userType;
	} 
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPhone="
				+ userPhone + ", userPassword=" + userPassword + ", userAddress=" + userAddress + ", userType="
				+ userType + "]";
	}

}
