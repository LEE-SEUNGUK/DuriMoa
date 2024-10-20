package com.ugi.durimoa.travel.vo;

public class ImageVO {
	private int imgId;
	private int trvId;
	private String imgPath;
	private boolean isThumbnail;

	public int getImgId() {
		return imgId;
	}

	public void setImgId(int imgId) {
		this.imgId = imgId;
	}

	public int getTrvId() {
		return trvId;
	}

	public void setTrvId(int trvId) {
		this.trvId = trvId;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public boolean isThumbnail() {
		return isThumbnail;
	}

	public void setThumbnail(boolean isThumbnail) {
		this.isThumbnail = isThumbnail;
	}

	@Override
	public String toString() {
		return "ImageVO [imgId=" + imgId + ", trvId=" + trvId + ", imgPath=" + imgPath + ", isThumbnail=" + isThumbnail
				+ ", getImgId()=" + getImgId() + ", getTrvId()=" + getTrvId() + ", getImgPath()=" + getImgPath()
				+ ", isThumbnail()=" + isThumbnail() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}
