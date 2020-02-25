package notice.model.vo;

import java.sql.Date;

public class Notice {
	private String noticeCode;
	private String userCode;
	private String noticeClass;
	private String noticeContents;
	private Date noticeTime;
	
	public Notice() {}

	public Notice(String noticeCode, String userCode, String noticeClass, String noticeContents, Date noticeTime) {
		super();
		this.noticeCode = noticeCode;
		this.userCode = userCode;
		this.noticeClass = noticeClass;
		this.noticeContents = noticeContents;
		this.noticeTime = noticeTime;
	}

	public String getNoticeCode() {
		return noticeCode;
	}

	public void setNoticeCode(String noticeCode) {
		this.noticeCode = noticeCode;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getNoticeClass() {
		return noticeClass;
	}

	public void setNoticeClass(String noticeClass) {
		this.noticeClass = noticeClass;
	}

	public String getNoticeContents() {
		return noticeContents;
	}

	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}

	public Date getNoticeTime() {
		return noticeTime;
	}

	public void setNoticeTime(Date noticeTime) {
		this.noticeTime = noticeTime;
	}

	@Override
	public String toString() {
		return "Notice [noticeCode=" + noticeCode + ", userCode=" + userCode + ", noticeClass=" + noticeClass
				+ ", noticeContents=" + noticeContents + ", noticeTime=" + noticeTime + "]";
	}
	
	
}
