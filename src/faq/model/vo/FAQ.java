package faq.model.vo;

public class FAQ {
	private String faqNum;
	private String faqTitle;
	private String faqContent;
	private String faqStatus;
	private String mnCode;
	
	public FAQ() {}

	public FAQ(String faqTitle, String faqContent) {
		super();
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}

	public FAQ(String faqNum, String faqTitle, String faqContent) {
		super();
		this.faqNum = faqNum;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}

	public FAQ(String faqNum, String faqTitle, String faqContent, String faqStatus) {
		super();
		this.faqNum = faqNum;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqStatus = faqStatus;
	}

	public FAQ(String faqNum, String faqTitle, String faqContent, String faqStatus, String mnCode) {
		super();
		this.faqNum = faqNum;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqStatus = faqStatus;
		this.mnCode = mnCode;
	}

	public String getFaqNum() {
		return faqNum;
	}

	public void setFaqNum(String faqNum) {
		this.faqNum = faqNum;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getFaqStatus() {
		return faqStatus;
	}

	public void setFaqStatus(String faqStatus) {
		this.faqStatus = faqStatus;
	}

	public String getMnCode() {
		return mnCode;
	}

	public void setMnCode(String mnCode) {
		this.mnCode = mnCode;
	}

	@Override
	public String toString() {
		return "FAQ [faqNum=" + faqNum + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqStatus="
				+ faqStatus + ", mnCode=" + mnCode + "]";
	}
	
	
}
