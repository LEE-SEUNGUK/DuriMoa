package com.ugi.durimoa.member.vo;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class CoupleInfoVO {
	
	private String memId;
	private String memNm;
	private String memImg;
	private String copNm;
	private String copDt;

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

	public String getCopNm() {
		return copNm;
	}

	public void setCopNm(String copNm) {
		this.copNm = copNm;
	}

	public String getCopDt() {
		return copDt;
	}

	public void setCopDt(String copDt) {
		this.copDt = copDt;
	}

	// D-day 계산 메서드
    public long calculateDDay() {
        LocalDate coupleDate = LocalDate.parse(copDt);  // copDt를 LocalDate로 변환
        LocalDate currentDate = LocalDate.now();  // 현재 날짜
        
        return ChronoUnit.DAYS.between(coupleDate, currentDate);  // D-day 계산
    }
    
    // D-day 형식으로 반환
    public String getFormattedDDay() {
        long dDay = calculateDDay();
        if (dDay >= 0) {
            return "D+" + dDay;
        } else {
            return "D" + dDay;
        }
    }
	
	@Override
	public String toString() {
		return "CoupleInfoVO [memId=" + memId + ", memNm=" + memNm + ", memImg=" + memImg + ", copNm=" + copNm
				+ ", copDt=" + copDt + "]";
	}
}