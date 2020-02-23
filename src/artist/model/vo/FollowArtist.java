package artist.model.vo;

import java.sql.Date;

public class FollowArtist {
	private String userCode;
	private String atCode;
	private String atName;
	private String atGenre;
	private String atClass;
	private String picPath;
	private String atOneLine;
	private Date followingTime;
	
	public FollowArtist() {}

	public FollowArtist(String userCode, String atCode,  String atName, String atGenre, String atClass, String picPath,
			String atOneLine, Date followingTime) {
		super();
		this.userCode = userCode;
		this.atCode = atCode;
		this.atName = atName;
		this.atGenre = atGenre;
		this.atClass = atClass;
		this.picPath = picPath;
		this.atOneLine = atOneLine;
		this.followingTime = followingTime;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getAtCode() {
		return atCode;
	}

	public void setAtCode(String atCode) {
		this.atCode = atCode;
	}
	
	public String getAtName() {
		return atName;
	}

	public void setAtName(String atName) {
		this.atName = atName;
	}

	public String getAtGenre() {
		return atGenre;
	}

	public void setAtGenre(String atGenre) {
		this.atGenre = atGenre;
	}

	public String getAtClass() {
		return atClass;
	}

	public void setAtClass(String atClass) {
		this.atClass = atClass;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public String getAtOneLine() {
		return atOneLine;
	}

	public void setAtOneLine(String atOneLine) {
		this.atOneLine = atOneLine;
	}

	public Date getFollowingTime() {
		return followingTime;
	}

	public void setFollowingTime(Date followingTime) {
		this.followingTime = followingTime;
	}

	@Override
	public String toString() {
		return "FollowArtist [userCode=" + userCode + ", atCode=" + atCode + ", atName=" + atName + ", atGenre="
				+ atGenre + ", atClass=" + atClass + ", picPath=" + picPath + ", atOneLine=" + atOneLine
				+ ", followingTime=" + followingTime + "]";
	}


	
}
