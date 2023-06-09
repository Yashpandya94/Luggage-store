package com.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
public class Store {
	

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int storeId;

	 @Column(nullable = false)
	private String  storeName ;

	
	private String  storePhoto ; 

	@Column(length=3000)
	private String  storeDescription ;

	@Column(nullable=false) 
	private String type ;
	
	@Column(nullable=false) 
	private String address ;
	
	@Column(nullable = false)
	private String country ; 
	
	@Column(nullable = false)
	private String city ;
	
	@Column(nullable = false)
	private String state;
	
	@Column(nullable = false)
	private long pinCode ;
	
	@Column(nullable = false)
	private double longitude ;
	
	@Column(nullable = false)
    private double latitude ;
	 
	 @OneToMany(mappedBy ="store")
	 private List<Orders> order ;
	 
	@OneToOne
    private StoreOwner storeowner   ;

	
	public Store() {
		
	}


	public Store( String storeName, String storePhoto, String storeDescription, String type, String address,
			String country, String city, String state, long pinCode, double longitude, double latitude, StoreOwner storeowner) {
		super();
		this.storeName = storeName;
		this.storePhoto = storePhoto;
		this.storeDescription = storeDescription;
		this.type = type;
		this.address = address;
		this.country = country;
		this.city = city;
		this.state = state;
		this.pinCode = pinCode;
		this.longitude = longitude;
		this.latitude = latitude;
		this.storeowner = storeowner;
	}

	
	public Store(int storeId, String storeName, String storePhoto, String storeDescription, String type, String address,
			String country, String city, String state, long pinCode, double longitude, double latitude,
			List<Orders> order, StoreOwner storeowner) {
		super();
		this.storeId = storeId;
		this.storeName = storeName;
		this.storePhoto = storePhoto;
		this.storeDescription = storeDescription;
		this.type = type;
		this.address = address;
		this.country = country;
		this.city = city;
		this.state = state;
		this.pinCode = pinCode;
		this.longitude = longitude;
		this.latitude = latitude;
		this.order = order;
		this.storeowner = storeowner;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStorePhoto() {
		return storePhoto;
	}

	public void setStorePhoto(String storePhoto) {
		this.storePhoto = storePhoto;
	}

	public String getStoreDescription() {
		return storeDescription;
	}

	public void setStoreDescription(String storeDescription) {
		this.storeDescription = storeDescription;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public long getPinCode() {
		return pinCode;
	}

	public void setPinCode(long pinCode) {
		this.pinCode = pinCode;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public List<Orders> getOrder() {
		return order;
	}

	public void setOrder(List<Orders> order) {
		this.order = order;
	}

	public StoreOwner getStoreowner() {
		return storeowner;
	}

	public void setStoreowner(StoreOwner storeowner) {
		this.storeowner = storeowner;
	} 
		
	 
	
 
	
}
