package egovframework.compl.service;

import java.sql.Date;

public class ComplVO {

	private int cno;
	private String ctitle;
	private String id;
	private String ccontent;
	private int view;
	private Date cuploaddate;
	private Date cupdatedate;
	private boolean secret;

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public Date getCuploaddate() {
		return cuploaddate;
	}

	public void setCuploaddate(Date cuploaddate) {
		this.cuploaddate = cuploaddate;
	}

	public Date getCupdatedate() {
		return cupdatedate;
	}

	public void setCupdatedate(Date cupdatedate) {
		this.cupdatedate = cupdatedate;
	}

	public boolean isSecret() {
		return secret;
	}

	public void setSecret(boolean secret) {
		this.secret = secret;
	}

	

}
