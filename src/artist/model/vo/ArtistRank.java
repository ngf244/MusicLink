package artist.model.vo;

import java.sql.Date;

public class ArtistRank {
	private String atCode;
	private String atName;
	private int atMember;
	private String atGenre;
	private String atClass;
	private String atPicPath;
	private String atOneLine;
	private String atIntro;
	private String atRecode;
	private Date atDebutDate;
	private int atGrade;
	private String atInsta;
	private String atTwitter;
	private String atFacebook;
	private int rank;
	
	public ArtistRank() {}
	
	public ArtistRank(String atCode, String atName, int atMember, String atGenre, String atClass, String atPicPath,
			String atOneLine, String atIntro, String atRecode, Date atDebutDate, int atGrade, String atInsta,
			String atTwitter, String atFacebook, int rank) {
		super();
		this.atCode = atCode;
		this.atName = atName;
		this.atMember = atMember;
		this.atGenre = atGenre;
		this.atClass = atClass;
		this.atPicPath = atPicPath;
		this.atOneLine = atOneLine;
		this.atIntro = atIntro;
		this.atRecode = atRecode;
		this.atDebutDate = atDebutDate;
		this.atGrade = atGrade;
		this.atInsta = atInsta;
		this.atTwitter = atTwitter;
		this.atFacebook = atFacebook;
		this.rank = rank;
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

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	@Override
	public String toString() {
		return "ArtistRank [atCode=" + atCode + ", atName=" + atName + ", atMember=" + atMember + ", atGenre=" + atGenre
				+ ", atClass=" + atClass + ", atPicPath=" + atPicPath + ", atOneLine=" + atOneLine + ", atIntro="
				+ atIntro + ", atRecode=" + atRecode + ", atDebutDate=" + atDebutDate + ", atGrade=" + atGrade
				+ ", atInsta=" + atInsta + ", atTwitter=" + atTwitter + ", atFacebook=" + atFacebook + ", rank=" + rank
				+ "]";
	}
	
	
	
	
}
