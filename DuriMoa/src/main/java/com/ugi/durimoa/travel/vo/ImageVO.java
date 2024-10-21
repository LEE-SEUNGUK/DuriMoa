package com.ugi.durimoa.travel.vo;

public class ImageVO {
	private int imgId;
	private int trvId;
	private String trvImg;
	private String trvIdx;

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

	public String getTrvImg() {
		return trvImg;
	}

	public void setTrvImg(String trvImg) {
		this.trvImg = trvImg;
	}

	public String getTrvIdx() {
		return trvIdx;
	}

	public void setTrvIdx(String trvIdx) {
		this.trvIdx = trvIdx;
	}

	@Override
	public String toString() {
		return "ImageVO [imgId=" + imgId + ", trvId=" + trvId + ", trvImg=" + trvImg + ", trvIdx=" + trvIdx + "]";
	}

}
