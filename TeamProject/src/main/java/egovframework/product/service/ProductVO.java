package egovframework.product.service;

import java.util.Date;
import java.util.List;

import egovframework.product.service.AttachImageVO;

public class ProductVO {
	private int pno;
	private String pname;
	private int price;
	private String pcontent;
	private Date puploaddate;
	private String pcode;
	private int plike;
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;
	
	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}
	
	public int getPlike() {
		return plike;
	}
	public void setPlike(int plike) {
		this.plike = plike;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public Date getPuploaddate() {
		return puploaddate;
	}
	public void setPuploaddate(Date puploaddate) {
		this.puploaddate = puploaddate;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	
}
