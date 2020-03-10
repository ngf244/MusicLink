package festival.model.vo;

import java.sql.Date;

public class AppFestival {
	private String fesCode;
	private String apFesYn;
	private Date apFesTime;
	private String fesName;
	private String fesLocation;
	private String fesTerm;
	private String plName;
	
	public AppFestival() {}

	public AppFestival(String fesCode, String apFesYn, Date apFesTime, String fesName, String fesLocation,
			String fesTerm, String plName) {
		super();
		this.fesCode = fesCode;
		this.apFesYn = apFesYn;
		this.apFesTime = apFesTime;
		this.fesName = fesName;
		this.fesLocation = fesLocation;
		this.fesTerm = fesTerm;
		this.plName = plName;
	}

	public String getFesCode() {
		return fesCode;
	}

	public void setFesCode(String fesCode) {
		this.fesCode = fesCode;
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

	public String getFesName() {
		return fesName;
	}

	public void setFesName(String fesName) {
		this.fesName = fesName;
	}

	public String getFesLocation() {
		return fesLocation;
	}

	public void setFesLocation(String fesLocation) {
		this.fesLocation = fesLocation;
	}

	public String getFesTerm() {
		return fesTerm;
	}

	public void setFesTerm(String fesTerm) {
		this.fesTerm = fesTerm;
	}

	public String getPlName() {
		return plName;
	}

	public void setPlName(String plName) {
		this.plName = plName;
	}

	@Override
	public String toString() {
		return "AppFestival [fesCode=" + fesCode + ", apFesYn=" + apFesYn + ", apFesTime=" + apFesTime + ", fesName="
				+ fesName + ", fesLocation=" + fesLocation + ", fesTerm=" + fesTerm + ", plName=" + plName + "]";
	}
	
	
}
