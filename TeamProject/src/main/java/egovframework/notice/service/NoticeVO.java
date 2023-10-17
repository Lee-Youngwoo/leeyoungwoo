package egovframework.notice.service;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {

	private int nno;
	private String ntitle;
	private String ncontent;
	private Date nuploaddate;
	private int view;
	private String filename;
	private MultipartFile uploadfile;
	
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public Date getNuploaddate() {
		return nuploaddate;
	}
	public void setNuploaddate(Date nuploaddate) {
		this.nuploaddate = nuploaddate;
	}
	
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	
	
	
}
