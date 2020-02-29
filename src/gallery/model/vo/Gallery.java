package gallery.model.vo;

import java.sql.Date;

public class Gallery {
	private String glCode;
	private String glTitle;
	private String glContent;
	private Date glDate;
	private int glReadCnt;
	private String glStatus;
	private String userCode;
	
	public Gallery() {}

	public Gallery(String glCode, String glTitle, String glContent, Date glDate, int glReadCnt, String glStatus,
			String userCode) {
		super();
		this.glCode = glCode;
		this.glTitle = glTitle;
		this.glContent = glContent;
		this.glDate = glDate;
		this.glReadCnt = glReadCnt;
		this.glStatus = glStatus;
		this.userCode = userCode;
	}

	public String getGlCode() {
		return glCode;
	}

	public void setGlCode(String glCode) {
		this.glCode = glCode;
	}

	public String getGlTitle() {
		return glTitle;
	}

	public void setGlTitle(String glTitle) {
		this.glTitle = glTitle;
	}

	public String getGlContent() {
		return glContent;
	}

	public void setGlContent(String glContent) {
		this.glContent = glContent;
	}

	public Date getGlDate() {
		return glDate;
	}

	public void setGlDate(Date glDate) {
		this.glDate = glDate;
	}

	public int getGlReadCnt() {
		return glReadCnt;
	}

	public void setGlReadCnt(int glReadCnt) {
		this.glReadCnt = glReadCnt;
	}

	public String getGlStatus() {
		return glStatus;
	}

	public void setGlStatus(String glStatus) {
		this.glStatus = glStatus;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	@Override
	public String toString() {
		return "Gallery [glCode=" + glCode + ", glTitle=" + glTitle + ", glContent=" + glContent + ", glDate=" + glDate
				+ ", glReadCnt=" + glReadCnt + ", glStatus=" + glStatus + ", userCode=" + userCode + "]";
	}
	
	
	
}
