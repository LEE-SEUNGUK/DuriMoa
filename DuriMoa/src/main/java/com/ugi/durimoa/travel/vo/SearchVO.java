package com.ugi.durimoa.travel.vo;

public class SearchVO {

	private String memId;
	private String keyWord;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String kerWord) {
		this.keyWord = kerWord;
	}
	
	@Override
	public String toString() {
		return "SearchVO [memId=" + memId + ", kerWord=" + keyWord + "]";
	}
}
