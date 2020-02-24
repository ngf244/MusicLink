package authorPage.model.vo;

import java.sql.Date;

public class ReportPage {

	public int reportNum;
	public String reportedUserCode;
	public String reportedId;
	public String reporterId;
	public String reportReason;
	public String reportCategory;
	public Date reportDate;
	
	public ReportPage() {}
	
	public ReportPage(int reportNum,String reportedUserCode, String reportedId, String reporterId, String reportReason, String reportCategory,
			Date reportDate) {
		super();
		this.reportNum = reportNum;
		this.reportedUserCode = reportedUserCode;
		this.reportedId = reportedId;
		this.reporterId = reporterId;
		this.reportReason = reportReason;
		this.reportCategory = reportCategory;
		this.reportDate = reportDate;
	}

	public int getReportNum() {
		return reportNum;
	}

	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}
	
	public String getReportedUserCode() {
		return reportedUserCode;
	}
	
	public void setReportedUserCode(String reportedUserCode) {
		this.reportedUserCode = reportedUserCode;
	}

	public String getReportedId() {
		return reportedId;
	}

	public void setReportedId(String reportedId) {
		this.reportedId = reportedId;
	}

	public String getReporterId() {
		return reporterId;
	}

	public void setReporterId(String reporterId) {
		this.reporterId = reporterId;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public String getReportCategory() {
		return reportCategory;
	}

	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	
	
}
