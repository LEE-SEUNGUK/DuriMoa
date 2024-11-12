package com.ugi.durimoa.calender.vo;

public class CalenderVO {

	private String calId;
	private String memId;
	private String calTt;
	private String calPc;
	private Double calX;
	private Double calY;
	private String calSdt;
	private String calEdt;

	public String getCalId() {
		return calId;
	}

	public void setCalId(String calId) {
		this.calId = calId;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getCalTt() {
		return calTt;
	}

	public void setCalTt(String calTt) {
		this.calTt = calTt;
	}

	public String getCalPc() {
		return calPc;
	}

	public void setCalPc(String calPc) {
		this.calPc = calPc;
	}

	public Double getCalX() {
		return calX;
	}

	public void setCalX(Double calX) {
		this.calX = calX;
	}

	public Double getCalY() {
		return calY;
	}

	public void setCalY(Double calY) {
		this.calY = calY;
	}

	public String getCalSdt() {
		return calSdt;
	}

	public void setCalSdt(String calSdt) {
		this.calSdt = calSdt;
	}

	public String getCalEdt() {
		return calEdt;
	}

	public void setCalEdt(String calEdt) {
		this.calEdt = calEdt;
	}

	@Override
	public String toString() {
		return "CalenderVO [calId=" + calId + ", memId=" + memId + ", calTt=" + calTt + ", calPc=" + calPc + ", calX="
				+ calX + ", calY=" + calY + ", calSdt=" + calSdt + ", calEdt=" + calEdt + "]";
	}

}