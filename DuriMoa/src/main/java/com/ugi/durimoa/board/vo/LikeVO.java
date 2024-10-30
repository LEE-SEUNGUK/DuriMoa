package com.ugi.durimoa.board.vo;

public class LikeVO {

	private String memId;
	private String action;
	private int brdId;
	

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getBrdId() {
		return brdId;
	}

	public void setBrdId(int brdId) {
		this.brdId = brdId;
	}

	@Override
	public String toString() {
		return "LikeVO [memId=" + memId + ", action=" + action + ", brdId=" + brdId + "]";
	}

	
}
