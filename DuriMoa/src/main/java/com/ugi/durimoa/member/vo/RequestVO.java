package com.ugi.durimoa.member.vo;

public class RequestVO {
	
	private int reqCid;
	private String reqMid;
	private String resMid;
	private String reqNm;
	private String reqImg;
	private String reqYn;
	private String reqOk;
	
	public int getReqCid() {
		return reqCid;
	}
	public void setReqCid(int reqCid) {
		this.reqCid = reqCid;
	}
	
	public String getReqNm() {
		return reqNm;
	}
	public void setReqNm(String reqNm) {
		this.reqNm = reqNm;
	}

	public String getReqImg() {
		return reqImg;
	}
	public void setReqImg(String reqImg) {
		this.reqImg = reqImg;
	}

	public String getReqMid() {
		return reqMid;
	}
	public void setReqMid(String reqMid) {
		this.reqMid = reqMid;
	}
	public String getResMid() {
		return resMid;
	}
	public void setResMid(String resMid) {
		this.resMid = resMid;
	}
	public String getReqYn() {
		return reqYn;
	}
	public void setReqYn(String reqYn) {
		this.reqYn = reqYn;
	}
	public String getReqOk() {
		return reqOk;
	}
	public void setReqOk(String reqOk) {
		this.reqOk = reqOk;
	}
	
	@Override
	public String toString() {
		return "RequestVO [reqCid=" + reqCid + ", reqMid=" + reqMid + ", reqNm=" + reqNm + ", resNm="
	         + ", reqImg=" + reqImg + ", resImg=" + ", resMid=" + resMid + ", reqYn=" + reqYn + ", reqOk="
				+ reqOk + "]";
	}
}
