package lovecall.model.vo;

import java.sql.Date;

public class LoveCall {
	private String lcCode;
	private String lcContents;
	private Date lcDate;
	private String plCode;
	private String fesName;
	private String lcYn;
	private String fesCode;
	private String atCode;
	
	
	
	

	public LoveCall() {}
	
	
	
	
	public LoveCall(Date lcDate, String plCode, String fesName, String lcYn, String lcCode, String fesCode) {
		super();
		this.lcDate = lcDate;
		this.plCode = plCode;
		this.fesName = fesName;
		this.lcYn = lcYn;
		this.lcCode = lcCode;
		this.fesCode = fesCode;
	}




	public LoveCall(String lcCode, String lcContents, Date lcDate, String plCode, String lcYn, String fesCode, String atCode
			) {
		super();
		this.lcCode = lcCode;
		this.lcContents = lcContents;
		this.lcDate = lcDate;
		this.lcYn = lcYn;
		this.fesCode = fesCode;
		this.atCode = atCode;
		this.plCode = plCode;
	}

	public String getLcCode() {
		return lcCode;
	}

	public void setLcCode(String lcCode) {
		this.lcCode = lcCode;
	}

	public String getLcContents() {
		return lcContents;
	}

	public void setLcContents(String lcContents) {
		this.lcContents = lcContents;
	}

	public Date getLcDate() {
		return lcDate;
	}

	public void setLcDate(Date lcDate) {
		this.lcDate = lcDate;
	}

	public String getLcYn() {
		return lcYn;
	}

	public void setLcYn(String lcYn) {
		this.lcYn = lcYn;
	}

	public String getFesCode() {
		return fesCode;
	}

	public void setFesCode(String fesCode) {
		this.fesCode = fesCode;
	}

	public String getAtCode() {
		return atCode;
	}

	public void setAtCode(String atCode) {
		this.atCode = atCode;
	}

	public String getPlCode() {
		return plCode;
	}

	public void setPlCode(String plCode) {
		this.plCode = plCode;
	}
	public String getFesName() {
		return fesName;
	}


	public void setFesName(String fesName) {
		this.fesName = fesName;
	}


	@Override
	public String toString() {
		return "LoveCall [lcCode=" + lcCode + ", lcContents=" + lcContents + ", lcDate=" + lcDate + ", lcYn=" + lcYn
				+ ", fesCode=" + fesCode + ", atCode=" + atCode + ", plCode=" + plCode + "]";
	}
	
	
	
	
}
