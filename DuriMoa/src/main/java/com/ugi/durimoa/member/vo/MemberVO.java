package com.ugi.durimoa.member.vo;

public class MemberVO {
	
	private String memId;
	private String memPw;
	private String memNm;
	private String memDt;
	private String memPn;	
	private String memImg;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getMemDt() {
		return memDt;
	}
	public void setMemDt(String memDt) {
		this.memDt = memDt;
	}
	public String getMemPn() {
		return memPn;
	}
	public void setMemPn(String memPn) {
		this.memPn = memPn;
	}
	public String getMemImg() {
		return memImg;
	}
	public void setMemImg(String memImg) {
		this.memImg = memImg;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memNm=" + memNm + ", memDt=" + memDt + ", memPn="
				+ memPn + ", memImg=" + memImg + "]";
	}
}
