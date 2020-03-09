package payment.model.vo;

import java.sql.Date;

public class PayMent {
	private String payCode;
	private String payWay;
	private int payAmount;
	private Date payDay;
	private String userCode;
	
	public PayMent() {}

	public PayMent(String payCode, String payWay, int payAmount, Date payDay, String userCode) {
		super();
		this.payCode = payCode;
		this.payWay = payWay;
		this.payAmount = payAmount;
		this.payDay = payDay;
		this.userCode = userCode;
	}
	
	
}
