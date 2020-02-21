package authorPage.model.vo;

import java.sql.Date;

public class Follow {
	public String UserCode;
	public String AtCode;
	public String AtName;
	public Date followingDate;
	
	public Follow() {}
	
	public Follow(String userCode, String atCode, String AtName, Date followingDate) {
		super();
		UserCode = userCode;
		AtCode = atCode;
		this.followingDate = followingDate;
		this.AtName = AtName;
	}
	public String getUserCode() {
		return UserCode;
	}
	public void setUserCode(String userCode) {
		UserCode = userCode;
	}
	public String getAtCode() {
		return AtCode;
	}
	public void setAtCode(String atCode) {
		AtCode = atCode;
	}
	public Date getFollowingDate() {
		return followingDate;
	}
	public void setFollowingDate(Date followingDate) {
		this.followingDate = followingDate;
	}
	public String getAtName() {
		return AtName;
	}
	public void setAtName(String atName) {
		AtName = atName;
	}
	
	
}
