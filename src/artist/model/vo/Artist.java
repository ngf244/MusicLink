package artist.model.vo;

import java.sql.Date;

public class Artist {
	private String atCode;
	private String atName;
	private int atMember;
	private String atGenre;
	private String atClass;
	private String atPicPath;
	private String atVideoPath;
	private String atOneLine;
	private String atIntro;
	private String atRecode;
	private Date atDebutDate;
	private int atGrade;
	private String atInsta;
	private String atTwitter;
	private String atFacebook;
	   
	public Artist() {}

	public Artist(String atCode, String atName, String atGenre, String atClass) {
		super();
		this.atCode = atCode;
		this.atName = atName;
		this.atGenre = atGenre;
		this.atClass = atClass;
	}

	public Artist(String atCode, String atName, int atMember, String atGenre, String atClass, String atPicPath) {
		super();
		this.atCode = atCode;
		this.atName = atName;
		this.atMember = atMember;
		this.atGenre = atGenre;
		this.atClass = atClass;
		this.atPicPath = atPicPath;
	}

	public Artist(String atCode, String atName, int atMember, String atGenre, String atClass, String atPicPath,
			String atVideoPath, String atOneLine, String atIntro, String atRecode, Date atDebutDate, String atInsta,
			String atTwitter, String atFacebook) {
		super();
		this.atCode = atCode;
		this.atName = atName;
		this.atMember = atMember;
		this.atGenre = atGenre;
		this.atClass = atClass;
		this.atPicPath = atPicPath;
		this.atVideoPath = atVideoPath;
		this.atOneLine = atOneLine;
		this.atIntro = atIntro;
		this.atRecode = atRecode;
		this.atDebutDate = atDebutDate;
		this.atInsta = atInsta;
		this.atTwitter = atTwitter;
		this.atFacebook = atFacebook;
	}

	public Artist(String atCode, String atName, int atMember, String atGenre, String atClass, String atPicPath,
			String atVideoPath, String atOneLine, String atIntro, String atRecode, Date atDebutDate, int atGrade,
			String atInsta, String atTwitter, String atFacebook) {
		super();
		this.atCode = atCode;
		this.atName = atName;
		this.atMember = atMember;
		this.atGenre = atGenre;
		this.atClass = atClass;
		this.atPicPath = atPicPath;
		this.atVideoPath = atVideoPath;
		this.atOneLine = atOneLine;
		this.atIntro = atIntro;
		this.atRecode = atRecode;
		this.atDebutDate = atDebutDate;
		this.atGrade = atGrade;
		this.atInsta = atInsta;
		this.atTwitter = atTwitter;
		this.atFacebook = atFacebook;
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

	public int getAtMember() {
		return atMember;
	}

	public void setAtMember(int atMember) {
		this.atMember = atMember;
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

	public String getAtPicPath() {
		return atPicPath;
	}

	public void setAtPicPath(String atPicPath) {
		this.atPicPath = atPicPath;
	}

	public String getAtVideoPath() {
		return atVideoPath;
	}

	public void setAtVideoPath(String atVideoPath) {
		this.atVideoPath = atVideoPath;
	}

	public String getAtOneLine() {
		return atOneLine;
	}

	public void setAtOneLine(String atOneLine) {
		this.atOneLine = atOneLine;
	}

	public String getAtIntro() {
		return atIntro;
	}

	public void setAtIntro(String atIntro) {
		this.atIntro = atIntro;
	}

	public String getAtRecode() {
		return atRecode;
	}

	public void setAtRecode(String atRecode) {
		this.atRecode = atRecode;
	}

	public Date getAtDebutDate() {
		return atDebutDate;
	}

	public void setAtDebutDate(Date atDebutDate) {
		this.atDebutDate = atDebutDate;
	}

	public int getAtGrade() {
		return atGrade;
	}

	public void setAtGrade(int atGrade) {
		this.atGrade = atGrade;
	}

	public String getAtInsta() {
		return atInsta;
	}

	public void setAtInsta(String atInsta) {
		this.atInsta = atInsta;
	}

	public String getAtTwitter() {
		return atTwitter;
	}

	public void setAtTwitter(String atTwitter) {
		this.atTwitter = atTwitter;
	}

	public String getAtFacebook() {
		return atFacebook;
	}

	public void setAtFacebook(String atFacebook) {
		this.atFacebook = atFacebook;
	}

	@Override
	public String toString() {
		return "Artist [atCode=" + atCode + ", atName=" + atName + ", atMember=" + atMember + ", atGenre=" + atGenre
				+ ", atClass=" + atClass + ", atPicPath=" + atPicPath + ", atVideoPath=" + atVideoPath + ", atOneLine="
				+ atOneLine + ", atIntro=" + atIntro + ", atRecode=" + atRecode + ", atDebutDate=" + atDebutDate
				+ ", atGrade=" + atGrade + ", atInsta=" + atInsta + ", atTwitter=" + atTwitter + ", atFacebook="
				+ atFacebook + "]";
	}

	


	
	
}
