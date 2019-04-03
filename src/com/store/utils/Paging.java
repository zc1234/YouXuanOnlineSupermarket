package com.store.utils;

import java.util.List;

public class Paging<T> {
	private List<T> list;
	private int totalPages;		//总页数
	private int currentPage;	//当前页数
	private int pageSize;		//每页显示记录数
	private int totalRecords;	//总记录数
	private int index;
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
		int pages = this.totalRecords%getPageSize()==0?this.totalRecords/getPageSize():this.totalRecords/getPageSize()+1;
		setTotalPages(pages);
	}
	public int getPreviousPage() {
		if(getCurrentPage()<=1) {
			return 1;
		}	
		return getCurrentPage()-1;
	}
	public int getNextPage() {
		if(getCurrentPage()>=getTotalPages()) {
			return getTotalPages();
		}	
		return getCurrentPage()+1;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
}
