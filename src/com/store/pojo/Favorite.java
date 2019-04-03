package com.store.pojo;

public class Favorite {
	private int favoriteID;
	private User user;
	private Goods goods;
	private float price;
	private int monthSale;
	private float avgPoint;
	public int getFavoriteID() {
		return favoriteID;
	}
	public void setFavoriteID(int favoriteID) {
		this.favoriteID = favoriteID;
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
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getMonthSale() {
		return monthSale;
	}
	public void setMonthSale(int monthSale) {
		this.monthSale = monthSale;
	}
	public float getAvgPoint() {
		return avgPoint;
	}
	public void setAvgPoint(float avgPoint) {
		this.avgPoint = avgPoint;
	}
}
