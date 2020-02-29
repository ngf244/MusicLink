package community.model.vo;

import java.sql.Date;

public class Community {
	private String cmCode;
	private String cmTitle;
	private String cmContent;
	private Date cmDate;
	private int cmReadCnt;
	private String cmStatus;
	private String userCode;
	
	public Community() {}

	public Community(String cmCode, String cmTitle, String cmContent, Date cmDate, int cmReadCnt, String cmStatus,
			String userCode) {
		super();
		this.cmCode = cmCode;
		this.cmTitle = cmTitle;
		this.cmContent = cmContent;
		this.cmDate = cmDate;
		this.cmReadCnt = cmReadCnt;
		this.cmStatus = cmStatus;
		this.userCode = userCode;
	}

	public String getCmCode() {
		return cmCode;
	}

	public void setCmCode(String cmCode) {
		this.cmCode = cmCode;
	}

	public String getCmTitle() {
		return cmTitle;
	}

	public void setCmTitle(String cmTitle) {
		this.cmTitle = cmTitle;
	}

	public String getCmContent() {
		return cmContent;
	}

	public void setCmContent(String cmContent) {
		this.cmContent = cmContent;
	}

	public Date getCmDate() {
		return cmDate;
	}

	public void setCmDate(Date cmDate) {
		this.cmDate = cmDate;
	}

	public int getCmReadCnt() {
		return cmReadCnt;
	}

	public void setCmReadCnt(int cmReadCnt) {
		this.cmReadCnt = cmReadCnt;
	}

	public String getCmStatus() {
		return cmStatus;
	}

	public void setCmStatus(String cmStatus) {
		this.cmStatus = cmStatus;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	@Override
	public String toString() {
		return "Community [cmCode=" + cmCode + ", cmTitle=" + cmTitle + ", cmContent=" + cmContent + ", cmDate="
				+ cmDate + ", cmReadCnt=" + cmReadCnt + ", cmStatus=" + cmStatus + ", userCode=" + userCode + "]";
	}
	
	
}
