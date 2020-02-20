package authorPage.model.vo;

import java.sql.Date;

public class Member {
	private String userCode;
	private String userId;
	private String userPwd;
	private String userName;
	private String userBirth;
	private String userEmail;
	private String userGender;
	private String userPhone;
	private Date userJoinDay;
	private String userClass;
	private String userStatus;
	
	public Member() {}

	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}
	
	public Member(String userCode, String userId, String userName, String userClass) {
		super();
		this.userCode = userCode;
		this.userId = userId;
		this.userName = userName;
		this.userClass = userClass;
	}

	public Member(String userId, String userPwd, String userName, String userBirth, String userEmail, String userGender,
			String userPhone) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.userGender = userGender;
		this.userPhone = userPhone;
	}

	public Member(String userCode, String userId, String userPwd, String userName, String userBirth, String userEmail,
			String userGender, String userPhone, Date userJoinDay, String userClass, String userStatus) {
		super();
		this.userCode = userCode;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.userGender = userGender;
		this.userPhone = userPhone;
		this.userJoinDay = userJoinDay;
		this.userClass = userClass;
		this.userStatus = userStatus;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public Date getUserJoinDay() {
		return userJoinDay;
	}

	public void setUserJoinDay(Date userJoinDay) {
		this.userJoinDay = userJoinDay;
	}

	public String getUserClass() {
		return userClass;
	}

	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	
	
}
