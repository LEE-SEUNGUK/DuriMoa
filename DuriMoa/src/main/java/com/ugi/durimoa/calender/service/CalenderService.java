package com.ugi.durimoa.calender.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ugi.durimoa.calender.dao.ICalenderDAO;
import com.ugi.durimoa.calender.vo.CalenderVO;

@Service
public class CalenderService {

	@Autowired // 의존성 주입
	ICalenderDAO dao;

	public void calenderAdd(CalenderVO vo) {
		System.out.println("여행 추가");

		dao.calenderAdd(vo);

	};

	// 전체 일정 조회
	public ArrayList<CalenderVO> calenderShow(String memId) {
		System.out.println("전체 일정 조회");

		ArrayList<CalenderVO> vo = dao.calenderShow(memId);

		return vo;
	};
	
	// 일정 수정
	public void calenderUpdate(CalenderVO vo) {
		System.out.println("일정 수정");
		
		dao.calenderUpdate(vo);
	};
	
	// 일정 삭제
	public void calenderDel(CalenderVO vo) {
		System.out.println("일정 삭제");
		
		dao.calenderDel(vo);
	};
}
