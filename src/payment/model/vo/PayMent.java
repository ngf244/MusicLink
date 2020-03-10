package payment.model.vo;

import java.sql.Date;

public class PayMent {
	private String payCode;
	private String payWay;
	private int payAmount;
	private Date payDay;
	private String userCode;
	
	public PayMent() {}	

	
	
	public PayMent(int payAmount) {
		super();
		this.payAmount = payAmount;
	}



	public PayMent(int payAmount, String userCode) {
		super();
		this.payAmount = payAmount;
		this.userCode = userCode;
	}



	public PayMent(String payWay, int payAmount, Date payDay, String userCode) {
		super();
		this.payWay = payWay;
		this.payAmount = payAmount;
		this.payDay = payDay;
		this.userCode = userCode;
	}



	public PayMent(String payCode, String payWay, int payAmount, Date payDay, String userCode) {
		super();
		this.payCode = payCode;
		this.payWay = payWay;
		this.payAmount = payAmount;
		this.payDay = payDay;
		this.userCode = userCode;
	}



	public String getPayCode() {
		return payCode;
	}



	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}



	public String getPayWay() {
		return payWay;
	}



	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}



	public int getPayAmount() {
		return payAmount;
	}



	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}



	public Date getPayDay() {
		return payDay;
	}



	public void setPayDay(Date payDay) {
		this.payDay = payDay;
	}



	public String getUserCode() {
		return userCode;
	}



	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}



	@Override
	public String toString() {
		return "PayMent [payCode=" + payCode + ", payWay=" + payWay + ", payAmount=" + payAmount + ", payDay=" + payDay
				+ ", userCode=" + userCode + "]";
	}
	
	
}
