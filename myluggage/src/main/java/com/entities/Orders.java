package com.entities;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;



@Entity
public class Orders {

	
	@Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int orderId ;

	@ManyToOne   
	private User user ;

	@ManyToOne
	private Store store;

	private Date orderDate ;

	private Date bookingDate  ; 

	private int orderQuantity ;

	private int orderDuration ;

	private String orderPhoto ; 
	
	private double billAmount ;

	
	public Orders(int orderId, User user, Store store, Date orderDate, Date bookingDate, int orderQuantity,
			int orderDuration, String orderPhoto, double billAmount) {
		super();
		this.orderId = orderId;
		this.user = user;
		this.store = store;
		this.orderDate = orderDate;
		this.bookingDate = bookingDate;
		this.orderQuantity = orderQuantity;
		this.orderDuration = orderDuration;
		this.orderPhoto = orderPhoto;
		this.billAmount = billAmount;
	}

	public Orders( User user, Store store, Date orderDate, Date bookingDate, int orderQuantity,
			int orderDuration, String orderPhoto, double billAmount) {
		super();
		this.user = user;
		this.store = store;
		this.orderDate = orderDate;
		this.bookingDate = bookingDate;
		this.orderQuantity = orderQuantity;
		this.orderDuration = orderDuration;
		this.orderPhoto = orderPhoto;
		this.billAmount = billAmount;
	}
		
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public int getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public int getOrderDuration() {
		return orderDuration;
	}

	public void setOrderDuration(int orderDuration) {
		this.orderDuration = orderDuration;
	}

	public String getOrderPhoto() {
		return orderPhoto;
	}

	public void setOrderPhoto(String orderPhoto) {
		this.orderPhoto = orderPhoto;
	}

	public double getBillAmount() {
		return billAmount;
	}

	public void setBillAmount(double billAmount) {
		this.billAmount = billAmount;
	}
	
	
}
