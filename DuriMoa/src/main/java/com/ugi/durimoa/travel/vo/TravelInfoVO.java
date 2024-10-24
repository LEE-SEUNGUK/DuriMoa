package com.ugi.durimoa.travel.vo;

public class TravelInfoVO {

	private int trvId;
	private String trvTt;
	private String trvPc;
	private String trvPlc;
	private String trvX;
	private String trvY;	
	private String trvCt;
	private String trvSdt;
	private String trvEdt;
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


	public String getTrvSdt() {
		return trvSdt;
	}

	public void setTrvSdt(String trvSdt) {
		this.trvSdt = trvSdt;
	}

	public String getTrvEdt() {
		return trvEdt;
	}

	public void setTrvEdt(String trvEdt) {
		this.trvEdt = trvEdt;
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
				+ ", trvX=" + trvX + ", trvY=" + trvY + ", trvCt=" + trvCt + ", trvSdt=" + trvSdt + ", trvEdt=" + trvEdt
				+ ", trvOp=" + trvOp + ", trvImg1=" + trvImg1 + ", trvImg2=" + trvImg2 + ", trvImg3=" + trvImg3 + "]";
	}

}