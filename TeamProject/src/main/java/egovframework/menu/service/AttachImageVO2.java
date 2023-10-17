package egovframework.menu.service;

public class AttachImageVO2 {
	/* 경로 */
	private String uploadPath;

	/* uuid */
	private String uuid;

	/* 파일 이름 */
	private String fileName;

	private int mno;
	
	
	public AttachImageVO2() {
	}

	@Override
	public String toString() {
		return "AttachImageVO [uploadPath=" + uploadPath + ", uuid=" + uuid + ", fileName=" + fileName + ", mno="
				+ mno + "]";
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	
	
}
