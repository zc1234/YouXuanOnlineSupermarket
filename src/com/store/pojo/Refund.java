package com.store.pojo;

public class Refund {
	private int refundID;
	private char refundType;
	private char refundReason;
	private String refundDetail;
	private char refundStatus;
	private String refundResponse;
	private OrderItems orderitems;
	public int getRefundID() {
		return refundID;
	}
	public void setRefundID(int refundID) {
		this.refundID = refundID;
	}
	public char getRefundType() {
		return refundType;
	}
	public void setRefundType(char refundType) {
		this.refundType = refundType;
	}
	public char getRefundReason() {
		return refundReason;
	}
	public void setRefundReason(char refundReason) {
		this.refundReason = refundReason;
	}
	public String getRefundDetail() {
		return refundDetail;
	}
	public void setRefundDetail(String refundDetail) {
		this.refundDetail = refundDetail;
	}
	public char getRefundStatus() {
		return refundStatus;
	}
	public void setRefundStatus(char refundStatus) {
		this.refundStatus = refundStatus;
	}
	public String getRefundResponse() {
		return refundResponse;
	}
	public void setRefundResponse(String refundResponse) {
		this.refundResponse = refundResponse;
	}
	public OrderItems getOrderitems() {
		return orderitems;
	}
	public void setOrderitems(OrderItems orderitems) {
		this.orderitems = orderitems;
	}
}	
