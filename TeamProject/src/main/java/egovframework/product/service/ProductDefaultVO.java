package egovframework.product.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class ProductDefaultVO implements Serializable{

	private static final long serialVersionUID = -858838578081269359L;
	
	/** 현재페이지 */
	private int viewPage =1;

	/** 페이지갯수 */
	private int pageUnit = 8;

	/** 페이지사이즈 */
	private int pageSize = 10;

	/** startIndex */
	private int startIndex = 1;

	/** endIndex */
	private int endIndex = 10;

	/** recordCountPerPage */
	private int recordCountPerPage = 10;
	

	private String searchCondition;
	private String searchKeyword;
	

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}


	public int getViewPage() {
		return viewPage;
	}

	public void setViewPage(int viewPage) {
		this.viewPage =viewPage;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
