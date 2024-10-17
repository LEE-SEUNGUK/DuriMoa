package com.ugi.durimoa.member.vo;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class CoupleInfoVO {
	
	private String memId;
	private String memNm;
	private String memImg;
	private int copId;
	private String copNm;
	private String copDt;

	public int getCopId() {
		return copId;
	}

	public void setCopId(int copId) {
		this.copId = copId;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public String getMemImg() {
		return memImg;
	}

	public void setMemImg(String memImg) {
		this.memImg = memImg;
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
		return "CoupleInfoVO [memId=" + memId + ", memNm=" + memNm + ", memImg=" + memImg + ", copId=" + copId
				+ ", copNm=" + copNm + ", copDt=" + copDt + "]";
	}
}