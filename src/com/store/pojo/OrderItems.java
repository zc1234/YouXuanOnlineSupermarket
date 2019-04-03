package com.store.pojo;

public class OrderItems {
	private int orderitemsID;
	private int goodsNumber;
	private char orderitemsStatus;
	private float priceSum;
	//订单项与订单:多对一
	private Order order;
	//订单项与商品:多对一
	private Goods goods;
	public int getOrderitemsID() {
		return orderitemsID;
	}
	public void setOrderitemsID(int orderitemsID) {
		this.orderitemsID = orderitemsID;
	}
	public int getGoodsNumber() {
		return goodsNumber;
	}
	public void setGoodsNumber(int goodsNumber) {
		this.goodsNumber = goodsNumber;
	}
	public char getOrderitemsStatus() {
		return orderitemsStatus;
	}
	public void setOrderitemsStatus(char orderitemsStatus) {
		this.orderitemsStatus = orderitemsStatus;
	}
	public float getPriceSum() {
		return priceSum;
	}
	public void setPriceSum(float priceSum) {
		this.priceSum = priceSum;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
}
