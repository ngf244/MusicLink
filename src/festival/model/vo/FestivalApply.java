package festival.model.vo;

import java.sql.Date;

public class FestivalApply {
	private String apFesCode;
	private String apFesYn;
	private Date apFesTime;
	private String cpCode;
	private String atCode;
	
	private String fesTerm; 
	private String payRange;
	private String plCode;
	
	public FestivalApply() {}
	
	
	
	public FestivalApply(Date apFesTime, String cpCode, String atCode, String fesTerm, String payRange, String plCode) {
		super();
		this.apFesTime = apFesTime;
		this.cpCode = cpCode;
		this.atCode = atCode;
		this.fesTerm = fesTerm;
		this.payRange = payRange;
		this.plCode = plCode;
	}



	public FestivalApply(String apFesYn, Date apFesTime, String cpCode, String atCode, String fesTerm, String payRange,
			String plCode) {
		super();
		this.apFesYn = apFesYn;
		this.apFesTime = apFesTime;
		this.cpCode = cpCode;
		this.atCode = atCode;
		this.fesTerm = fesTerm;
		this.payRange = payRange;
		this.plCode = plCode;
	}

	public FestivalApply(String apFesCode, String apFesYn, Date apFesTime, String cpCode, String atCode, String fesTerm,
			String payRange, String plCode) {
		super();
		this.apFesCode = apFesCode;
		this.apFesYn = apFesYn;
		this.apFesTime = apFesTime;
		this.cpCode = cpCode;
		this.atCode = atCode;
		this.fesTerm = fesTerm;
		this.payRange = payRange;
		this.plCode = plCode;
	}

	public String getApFesCode() {
		return apFesCode;
	}

	public void setApFesCode(String apFesCode) {
		this.apFesCode = apFesCode;
	}

	public String getApFesYn() {
		return apFesYn;
	}

	public void setApFesYn(String apFesYn) {
		this.apFesYn = apFesYn;
	}

	public Date getApFesTime() {
		return apFesTime;
	}

	public void setApFesTime(Date apFesTime) {
		this.apFesTime = apFesTime;
	}

	public String getCpCode() {
		return cpCode;
	}

	public void setCpCode(String cpCode) {
		this.cpCode = cpCode;
	}

	public String getAtCode() {
		return atCode;
	}

	public void setAtCode(String atCode) {
		this.atCode = atCode;
	}

	public String getFesTerm() {
		return fesTerm;
	}

	public void setFesTerm(String fesTerm) {
		this.fesTerm = fesTerm;
	}

	public String getPayRange() {
		return payRange;
	}

	public void setPayRange(String payRange) {
		this.payRange = payRange;
	}

	public String getPlCode() {
		return plCode;
	}

	public void setPlCode(String plCode) {
		this.plCode = plCode;
	}

	@Override
	public String toString() {
		return "FestivalApply [apFesCode=" + apFesCode + ", apFesYn=" + apFesYn + ", apFesTime=" + apFesTime
				+ ", cpCode=" + cpCode + ", atCode=" + atCode + ", fesTerm=" + fesTerm + ", payRange=" + payRange
				+ ", plCode=" + plCode + "]";
	}

	
	
	
	
	
	
	
	
}
