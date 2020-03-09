package authorPage.model.vo;

public class CompanyJoinInfo {
	public String coCode;
	public String coName;
	public String chargePerson;
	public String coAddress;
	public String coPhone;
	public String requestDate;
	public String chargePhone;
	public String email;
	
	public CompanyJoinInfo() {}
	
	public String getChargePhone() {
		return chargePhone;
	}

	public void setChargePhone(String chargePhone) {
		this.chargePhone = chargePhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCoCode() {
		return coCode;
	}
	
	public void setCoCode(String coCode) {
		this.coCode = coCode;
	}
	
	public String getCoName() {
		return coName;
	}

	public void setCoName(String coName) {
		this.coName = coName;
	}

	public String getChargePerson() {
		return chargePerson;
	}

	public void setChargePerson(String chargePerson) {
		this.chargePerson = chargePerson;
	}

	public String getCoAddress() {
		return coAddress;
	}

	public void setCoAddress(String coAddress) {
		this.coAddress = coAddress;
	}

	public String getCoPhone() {
		return coPhone;
	}

	public void setCoPhone(String coPhone) {
		this.coPhone = coPhone;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	@Override
	public String toString() {
		return "CompanyJoinInfo [coCode=" + coCode + ", coName=" + coName + ", chargePerson=" + chargePerson
				+ ", coAddress=" + coAddress + ", coPhone=" + coPhone + ", requestDate=" + requestDate + "]";
	}
	
	
	
}
