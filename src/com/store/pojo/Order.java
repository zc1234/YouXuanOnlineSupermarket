package com.store.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Order {
	private int orderID;
	private int orderNumber;
	private Date orderCreatetime;
	private int remainingTime;
	private String orderNote;
	private char orderStatus;
	private float priceSum;
	private char delivery;
	private Date startTime;
	private Date endTime;
	//订单与用户:多对一
	private User user;
	//订单与订单项:一对多
	private List<OrderItems> orderitems = new ArrayList<>();
	//订单与配送地址:多对一
	private Address address = new Address();
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public Date getOrderCreatetime() {
		return orderCreatetime;
	}
	public void setOrderCreatetime(Date orderCreatetime) {
		this.orderCreatetime = orderCreatetime;
	}
	public int getRemainingTime() {
		return remainingTime;
	}
	public void setRemainingTime(int remainingTime) {
		this.remainingTime = remainingTime;
	}
	public String getOrderNote() {
		return orderNote;
	}
	public void setOrderNote(String orderNote) {
		this.orderNote = orderNote;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<OrderItems> getOrderitems() {
		return orderitems;
	}
	public void setOrderitems(List<OrderItems> orderitems) {
		this.orderitems = orderitems;
	}
	public char getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(char orderStatus) {
		this.orderStatus = orderStatus;
	}
	public float getPriceSum() {
		return priceSum;
	}
	public void setPriceSum(float priceSum) {
		this.priceSum = priceSum;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public char getDelivery() {
		return delivery;
	}
	public void setDelivery(char delivery) {
		this.delivery = delivery;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
}
