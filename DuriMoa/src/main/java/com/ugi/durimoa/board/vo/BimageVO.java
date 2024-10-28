package com.ugi.durimoa.board.vo;

public class BimageVO {
	
	private int imgId;
	private int brdId;
	private String brdImg;
	private String brdIdx;
	
	public int getImgId() {
		return imgId;
	}
	public void setImgId(int imgId) {
		this.imgId = imgId;
	}
	public int getBrdId() {
		return brdId;
	}
	public void setBrdId(int brdId) {
		this.brdId = brdId;
	}
	public String getBrdImg() {
		return brdImg;
	}
	public void setBrdImg(String brdImg) {
		this.brdImg = brdImg;
	}
	public String getBrdIdx() {
		return brdIdx;
	}
	public void setBrdIdx(String brdIdx) {
		this.brdIdx = brdIdx;
	}
	
	@Override
	public String toString() {
		return "BimageVO [imgId=" + imgId + ", brdId=" + brdId + ", brdImg=" + brdImg + ", brdIdx=" + brdIdx
				+ ", getImgId()=" + getImgId() + ", getBrdId()=" + getBrdId() + ", getBrdImg()=" + getBrdImg()
				+ ", getBrdIdx()=" + getBrdIdx() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
}
