package festival.model.vo;

import java.sql.Date;

public class Festival {
	private String fesName;
	private String fesLoc;
	private String fesTerm;
	private String fesInfo;
	private String payRange;
	private int recCount;
	private String recTerm;
	private String posPath;
	private String banPath;
	private String secOp;
	private int ticFee;
	private String ticUrl;
	private String cpCode;
	
	public Festival() {}

	public Festival(String fesName, String fesLoc, String fesTerm, String fesInfo, String payRange, int recCount,
			String recTerm, String posPath, String secOp, String cpCode) {
		super();
		this.fesName = fesName;
		this.fesLoc = fesLoc;
		this.fesTerm = fesTerm;
		this.fesInfo = fesInfo;
		this.payRange = payRange;
		this.recCount = recCount;
		this.recTerm = recTerm;
		this.posPath = posPath;
		this.secOp = secOp;
		this.cpCode = cpCode;
	}

	public Festival(String fesName, String fesLoc, String fesTerm, String fesInfo, String payRange, int recCount,
			String recTerm, String posPath, String banPath, String secOp, int ticFee, String ticUrl, String cpCode) {
		super();
		this.fesName = fesName;
		this.fesLoc = fesLoc;
		this.fesTerm = fesTerm;
		this.fesInfo = fesInfo;
		this.payRange = payRange;
		this.recCount = recCount;
		this.recTerm = recTerm;
		this.posPath = posPath;
		this.banPath = banPath;
		this.secOp = secOp;
		this.ticFee = ticFee;
		this.ticUrl = ticUrl;
		this.cpCode = cpCode;
	}

	public String getFesName() {
		return fesName;
	}

	public void setFesName(String fesName) {
		this.fesName = fesName;
	}

	public String getFesLoc() {
		return fesLoc;
	}

	public void setFesLoc(String fesLoc) {
		this.fesLoc = fesLoc;
	}

	public String getFesTerm() {
		return fesTerm;
	}

	public void setFesTerm(String fesTerm) {
		this.fesTerm = fesTerm;
	}

	public String getFesInfo() {
		return fesInfo;
	}

	public void setFesInfo(String fesInfo) {
		this.fesInfo = fesInfo;
	}

	public String getPayRange() {
		return payRange;
	}

	public void setPayRange(String payRange) {
		this.payRange = payRange;
	}

	public int getRecCount() {
		return recCount;
	}

	public void setRecCount(int recCount) {
		this.recCount = recCount;
	}

	public String getRecTerm() {
		return recTerm;
	}

	public void setRecTerm(String recTerm) {
		this.recTerm = recTerm;
	}

	public String getPosPath() {
		return posPath;
	}

	public void setPosPath(String posPath) {
		this.posPath = posPath;
	}

	public String getBanPath() {
		return banPath;
	}

	public void setBanPath(String banPath) {
		this.banPath = banPath;
	}

	public String getSecOp() {
		return secOp;
	}

	public void setSecOp(String secOp) {
		this.secOp = secOp;
	}

	public int getTicFee() {
		return ticFee;
	}

	public void setTicFee(int ticFee) {
		this.ticFee = ticFee;
	}

	public String getTicUrl() {
		return ticUrl;
	}

	public void setTicUrl(String ticUrl) {
		this.ticUrl = ticUrl;
	}

	public String getCpCode() {
		return cpCode;
	}

	public void setCpCode(String cpCode) {
		this.cpCode = cpCode;
	}
	
	
}
