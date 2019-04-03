package com.store.pojo;

public class Address {
	private int addressID;
	private String addressUserName;
	private String phoneNumber;
	private String address;
	private char isDefault;
	//用户与地址:一对多
	private User user;
	public int getAddressID() {
		return addressID;
	}
	public void setAddressID(int addressID) {
		this.addressID = addressID;
	}
	public String getAddressUserName() {
		return addressUserName;
	}
	public void setAddressUserName(String addressUserName) {
		this.addressUserName = addressUserName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public char getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(char isDefault) {
		this.isDefault = isDefault;
	}
}
