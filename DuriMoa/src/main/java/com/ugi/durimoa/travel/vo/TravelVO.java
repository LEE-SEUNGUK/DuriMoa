package com.ugi.durimoa.travel.vo;

public class TravelVO {

	private int trvId;
    private String memId;
    private int copId;
    private String trvTt;
    private String trvPc;
    private Double trvX;
    private Double trvY;
    private String trvDt;
    private String trvCt;
    private String trvOp;
    private String trvPt;
    
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
	public int getCopId() {
		return copId;
	}
	public void setCopId(int copId) {
		this.copId = copId;
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
	public String getTrvPt() {
		return trvPt;
	}
	public void setTrvPt(String trvPt) {
		this.trvPt = trvPt;
	}

	@Override
	public String toString() {
		return "TravelVO [trvId=" + trvId + ", memId=" + memId + ", copId=" + copId + ", trvTt=" + trvTt + ", trvPc="
				+ trvPc + ", trvX=" + trvX + ", trvY=" + trvY + ", trvDt=" + trvDt + ", trvCt=" + trvCt + ", trvOp="
				+ trvOp + ", trvPt=" + trvPt + "]";
	}

}
