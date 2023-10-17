package egovframework.menu.service;

import java.util.Date;
import java.util.List;

public class MenuVO {

	private int mno;
	private Date mUploadDate;
	private Date mUpdateDate;
	private int myear;
	private int month;
	private int mlike;
	/* 이미지 정보 */
	private List<AttachImageVO2> imageList;
	
	public List<AttachImageVO2> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO2> imageList) {
		this.imageList = imageList;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public Date getmUploadDate() {
		return mUploadDate;
	}

	public void setmUploadDate(Date mUploadDate) {
		this.mUploadDate = mUploadDate;
	}

	public Date getmUpdateDate() {
		return mUpdateDate;
	}

	public void setmUpdateDate(Date mUpdateDate) {
		this.mUpdateDate = mUpdateDate;
	}

	public int getMyear() {
		return myear;
	}

	public void setMyear(int myear) {
		this.myear = myear;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getMlike() {
		return mlike;
	}

	public void setMlike(int mlike) {
		this.mlike = mlike;
	}
	
	

	
}