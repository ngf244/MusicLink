package artistGallery.model.vo;

import java.sql.Date;

public class Gallery {
	private String galleryCode;
	private String galleryTitle;
	private String galleryContent;
	private Date galleryDate;
	private int galleryReadCnt;
	private String galleryStatus;
	private String userCode;
	
	public Gallery() {}

	public Gallery(String galleryTitle, String galleryContent) {
		super();
		this.galleryTitle = galleryTitle;
		this.galleryContent = galleryContent;
	}

	public Gallery(String galleryCode, String galleryTitle, String galleryContent, Date galleryDate, int galleryReadCnt,
			String galleryStatus, String userCode) {
		super();
		this.galleryCode = galleryCode;
		this.galleryTitle = galleryTitle;
		this.galleryContent = galleryContent;
		this.galleryDate = galleryDate;
		this.galleryReadCnt = galleryReadCnt;
		this.galleryStatus = galleryStatus;
		this.userCode = userCode;
	}

	public String getGalleryCode() {
		return galleryCode;
	}

	public void setGalleryCode(String galleryCode) {
		this.galleryCode = galleryCode;
	}

	public String getGalleryTitle() {
		return galleryTitle;
	}

	public void setGalleryTitle(String galleryTitle) {
		this.galleryTitle = galleryTitle;
	}

	public String getGalleryContent() {
		return galleryContent;
	}

	public void setGalleryContent(String galleryContent) {
		this.galleryContent = galleryContent;
	}

	public Date getGalleryDate() {
		return galleryDate;
	}

	public void setGalleryDate(Date galleryDate) {
		this.galleryDate = galleryDate;
	}

	public int getGalleryReadCnt() {
		return galleryReadCnt;
	}

	public void setGalleryReadCnt(int galleryReadCnt) {
		this.galleryReadCnt = galleryReadCnt;
	}

	public String getGalleryStatus() {
		return galleryStatus;
	}

	public void setGalleryStatus(String galleryStatus) {
		this.galleryStatus = galleryStatus;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	
}
