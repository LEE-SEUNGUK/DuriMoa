package com.ugi.durimoa.travel.vo;

public class TravelVO {

	private int trvId;
	private String memId;
	private String trvTt;
	private String trvPc;
	private Double trvX;
	private Double trvY;
	private String trvSdt;
	private String trvEdt;
	private String trvCt;
	private String trvOp;

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

	public Double getTrvX() {
		return trvX;
	}

	public void setTrvX(Double trvX) {
		this.trvX = trvX;
	}

	public Double getTrvY() {
		return trvY;
	}

	public void setTrvY(Double trvY) {
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

	@Override
	public String toString() {
		return "TravelVO [trvId=" + trvId + ", memId=" + memId + ", trvTt=" + trvTt + ", trvPc=" + trvPc + ", trvX="
				+ trvX + ", trvY=" + trvY + ", trvSdt=" + trvSdt + ", trvEdt=" + trvEdt + ", trvCt=" + trvCt
				+ ", trvOp=" + trvOp + "]";
	}
}
