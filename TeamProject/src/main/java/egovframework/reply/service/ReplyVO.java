package egovframework.reply.service;

import java.sql.Date;

public class ReplyVO {
	private String id;
	private String rcontent;
	private Date rupdatedate;
	private Date ruploaddate;
	private int up;
	private int down;
	private int cno;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public Date getRupdatedate() {
		return rupdatedate;
	}
	public void setRupdatedate(Date rupdatedate) {
		this.rupdatedate = rupdatedate;
	}
	public Date getRuploaddate() {
		return ruploaddate;
	}
	public void setRuploaddate(Date ruploaddate) {
		this.ruploaddate = ruploaddate;
	}
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
	public int getDown() {
		return down;
	}
	public void setDown(int down) {
		this.down = down;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	
	
	
	
}
