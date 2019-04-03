package com.store.pojo;

public class Safe {
	private int safeID;
	private char question1;
	private String answer1;
	private char question2;
	private String answer2;
	private String identity;
	private User user;
	public int getSafeID() {
		return safeID;
	}
	public void setSafeID(int safeID) {
		this.safeID = safeID;
	}
	public char getQuestion1() {
		return question1;
	}
	public void setQuestion1(char question1) {
		this.question1 = question1;
	}
	public String getAnswer1() {
		return answer1;
	}
	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}
	public char getQuestion2() {
		return question2;
	}
	public void setQuestion2(char question2) {
		this.question2 = question2;
	}
	public String getAnswer2() {
		return answer2;
	}
	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
