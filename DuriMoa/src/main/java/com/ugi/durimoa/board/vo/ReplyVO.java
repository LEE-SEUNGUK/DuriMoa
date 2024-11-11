package com.ugi.durimoa.board.vo;

public class ReplyVO {

	private int brdId;
	private String rpyId;
	private String memId;
	private String memNm;
	private String memImg;
	private String rpyCt;
	private String rpyDt;
	private int rpyCnt;
	
	public int getBrdId() {
		return brdId;
	}
	public void setBrdId(int brdId) {
		this.brdId = brdId;
	}
	public String getRpyId() {
		return rpyId;
	}
	public void setRpyId(String rpyId) {
		this.rpyId = rpyId;
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
	public String getRpyCt() {
		return rpyCt;
	}
	public void setRpyCt(String rpyCt) {
		this.rpyCt = rpyCt;
	}
	public String getRpyDt() {
		return rpyDt;
	}
	public void setRpyDt(String rpyDt) {
		this.rpyDt = rpyDt;
	}
	public int getRpyCnt() {
		return rpyCnt;
	}
	public void setRpyCnt(int rpyCnt) {
		this.rpyCnt = rpyCnt;
	}
	@Override
	public String toString() {
		return "ReplyVO [brdId=" + brdId + ", rpyId=" + rpyId + ", memId=" + memId + ", memNm=" + memNm + ", memImg="
				+ memImg + ", rpyCt=" + rpyCt + ", rpyDt=" + rpyDt + ", rpyCnt=" + rpyCnt + "]";
	}
}
