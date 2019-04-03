package com.store.pojo;

import java.util.Date;

public class Comment {
	private int commentID;
	private int score;
	private int goodsID;
	private String commenttext;
	private Date commentCreatetime;
	//用户与评论:一对多
	private User user;
	//订单项与评论:一对一
	private OrderItems orderItems;
	private Goods goods;
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getGoodsID() {
		return goodsID;
	}
	public void setGoodsID(int goodsID) {
		this.goodsID = goodsID;
	}
	public String getCommenttext() {
		return commenttext;
	}
	public void setCommenttext(String commenttext) {
		this.commenttext = commenttext;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public OrderItems getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(OrderItems orderItems) {
		this.orderItems = orderItems;
	}
	public Date getCommentCreatetime() {
		return commentCreatetime;
	}
	public void setCommentCreatetime(Date commentCreatetime) {
		this.commentCreatetime = commentCreatetime;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
}
