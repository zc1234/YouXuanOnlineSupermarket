package com.store.pojo;

import java.io.Serializable;

public class CartItems implements Serializable{
	private static final long serialVersionUID = 1L;
	private int cartID;
	private int goodsID;
	private int userID;
	private int number;
	private float priceSum;
	//购物车项-用户:多对一
	private User user;
	//购物车项-商品:多对一
	private Goods goods;
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getCartID() {
		return cartID;
	}
	public void setCartID(int cartID) {
		this.cartID = cartID;
	}
	public int getGoodsID() {
		return goodsID;
	}
	public void setGoodsID(int goodsID) {
		this.goodsID = goodsID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public float getPriceSum() {
		return priceSum;
	}
	public void setPriceSum(float priceSum) {
		this.priceSum = priceSum;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
}
