package member.model.vo;

public class Company {
	private String cpCode;
	private String cpName;
	private String cpAddress;
	private String cpPhone;
	private int cpGrade;
	
	public Company() {}

	public Company(String cpName, String cpAddress, String cpPhone) {
		super();
		this.cpName = cpName;
		this.cpAddress = cpAddress;
		this.cpPhone = cpPhone;
	}

	public Company(String cpCode, String cpName, String cpAddress, String cpPhone) {
		super();
		this.cpCode = cpCode;
		this.cpName = cpName;
		this.cpAddress = cpAddress;
		this.cpPhone = cpPhone;
	}

	public Company(String cpCode, String cpName, String cpAddress, String cpPhone, int cpGrade) {
		super();
		this.cpCode = cpCode;
		this.cpName = cpName;
		this.cpAddress = cpAddress;
		this.cpPhone = cpPhone;
		this.cpGrade = cpGrade;
	}

	public String getCpCode() {
		return cpCode;
	}

	public void setCpCode(String cpCode) {
		this.cpCode = cpCode;
	}

	public String getCpName() {
		return cpName;
	}

	public void setCpName(String cpName) {
		this.cpName = cpName;
	}

	public String getCpAddress() {
		return cpAddress;
	}

	public void setCpAddress(String cpAddress) {
		this.cpAddress = cpAddress;
	}

	public String getCpPhone() {
		return cpPhone;
	}

	public void setCpPhone(String cpPhone) {
		this.cpPhone = cpPhone;
	}

	public int getCpGrade() {
		return cpGrade;
	}

	public void setCpGrade(int cpGrade) {
		this.cpGrade = cpGrade;
	}
	
	
}
