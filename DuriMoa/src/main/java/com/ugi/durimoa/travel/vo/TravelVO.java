package com.ugi.durimoa.travel.vo;

public class TravelVO {

	private int trvId;
	private String memId;
	private String trvTt;
	private String trvPc;
	private String trvX;
	private String trvY;
	private String trvDt;
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



	@Override
	public String toString() {
		return "TravelVO [trvId=" + trvId + ", memId=" + memId  + ", trvTt=" + trvTt + ", trvPc="
				+ trvPc + ", trvX=" + trvX + ", trvY=" + trvY + ", trvDt=" + trvDt + ", trvCt=" + trvCt + ", trvOp="
				+ trvOp + "]";
	}

}
