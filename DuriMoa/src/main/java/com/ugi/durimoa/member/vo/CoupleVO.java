package com.ugi.durimoa.member.vo;

public class CoupleVO {
	
	private int copId;
	private String copNm;
	private String copDt;

	public int getCopId() {
		return copId;
	}
	public void setCopId(int copId) {
		this.copId = copId;
	}
	public String getCopNm() {
		return copNm;
	}
	public void setCopNm(String copNm) {
		this.copNm = copNm;
	}
	public String getCopDt() {
		return copDt;
	}
	public void setCopDt(String copDt) {
		this.copDt = copDt;
	}

	@Override
	public String toString() {
		return "CoupleVO [copId=" + copId + ", copNm=" + copNm + ", copDt=" + copDt + "]";
	}
}