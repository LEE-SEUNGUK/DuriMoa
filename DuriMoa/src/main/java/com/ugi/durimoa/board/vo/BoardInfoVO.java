package com.ugi.durimoa.board.vo;

public class BoardInfoVO {
	private String trvPc;
	private int trvId;
	private String memId;
	private String trvX;
	private String trvY;
	private String trvPlc;
	private int brdId;
	private String brdTt;
	private String brdDt;
	private String brdCt;
	private String brdImg1; // 썸네일 정보
	private String brdImg2;
	private String brdImg3;
	private String likeYn;
	private int rpycnt;
	private int cnt;
	private int count; // 조회수
	
	public String getTrvPc() {
		return trvPc;
	}
	public void setTrvPc(String trvPc) {
		this.trvPc = trvPc;
	}
	public int getTrvId() {
		return trvId;
	}
	public void setTrvId(int trvId) {
		this.trvId = trvId;
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getTrvX() {
		return trvX;
	}
	public void setTrvX(String trvX) {
		this.trvX = trvX;
	}
	public String getTrvY() {
		return trvY;
	}
	public void setTrvY(String trvY) {
		this.trvY = trvY;
	}
	
	public String getTrvPlc() {
		return trvPlc;
	}
	public void setTrvPlc(String trvPlc) {
		this.trvPlc = trvPlc;
	}
	public int getBrdId() {
		return brdId;
	}
	public void setBrdId(int brdId) {
		this.brdId = brdId;
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
	public String getBrdImg1() {
		return brdImg1;
	}
	public void setBrdImg1(String brdImg1) {
		this.brdImg1 = brdImg1;
	}
	public String getBrdImg2() {
		return brdImg2;
	}
	public void setBrdImg2(String brdImg2) {
		this.brdImg2 = brdImg2;
	}
	public String getBrdImg3() {
		return brdImg3;
	}
	public void setBrdImg3(String brdImg3) {
		this.brdImg3 = brdImg3;
	}
	
	public String getLikeYn() {
		return likeYn;
	}
	public void setLikeYn(String likeYn) {
		this.likeYn = likeYn;
	}
	
	public int getRpycnt() {
		return rpycnt;
	}
	public void setRpycnt(int rpycnt) {
		this.rpycnt = rpycnt;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getBrdDt() {
		return brdDt;
	}
	public void setBrdDt(String brdDt) {
		this.brdDt = brdDt;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "BoardInfoVO [trvPc=" + trvPc + ", trvId=" + trvId + ", memId=" + memId + ", trvX=" + trvX + ", trvY="
				+ trvY + ", trvPlc=" + trvPlc + ", brdId=" + brdId + ", brdTt=" + brdTt + ", brdDt=" + brdDt
				+ ", brdCt=" + brdCt + ", brdImg1=" + brdImg1 + ", brdImg2=" + brdImg2 + ", brdImg3=" + brdImg3
				+ ", likeYn=" + likeYn + ", rpycnt=" + rpycnt + ", cnt=" + cnt + ", count=" + count + "]";
	}
}
