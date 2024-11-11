package com.ugi.durimoa.board.vo;

public class BoardVO {
	
	private int brdId;
	private String memId;
	private int trvId;
	private String brdTt;
	private String brdCt;
	private String tag;
	
	public int getBrdId() {
		return brdId;
	}
	public void setBrdId(int brdId) {
		this.brdId = brdId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getTrvId() {
		return trvId;
	}
	public void setTrvId(int trvId) {
		this.trvId = trvId;
	}
	public String getBrdTt() {
		return brdTt;
	}
	public void setBrdTt(String brdTt) {
		this.brdTt = brdTt;
	}
	public String getBrdCt() {
		return brdCt;
	}
	public void setBrdCt(String brdCt) {
		this.brdCt = brdCt;
	}

	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	@Override
	public String toString() {
		return "BoardVO [brdId=" + brdId + ", memId=" + memId + ", trvId=" + trvId + ", brdTt=" + brdTt + ", brdCt="
				+ brdCt + "]";
	}
}
