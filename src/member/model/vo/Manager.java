package member.model.vo;

public class Manager {
	private String mnCode;
	private String mnId;
	private String mnPwd;
	private String mnName;
	
	public Manager() {}
	
	public Manager(String mnId, String mnPwd) {
		super();
		this.mnId = mnId;
		this.mnPwd = mnPwd;
	}

	public Manager(String mnCode, String mnId, String mnPwd, String mnName) {
		super();
		this.mnCode = mnCode;
		this.mnId = mnId;
		this.mnPwd = mnPwd;
		this.mnName = mnName;
	}

	public String getMnCode() {
		return mnCode;
	}

	public void setMnCode(String mnCode) {
		this.mnCode = mnCode;
	}

	public String getMnId() {
		return mnId;
	}

	public void setMnId(String mnId) {
		this.mnId = mnId;
	}

	public String getMnPwd() {
		return mnPwd;
	}

	public void setMnPwd(String mnPwd) {
		this.mnPwd = mnPwd;
	}

	public String getMnName() {
		return mnName;
	}

	public void setMnName(String mnName) {
		this.mnName = mnName;
	}
	
	
}
