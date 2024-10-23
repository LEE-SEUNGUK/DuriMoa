package com.ugi.durimoa.travel.vo;

public class TravelInfoVO {

	private int trvId;
	private String trvTt;
	private String trvPc;
	private String trvPlc;
	private String tryX;
	private String tryY;	
	private String trvCt;
	private String trvDt;
	private String trvOp;
	private String trvImg1; // 썸네일 정보
	private String trvImg2;
	private String trvImg3;

	public int getTrvId() {
		return trvId;
	}

	public void setTrvId(int trvId) {
		this.trvId = trvId;
	}

	public String getTrvTt() {
		return trvTt;
	}

	public void setTrvTt(String trvTt) {
		this.trvTt = trvTt;
	}

	public String getTrvPc() {
		return trvPc;
	}

	public void setTrvPc(String trvPc) {
		this.trvPc = trvPc;
	}

	public String getTrvPlc() {
		return trvPlc;
	}

	public void setTrvPlc(String trvPlc) {
		this.trvPlc = trvPlc;
	}

	public String getTryX() {
		return tryX;
	}

	public void setTryX(String tryX) {
		this.tryX = tryX;
	}

	public String getTryY() {
		return tryY;
	}

	public void setTryY(String tryY) {
		this.tryY = tryY;
	}

	public String getTrvDt() {
		return trvDt;
	}

	public void setTrvDt(String trvDt) {
		this.trvDt = trvDt;
	}

	public String getTrvCt() {
		return trvCt;
	}

	public void setTrvCt(String trvCt) {
		this.trvCt = trvCt;
	}

	public String getTrvOp() {
		return trvOp;
	}

	public void setTrvOp(String trvOp) {
		this.trvOp = trvOp;
	}

	public String getTrvImg1() {
		return trvImg1;
	}

	public void setTrvImg1(String trvImg1) {
		this.trvImg1 = trvImg1;
	}

	public String getTrvImg2() {
		return trvImg2;
	}

	public void setTrvImg2(String trvImg2) {
		this.trvImg2 = trvImg2;
	}

	public String getTrvImg3() {
		return trvImg3;
	}

	public void setTrvImg3(String trvImg3) {
		this.trvImg3 = trvImg3;
	}

	@Override
	public String toString() {
		return "TravelInfoVO [trvId=" + trvId + ", trvTt=" + trvTt + ", trvPc=" + trvPc + ", trvPlc=" + trvPlc
				+ ", tryX=" + tryX + ", tryY=" + tryY + ", trvCt=" + trvCt + ", trvDt=" + trvDt + ", trvOp=" + trvOp
				+ ", trvImg1=" + trvImg1 + ", trvImg2=" + trvImg2 + ", trvImg3=" + trvImg3 + "]";
	}
	
}