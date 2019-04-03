package com.store.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Goods {
	private int goodsID;
	private String goodsName;
	private String goodsImg;
	private float goodsPrice;
	private int goodsType;
	private String goodsDetail;
	private Date goodsCreatetime;
	private int goodsStock;
	private char goodsStatus;
	private float goodsOriginalPrice;
	private int goodsScore;
	//商品与订单项:一对多
	private List<OrderItems> orderitems = new ArrayList<>();
	public int getGoodsID() {
		return goodsID;
	}
	public void setGoodsID(int goodsID) {
		this.goodsID = goodsID;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	public float getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(int goodsType) {
		this.goodsType = goodsType;
	}
	public String getGoodsDetail() {
		return goodsDetail;
	}
	public void setGoodsDetail(String goodsDetail) {
		this.goodsDetail = goodsDetail;
	}
	public Date getGoodsCreatetime() {
		return goodsCreatetime;
	}
	public void setGoodsCreatetime(Date goodsCreatetime) {
		this.goodsCreatetime = goodsCreatetime;
	}
	public List<OrderItems> getOrderitems() {
		return orderitems;
	}
	public void setOrderitems(List<OrderItems> orderitems) {
		this.orderitems = orderitems;
	}
	public int getGoodsStock() {
		return goodsStock;
	}
	public void setGoodsStock(int goodsStock) {
		this.goodsStock = goodsStock;
	}
	public char getGoodsStatus() {
		return goodsStatus;
	}
	public void setGoodsStatus(char goodsStatus) {
		this.goodsStatus = goodsStatus;
	}
	public float getGoodsOriginalPrice() {
		return goodsOriginalPrice;
	}
	public void setGoodsOriginalPrice(float goodsOriginalPrice) {
		this.goodsOriginalPrice = goodsOriginalPrice;
	}
	public int getGoodsScore() {
		return goodsScore;
	}
	public void setGoodsScore(int goodsScore) {
		this.goodsScore = goodsScore;
	}
}
