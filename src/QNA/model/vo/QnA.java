package QNA.model.vo;

import java.sql.Date;

public class QnA {
	private String qnaCode;
	private String qnaTitle;
	private String qnaContent;
	private String qnaWriter;
	private Date qnaDate;
	private String qnaComYN;
	private String qnaComContent;
	private String qnaStatus;
	private String mnCode;
	
	public QnA() {}

	public QnA(String qnaTitle, String qnaContent, String qnaWriter, Date qnaDate, String qnaComYN) {
		super();
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWriter = qnaWriter;
		this.qnaDate = qnaDate;
		this.qnaComYN = qnaComYN;
	}

	public QnA(String qnaCode, String qnaTitle, String qnaContent, String qnaWriter, Date qnaDate, String qnaComYN,
			String qnaComContent, String qnaStatus, String mnCode) {
		super();
		this.qnaCode = qnaCode;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWriter = qnaWriter;
		this.qnaDate = qnaDate;
		this.qnaComYN = qnaComYN;
		this.qnaComContent = qnaComContent;
		this.qnaStatus = qnaStatus;
		this.mnCode = mnCode;
	}

	public String getQnaCode() {
		return qnaCode;
	}

	public void setQnaCode(String qnaCode) {
		this.qnaCode = qnaCode;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getQnaComYN() {
		return qnaComYN;
	}

	public void setQnaComYN(String qnaComYN) {
		this.qnaComYN = qnaComYN;
	}

	public String getQnaComContent() {
		return qnaComContent;
	}

	public void setQnaComContent(String qnaComContent) {
		this.qnaComContent = qnaComContent;
	}

	public String getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	public String getMnCode() {
		return mnCode;
	}

	public void setMnCode(String mnCode) {
		this.mnCode = mnCode;
	}
	
	
}
